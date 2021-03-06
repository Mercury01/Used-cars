package org.bmema.usedcars.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.bmema.usedcars.dao.Dao;
import org.bmema.usedcars.entity.Criteria;
//import org.bmema.usedcars.entity.Criteria;
import org.bmema.usedcars.entity.User;
import org.bmema.usedcars.entity.Vehicle;
import org.bmema.usedcars.security.SecurityService;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;
import org.springframework.web.servlet.view.JstlView;

@Controller
public class VehicleController {
	protected static Logger logger = Logger.getLogger("controller");

	@Autowired(required=true)
	private Dao dao;
	
	@Autowired(required=true)
	private ObjectMapper jacksonMapper;
	
	@Autowired(required=true) 
	private SecurityService securityService;
	
	public VehicleController() {
		super();
	}

//	public VehicleController(Dao dao, ObjectMapper jacksonMapper,
//			SecurityService securityService) {
//		super();
//		this.dao = dao;
//		this.jacksonMapper = jacksonMapper;
//		this.securityService = securityService;
//	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void getHomePage() {
		logger.info("Received request to show the home page");
//		return "home";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String getLoginPage(HttpServletResponse request) {
//		logger.info("Received request to show the login page ASDASD");
////		try {
////			request.sendRedirect("partials/login.jsp");
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
//		return "login";
//	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public @ResponseBody String registerUser(@RequestBody String request) {
			String username = "Unknown";
		try {
			User user = jacksonMapper.readValue(request, User.class);
			username = user.getUsername();
			logger.info("Received request register user: " + username);
			securityService.registerUser(user);
			return "Success";
		} catch (Exception e) {
			logger.error("Unable to register user: " + username, e);
			return "Error";
		}
	}
	
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public String getDeniedPage() {
		logger.info("Received request to show the access denied page");
		return "denied";
	}
	
	@RequestMapping(value = "/vehicleDetails/{licensePlate}", method = RequestMethod.GET)
	public @ResponseBody String get(@PathVariable String licensePlate, Model model, Principal principal) {
		logger.info("Received request to retrieve a vehicle");
		
		try {
			Vehicle result = dao.getVehicle(licensePlate);
			if(result.getOwner() != null && principal != null && 
					result.getOwner().equalsIgnoreCase(principal.getName())) 
			{
				result.setEditable(true);
			} else {
				result.setEditable(false);
			}
			return jacksonMapper.writeValueAsString(result);
		} catch (IOException e) {
			logger.error("Cannot parse JSON respone", e);
			return "Error";
		}
	}
	
	@RequestMapping(value="/updateVehicle/{licensePlate}", method = RequestMethod.POST)
	public @ResponseBody String update(@PathVariable String licensePlate, 
			@RequestBody String request, HttpServletResponse response) {
		String responseString = "Success";
		try {
			Vehicle vehicle = jacksonMapper.readValue(request, Vehicle.class);
			if(dao.updateVehicle(vehicle)) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				responseString = "Cannot update vehicle with license plate: " + licensePlate;
			}
		} catch (IOException e) {
			logger.error("Unable to parse request", e);
			responseString = "Unable to parse request";
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
		}
		
		return responseString;
	}
	
	@RequestMapping(value="/deleteVehicle/{licensePlate}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable String licensePlate, HttpServletResponse response) {
		String responseString = "Success";
		try {
			if(dao.deleteVehicle(licensePlate)) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				responseString = "Cannot delete vehicle with license plate: " + licensePlate;
			}
		} catch (Exception e) {
			logger.error("Unable to delete vehicle", e);
			responseString = "Cannot delete vehicle with license plate: " + licensePlate;
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
		}
		
		return responseString;
	}
	
	//TODO not necessary
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearch() {
		logger.info("Received request to show the search page");
		return "search";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody String search(@RequestBody String request) {
		logger.info("Received request to search for vehicles");
		
		logger.info(request);
		
		try {
			Criteria criteria = jacksonMapper.readValue(request, Criteria.class);
			return jacksonMapper.writeValueAsString(dao.getVehicles(criteria));
//			List<Vehicle> list = new ArrayList<Vehicle>();
//			list.add(new Vehicle());
//			return jacksonMapper.writeValueAsString(list);
		} catch (IOException e) {
			logger.error("Cannot parse JSON request / respone", e);
			return "Error";
		}
	}

	
	@RequestMapping(value="/top/{amount}", method = RequestMethod.GET)
	public @ResponseBody String top(@PathVariable int amount) {
		logger.info("Received request to get top " + amount + " vehicles");
		
		try {
			return jacksonMapper.writeValueAsString(dao.getTopVehicles(amount));
		} catch (IOException e) {
			logger.error("Cannot parse JSON respone", e);
			return "Error";
		}
	}

//	@RequestMapping(value = "/add", method = RequestMethod.GET)
//	public String getAdd(@RequestBody String request) {	
//		logger.info("Received request to show the add page");
//		return "add"; 
//	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody String add(@RequestBody String request, Principal principal) {
		logger.info("Received request to add a vehicle");
		
		logger.info(request);
		
		try {
			Vehicle vehicle = jacksonMapper.readValue(request, Vehicle.class);
			vehicle.setOwner(principal.getName());
			if(dao.addVehicle(vehicle)) {
				return "Success";
			} else {
				return "Error";
				
			}
		} catch (IOException e) {
			logger.error("Cannot parse JSON request", e);
			return "Error";
		}
	}
	
//	@RequestMapping(value="/tumbnail/{licensePlate}", method = RequestMethod.GET)
//	public @ResponseBody String getThumbnail(@PathVariable String licensePlate) {
//		
////		Image image = dao.getThumbnail(licensePlate);
//		
//		return null;
//	}
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public @ResponseBody String uploadImage(MultipartHttpServletRequest request) {
		try{
			if(saveImage(request)) {
				return "Success";
			} else {
				return "Error";
			}
		} catch (Exception e) {
			return "Error";
		}
	}
	
	private boolean saveImage(MultipartHttpServletRequest request) {
			String licensePlate = (String) request.getParameter("licensePlate");
			MultipartFile image = (MultipartFile) request.getFile("image");
			return dao.insertImage(licensePlate, image);
	}

	public Dao getDao() {
		return dao;
	}

//	@Required
	public void setDao(Dao dao) {
		this.dao = dao;
	}

	public ObjectMapper getJacksonMapper() {
		return jacksonMapper;
	}

//	@Required
	public void setJacksonMapper(ObjectMapper jacksonMapper) {
		this.jacksonMapper = jacksonMapper;
	}

	public SecurityService getSecurityService() {
		return securityService;
	}
	
//	@Required
	public void setSecurityService(SecurityService securityService) {
		this.securityService = securityService;
	}
	
	
	
//	@RequestMapping(value = "/search", method = RequestMethod.POST)			//with Jacksonmapping
//	public String postSearch(@ModelAttribute("vehicle") Vehicle criteria) {
//		logger.debug("Received request to search for search poi");
//		 
//		List<Poi> result = poiService.search(criteria);
//
//		return "home";
//	}
	
	
	
}

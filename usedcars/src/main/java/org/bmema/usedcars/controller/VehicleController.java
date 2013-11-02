package org.bmema.usedcars.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.bmema.usedcars.dao.Dao;
import org.bmema.usedcars.entity.Criteria;
import org.bmema.usedcars.entity.Vehicle;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class VehicleController {
	protected static Logger logger = Logger.getLogger("controller");

	@Autowired
	private Dao dao;
	
	@Autowired
	ObjectMapper jacksonMapper;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHomePage() {
		logger.info("Received request to show the home page");
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLoginPage() {
		logger.info("Received request to show the login page");
		return "login";
	}
	
	@RequestMapping(value = "/denied", method = RequestMethod.GET)
	public String getDeniedPage() {
		logger.info("Received request to show the access denied page");
		return "denied";
	}
	
	@RequestMapping(value = "/vehicleDetails/{licensePlate}", method = RequestMethod.GET)
	public @ResponseBody String get(@PathVariable String licensePlate, Model model) {
		logger.info("	Received request to retrieve a vehicle");
		
		try {
			return jacksonMapper.writeValueAsString(dao.getVehicle(licensePlate));
		} catch (IOException e) {
			logger.error("Cannot parse JSON respone", e);
			return "Error";
		}
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody String search(@RequestBody String request) {
		logger.info("Received request to search for vehicles");
		
		logger.info(request);
		
		try {
			Criteria criteria = jacksonMapper.readValue(request, Criteria.class);
			//return jacksonMapper.writeValueAsString(dao.getVehicles(criteria));
			List<Vehicle> list = new ArrayList<Vehicle>();
			list.add(new Vehicle());
			return jacksonMapper.writeValueAsString(list);
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

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody String add(@RequestBody String request) {
		logger.info("Received request to add a vehicle");
		
		logger.info(request);
		
		try {
			Vehicle vehicle = jacksonMapper.readValue(request, Vehicle.class);
			if(true) { //dao.addVehicle(vehicle)) {
				return "Success";
			} else {
				return "Error";
				
			}
		} catch (IOException e) {
			logger.error("Cannot parse JSON request", e);
			return "Error";
		}
	}
	
	@RequestMapping(value="/tumbnail/{licensePlate}", method = RequestMethod.GET)
	public @ResponseBody String getThumbnail(@PathVariable String licensePlate) {
		
//		Image image = dao.getThumbnail(licensePlate);
		
		return null;
	}
	
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
			String licensePlate = "asd-123"; //TODO (String) request.getParameter("licensePlate");
			MultipartFile image = (MultipartFile) request.getFile("image");
			return dao.insertImage(licensePlate, image);
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

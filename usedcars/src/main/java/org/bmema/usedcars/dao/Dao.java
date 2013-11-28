package org.bmema.usedcars.dao;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javassist.NotFoundException;

import org.apache.log4j.Logger;
import org.bmema.usedcars.entity.Criteria;
import org.bmema.usedcars.entity.User;
import org.bmema.usedcars.entity.Vehicle;
import org.bmema.usedcars.service.ImageService;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

//@Repository
@Transactional
@EnableTransactionManagement(mode = AdviceMode.ASPECTJ)
public class Dao {

	protected static Logger logger = Logger.getLogger("dao");
	
//	@Autowired
	private SessionFactory sessionFactory;
	
//	@Autowired
	ImageService imageService;
	
	
	
	public Dao() {
		super();
	}

	public Dao(SessionFactory sessionFactory, ImageService imageService) {
		super();
		this.sessionFactory = sessionFactory;
		this.imageService = imageService;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Required
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public Vehicle getVehicle(String licensePlate) {
		try {
			return (Vehicle) sessionFactory.getCurrentSession().get(Vehicle.class, licensePlate);
		} catch (Exception e) {
			logger.error("Unable to get vehicle with license plate: " + licensePlate, e);
			return null;
		}
	}

	public List<Vehicle> getVehicles(Criteria criteria) 
	{
		logger.debug("Received request to search for a vehicles with criteria: " + criteria.toString());
		
//		String queryString = "SELECT * FROM vehicle WHERE price BETWEEN :price_min AND :price_max AND "
//							+ "year BETWEEN :year_min AND :year_max";
		final String queryBase = "SELECT * FROM vehicle "
				+ "WHERE price BETWEEN :price_min AND :price_max AND "
				+ "year BETWEEN :year_min AND :year_max";
		
		StringBuilder queryBuilder = new StringBuilder(queryBase);
		
		if(criteria.getType() != null && !criteria.getType().equals("") && !criteria.getType().equals("Bármelyik")) {
			queryBuilder.append(" AND type = :type");
		}
		
		if(criteria.getBrand() != null && !criteria.getBrand().equals("") && !criteria.getBrand().equals("Bármelyik")) {
			queryBuilder.append(" AND brand = :brand");
		}
		
		if (criteria.getModel() != null && !criteria.getModel().equals("") && !criteria.getModel().equals("Bármelyik")) {
			queryBuilder.append(" AND model = :model");
		}
		
		if (criteria.getColor() != null && !criteria.getColor().equals("") && !criteria.getColor().equals("Bármelyik")) {
			queryBuilder.append(" AND color = :color");
		}
		
		if (criteria.getFuel() != null && !criteria.getFuel().equals("") && !criteria.getFuel().equals("Bármelyik")) {
			queryBuilder.append(" AND fuel = :fuel");
		}
		
		if (criteria.getDoorNum() != 0) {
			queryBuilder.append(" AND doorNum = :doorNum");
		}
		
		Query query = sessionFactory.getCurrentSession().createSQLQuery(queryBuilder.toString()).addEntity(Vehicle.class);
		
		query.setParameter("price_min", criteria.getPrice_min());
		query.setParameter("price_max", criteria.getPrice_max());
	
		query.setParameter("year_min", criteria.getYear_min());
		query.setParameter("year_max", criteria.getYear_max());
		
		if(criteria.getType() != null && !criteria.getType().equals("") && !criteria.getType().equals("Bármelyik")) {
			query.setParameter("type", criteria.getType());
		}
		
		if(criteria.getBrand() != null && !criteria.getBrand().equals("") && !criteria.getBrand().equals("Bármelyik")) {
			query.setParameter("brand", criteria.getBrand());
		}
		
		if (criteria.getModel() != null && !criteria.getModel().equals("") && !criteria.getModel().equals("Bármelyik")) {
			query.setParameter("model", criteria.getModel());
		}
		
		if (criteria.getColor() != null && !criteria.getColor().equals("") && !criteria.getColor().equals("Bármelyik")) {
			query.setParameter("color", criteria.getColor());
		}
		
		if (criteria.getFuel() != null && !criteria.getFuel().equals("") && !criteria.getFuel().equals("Bármelyik")) {
			query.setParameter("fuel", criteria.getFuel());
		}
		
		if (criteria.getDoorNum() != 0) {
			query.setParameter("doorNum", criteria.getDoorNum());
		}
		
//		String queryString = "SELECT * FROM vehicle "
//				+ "WHERE price BETWEEN :price_min AND :price_max AND "
//				+ "year BETWEEN :year_min AND :year_max AND "
//				+ "type = :type AND "
//				+ "brand = :brand AND "
//				+ "model = :model AND "
//				+ "color = :color AND "
//				+ "fuel = :fuel AND "
//				+ "doorNum = :doorNum";
		
//		Query query = sessionFactory.getCurrentSession().createSQLQuery(queryString).addEntity(Vehicle.class);
//		query.setParameter("price_min", criteria.getPrice_min());
//		query.setParameter("price_max", criteria.getPrice_max());
////		
//		query.setParameter("year_min", criteria.getYear_min());
//		query.setParameter("year_max", criteria.getYear_max());
		
		List<Vehicle> result = (List<Vehicle>) query.list();
		return result;
	}

	public List<Vehicle> getTopVehicles(int amount) {
		try {
			final String queryString = "from Vehicle order by vehicleId desc";
			Session session = sessionFactory.getCurrentSession();
			List<Vehicle> list = (List<Vehicle>)session.createQuery(queryString).setMaxResults(amount).list();
			for(Vehicle v : list) {
				v.setThumbnail();
			}
			return list;
		} catch (Exception e) {
			logger.error("Unable to fetch last " + amount + " vehicles", e);
			return null;
		}
	}

	public boolean addVehicle(Vehicle vehicle) {
		try {
			sessionFactory.getCurrentSession().save(vehicle);
			return true;
		} catch (HibernateException e) {
			logger.error("Unable to save vehicle", e);
			return false;
		}
	}
	
	public boolean updateVehicle(Vehicle vehicle) {
		try {
			Vehicle original = getVehicle(vehicle.getLicensePlate());
			vehicle.setOwner(original.getOwner());
			vehicle.setPicture(original.getPicture());
			vehicle.setThumbnail();
			sessionFactory.getCurrentSession().merge(vehicle);
//			sessionFactory.getCurrentSession().update(vehicle);
			return true;
		} catch (HibernateException e) {
			logger.error("Unable to update vehicle", e);
			return false;
		}
	}

	public boolean deleteVehicle(String licensePlate) {
		logger.info("Deleting vehicle with l. plate: " + licensePlate);
		try {
			Vehicle vehicle = getVehicle(licensePlate);
			sessionFactory.getCurrentSession().delete(vehicle);
			return true;
		} catch (HibernateException e) {
			logger.error("Unable to update vehicle", e);
			return false;
		}
	}
	
	public User getUser(String username) throws NotFoundException {
		try {
			return (User) sessionFactory.getCurrentSession().get(User.class, username);
		} catch (Exception e) {
			logger.error("Unable to get user with username: " + username, e);
			throw new NotFoundException("No user with name " + username);
		}
	}
	
	public boolean insertImage(String licensePlate, MultipartFile image) {
	
		String imagePath = persistImageAndThumbnail(image, ImageService.PERSISTENCE_PATH);
		String queryString = "UPDATE Vehicle v SET v.picture=:picture WHERE v.licensePlate=:licensePlate";
		
		if(imagePath == null) {
			logger.error("Cannot insert image");
			return false;
		}
		
		try {	
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(queryString);
			query.setParameter("picture", imagePath);
			query.setParameter("licensePlate", licensePlate);
			
			int result = query.executeUpdate();
			
			if( result == 1 ) {
				return true;
			} else {
				logger.warn("Inserted image into multiple vehicles.\n" +
							"An error exists in the database. \n" +
							"License plate attribute may not be unique");
				return false; 
			}
		} catch (Exception e) {
			logger.error("Cannot insert image", e);
			return false;
		}
	}
	
	private String persistImageAndThumbnail(MultipartFile file, String path) {
		File persistedFile, parentFile;
		
		if(file == null) {
			return null;
		}
		
		try {
			boolean fileComplete = false;
			int attempt = 0;
			do {
				attempt++;
				if(attempt > 1) {
					persistedFile = new File(path + insertTimeStamp(file.getOriginalFilename()));
				} else {
					persistedFile = new File(path + file.getOriginalFilename());
				}
				parentFile = new File(persistedFile.getParent());
				parentFile.mkdirs();
				fileComplete = persistedFile.createNewFile();
			} while (!fileComplete && attempt < 2);

			if(fileComplete) {
				//FileUtils.copyFile(srcFile, destFile);
				file.transferTo(persistedFile);
				logger.info("File persisted: " + persistedFile.getPath());
				if(!imageService.createThumbnailFile(persistedFile)) {
					logger.error("Unable to create thumbnail for file: " + file.getOriginalFilename());
				}	
				return ImageService.CONTEXT_PATH + persistedFile.getName(); //persistedFile.getPath();
			} else {
				logger.error("Unable to persist file: " + file.getOriginalFilename());
				return null;
			}
			
		} catch (Exception e) {
			logger.error("Unable to persist file: " + file.getOriginalFilename(), e);
			return null;
		}
	}
	
	/**
	 * 
	 * @param fileName
	 * @return file name with timestamp (filename_datetime.format)
	 */
	private String insertTimeStamp(String fileName) {
		Date dateNow = new Date();
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = df.format(dateNow);
		StringBuilder sb = new StringBuilder(fileName);
		sb.insert(fileName.lastIndexOf('.'), "_" + timestamp);
		return sb.toString();
	}

	public boolean addUser(User user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			return true;
		} catch (Exception e) {
			logger.error("Unable to add user \"" + user.getUsername() + "\"");
			return false;
		}
	}
	
	
	
	
}

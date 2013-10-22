package org.bmema.usedcars.dao;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileSystemUtils;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.bmema.usedcars.entity.Criteria;
import org.bmema.usedcars.entity.Vehicle;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Repository
public class Dao {

	protected static Logger logger = Logger.getLogger("Dao");
	
	@Autowired
	private SessionFactory sessionFactory;

	private final String PERSISTENCE_PATH = "C:\\dev\\usedcars\\images\\";
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
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
		
		String queryString = "SELECT * FROM vehicle WHERE price BETWEEN :price_min AND :price_max AND "
							+ "year BETWEEN :year_min AND :year_max";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(queryString).addEntity(Vehicle.class);
		query.setParameter("price_min", criteria.getPrice_min());
		query.setParameter("price_max", criteria.getPrice_max());
		
		query.setParameter("year_min", criteria.getYear_min());
		query.setParameter("year_max", criteria.getYear_max());
		
		List<Vehicle> result = (List<Vehicle>) query.list();
		return result;
	}

	public List<Vehicle> getTopVehicles(int amount) {
		try {
			final String queryString = "from Vehicle order by vehicleId desc";
			Session session = sessionFactory.getCurrentSession();
			//List<Vehicle> list = session.createQuery(queryString).setMaxResults(amount).list();
			return (List<Vehicle>) session.createQuery(queryString).setMaxResults(amount).list();
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

	public Image getThumbnail(String licensePlate) {
		BufferedImage image = getImage(licensePlate);
		BufferedImage scaledImage = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics = null;
		
		try {
			graphics = image.createGraphics();
			graphics.drawImage(scaledImage, 0, 0, 100, 100, null);
			return scaledImage;
		} catch (Exception e) {
			logger.error("Unable to resize image for thumbnail.", e);
			return null;
		} finally {
			if(graphics != null) {
				graphics.dispose();
			}
		}
	}
	
	public BufferedImage getImage(String licensePlate) {
		try {
			Vehicle vehicle = getVehicle(licensePlate);
			File imageFile = new File(vehicle.getPicture());
			return ImageIO.read(imageFile);
		} catch (Exception e) {
			logger.error("Unable to load image", e);
			return null;
		}
	}
	
	public boolean insertImage(String licensePlate, MultipartFile image) {
	
		String imagePath = persistFile(image, PERSISTENCE_PATH);
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
			
			String[] s = query.getNamedParameters();
			
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
	
	private String persistFile(MultipartFile file, String path) {
		File persistedFile;
		
		if(file == null) {
			return null;
		}
		
		try {
			persistedFile = new File(path + file.getOriginalFilename());
			if(!persistedFile.mkdirs() || !persistedFile.createNewFile()) {
				return null;
			}
			
			file.transferTo(persistedFile);
			logger.info("File persisted: " + persistedFile.getPath());
			return persistedFile.getPath();
		} catch (Exception e) {
			logger.error("Unable to persist file: " + file.getOriginalFilename(), e);
			return null;
		}
		
	}
}

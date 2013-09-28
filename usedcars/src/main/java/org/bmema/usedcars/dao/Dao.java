package org.bmema.usedcars.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.bmema.usedcars.entity.Vehicle;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class Dao {

	protected static Logger logger = Logger.getLogger("Dao");
	
	@Autowired
	private SessionFactory sessionFactory;
	
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

	public List<Vehicle> getVehicles(Vehicle criteria) {
		try {
			criteria.toString();
		} catch (Exception e) {
			logger.error("Unable to get vehicles based on criteria: " + criteria.toString(), e);
		}
		return null;
	}
	
//	public Poi getPoi(Integer id) {
//		logger.info("Received request to retrieve a poi from the database");
//		
//		Poi poi = null;
//		try {
//			poi = (Poi) sessionFactory.getCurrentSession().get(Poi.class, id);
//		} catch (HibernateException e) {
//			logger.error("Unable to load poi from database", e);
//		}
//		return poi;
//	}
//	
//	public boolean addPoi(Poi poi) {
//		logger.info("Received request to add poi to database.");
//		
//		try {
//			sessionFactory.getCurrentSession().save(poi);
//			return true;
//		} catch (HibernateException e) {
//			logger.error("Unable to add poi to database.", e);
//			return false;
//		}
//	}
//	
//	public boolean updatePoi(Poi poi) {
//		logger.info("Received request to update poi in database.");
//		
//		try {
//			sessionFactory.getCurrentSession().update(poi);
//			return true;
//		} catch (HibernateException e) {
//			logger.error("Unable to add poi to database.", e);
//			return false;
//		}
//	}
//	
//	@SuppressWarnings("unchecked")	// the result list of the query may contain any kind of object, not only Pois
//	public List<Poi> search(Poi criteria) {
//		logger.debug("Received request to search for a poi in the database");
//		
//		Query query = sessionFactory.getCurrentSession().getNamedQuery("poi.search");
//		query.setParameter("name", "%" + criteria.getName() + "%");
//		query.setParameter("type", "%" + criteria.getType() + "%");
//		query.setParameter("address", "%" + criteria.getAddress() + "%");
//		
//		return query.list();
//	}
//	
//	public User getUser(String username) throws NotFoundException{
//		logger.info("Received request to retrieve a user from the database.");
//		
//		User user = null;
//		try {
//			user = (User) sessionFactory.getCurrentSession().get(User.class, username);
//			if(user == null)
//				throw new NotFoundException("No such user.");
//		} catch (HibernateException e) {
//			logger.error("Unable to load user from database.", e);
//		} 
//		return user;
//	}
//
//	public void addUser(User user) {
//		logger.info("Received request to add user to database.");
//		
//		try {
//			sessionFactory.getCurrentSession().save(user);
//		} catch (HibernateException e) {
//			logger.error("Unable to add user to database.", e);
//		}
//	}
}

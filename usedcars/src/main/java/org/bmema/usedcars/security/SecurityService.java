package org.bmema.usedcars.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javassist.NotFoundException;

import org.apache.log4j.Logger;
import org.bmema.usedcars.dao.Dao;
import org.bmema.usedcars.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
// @Transactional(readOnly = true)
public class SecurityService implements UserDetailsService {

	protected static Logger logger = Logger.getLogger("Security Service");
	
	@Autowired
	private ShaPasswordEncoder passwordEncoder;
	
	@Autowired
	private Dao dao;

	public boolean registerUser(User user) {
		user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
		return dao.addUser(user);
	}
	
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		logger.info("Loading user with username: " + username);
		UserDetails user = null;

		try {
			User dbUser = dao.getUser(username);
			user = new org.springframework.security.core.userdetails.User(
					dbUser.getUsername(), dbUser.getPassword().toLowerCase(),
					true, true, true, true, getAuthorities(dbUser.getAccess()));
			logger.info(dbUser.getUsername() + " "
					+ dbUser.getPassword().toLowerCase()
					+ getAuthorities(dbUser.getAccess()));
		} catch (NotFoundException e) {
			logger.error("Error retrieving user", e);
		} catch (Exception e) {
			logger.error("Error retrieving user", e);
		}
		return user;
	}

	/**
	 * Retrieves the correct ROLE type depending on the access level, where
	 * access level is an Integer. Basically, this interprets the access value
	 * whether it's for a regular user or admin.
	 * 
	 * @param access
	 *            an integer value representing the access of the user
	 * @return collection of granted authorities
	 */
	public Collection<GrantedAuthority> getAuthorities(Integer access) {

		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>(2);

		/** All users are granted with ROLE_USER access */
		logger.info("Grant ROLE_USER to this user");
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));

		/**
		 * Check if this user has admin access We interpret Integer(1) as an
		 * admin user
		 */
		if (access.compareTo(1) == 0) {
			logger.info("Grant ROLE_ADMIN to this user");
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}

		return authList;
	}

	public Dao getDao() {
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	public ShaPasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}

	public void setPasswordEncoder(ShaPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	

}

package com.ozai.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.AdminDAO;
import com.ozai.dao.UserDAO;
import com.ozai.model.Admin;
import com.ozai.model.Badges;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.User;
import com.ozai.util.OzaiUtil;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	UserDAO userDao;
	
	@Override
	public User validateUser(String username, String password) {
		return userDao.validateUser(username, password);
	}

	@Override
	public Integer getUserRentAmount(String username) {
		return userDao.getUserRentAmount(username);
	}

	@Override
	public boolean isMobileExist(String mobile) {
		return userDao.isMobileExist(mobile);
	}

	@Override
	public Integer saveUser(User user) {
		return userDao.saveUser(user);
	}

	@Override
	public User getUserDetails(String mobile) {
		return userDao.getUserDetails(mobile);
	}

	@Override
	public boolean updateUser(User user) {
		return userDao.updateUser(user);
	}
	
	@Override
	public User validateUserDetails(String username, String password) {
		return userDao.validateUserDetails(username, password);
	}

	@Override
	public boolean isUserScheduledVisit(String user_id) {
		return userDao.isUserScheduledVisit(user_id);
	}

	@Override
	public boolean scheduleVisit(ScheduleVisit visit) {
		return userDao.scheduleVisit(visit);
	}

	@Override
	public User getUserDetailsById(int id) {
		return userDao.getUserDetailsById(id);
	}

	@Override
	public List<ScheduleVisit> getVisitsList(String id) {
		return userDao.getVisitsList(id);
	}

	@Override
	public boolean updateUserRentalCreditScore(int user_id, int rating, int increase) {
		return userDao.updateUserRentalCreditScore(user_id, rating, increase);
	}

	@Override
	public int getUserRating(int user_id) {
		return userDao.getUserRating(user_id);
	}

	@Override
	public boolean saveServiceRequest(Service_Request request) {
		return userDao.saveServiceRequest(request);
	}

	@Override
	public List<Badges> getUserBadges(int id, int limit) {
		return userDao.getUserBadges(id, limit);
	}
	
}

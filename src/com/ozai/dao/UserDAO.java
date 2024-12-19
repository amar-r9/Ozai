package com.ozai.dao;

import java.sql.SQLException;
import java.util.List;

import com.ozai.model.Admin;
import com.ozai.model.Badges;
import com.ozai.model.BlogArticle;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.User;

public interface UserDAO {
	
	public User validateUser(String username, String password);

	public Integer getUserRentAmount(String username);

	public boolean isMobileExist(String mobile);

	public Integer saveUser(User user);

	public User getUserDetails(String mobile);

	public boolean updateUser(User user);

	public User validateUserDetails(String username, String password);

	public boolean isUserScheduledVisit(String user_id);

	public boolean scheduleVisit(ScheduleVisit visit);

	public User getUserDetailsById(int id);

	public List<ScheduleVisit> getVisitsList(String id);

	public boolean updateUserRentalCreditScore(int user_id, int rating, int increase);

	public int getUserRating(int user_id);

	public boolean saveServiceRequest(Service_Request request);

	public List<Badges> getUserBadges(int id, int limit);
	
}

package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.Admin;
import com.ozai.model.Badges;
import com.ozai.model.Loan;
import com.ozai.model.Property_Ratings;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.Talent;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User validateUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		User other = null;
		try {
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("username", username));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.eq("active", 1));
			other = (User) criteria.uniqueResult();
			
			if (other != null && other.getUsername() != null
					&& !other.getUsername().isEmpty()) {
				if (other.getPassword().equals(password)) {
					return other;
				}

			} else
				return null;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

		return null;
	}
	
	@Override
	public Integer getUserRentAmount(String username) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(User.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("username"),
					Restrictions.eq("username", username));
			Criterion status = Restrictions.isNull("moveout_date");
			criteria.add(Restrictions.and(scode, status));
			criteria.setProjection(Projections.property("rent"));
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean isMobileExist(String mobile) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(User.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("mobile", mobile)));
			criteria.add(Restrictions.eq("active", 1));
			
			User user = (User) criteria.uniqueResult();

			if (user != null)
				return true;
			else
				return false;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	
	}
	
	@Override
	public Integer saveUser(User user) {
		System.out.println("Save User Password :"+user.getPassword());
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(user);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public User getUserDetails(String username) {
		Session session = sessionFactory.getCurrentSession();
		User user = null;
		try {

			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("username", username));
			user = (User) criteria.uniqueResult();

			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public boolean updateUser(User other) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(other);
			session.flush();
			session.refresh(other);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public User validateUserDetails(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		User user = null;
		try {
			System.out.println("\n"+username+password);
			
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("username", username));
			criteria.add(Restrictions.eq("active", 1));
			user = (User) criteria.uniqueResult();
			
			if (user != null && user.getUsername() != null
					&& !user.getUsername().isEmpty()) {
				if (user.getPassword().equals(password)) {
					return user;
				}

			} else
				return null;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean scheduleVisit(ScheduleVisit visit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(visit);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean isUserScheduledVisit(String id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(ScheduleVisit.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("user_id", id)));
			
			ScheduleVisit loan = (ScheduleVisit) criteria.uniqueResult();

			if (loan != null)
				return true;
			else
				return false;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	
	}
	
	@Override
	public User getUserDetailsById(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = null;
		try {

			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("id", id));
			user = (User) criteria.uniqueResult();

			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<ScheduleVisit> getVisitsList(String id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(ScheduleVisit.class);
			criteria.add(Restrictions.eq("user_id", id));
			criteria.addOrder(Order.asc("id"));

			List<ScheduleVisit> events = criteria.list();

			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateUserRentalCreditScore(int user_id, int rating, int increase) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//int score = getUserRating(user_id);
			Criteria criteria = session.createCriteria(User_Ratings.class);
			criteria.add(Restrictions.eq("user_id", user_id));
			User_Ratings ratings = (User_Ratings) criteria.uniqueResult();
			if(ratings!=null) {
				if(increase!=0) {
					ratings.setRating(ratings.getRating()+rating);
				} else {
					ratings.setRating(ratings.getRating()-rating);
				}
				session.update(ratings);
			} else {
				User_Ratings rate = new User_Ratings();
				if(increase!=0) {
					rate.setUser_id(user_id);
					rate.setRating(300+rating);
				} else {
					rate.setUser_id(user_id);
					rate.setRating(300-rating);
				}
				session.save(rate);
			}
				
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public int getUserRating(int user_id) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(User_Ratings.class);
	        criteria.add(Restrictions.eq("user_id", user_id));
	        criteria.setProjection(Projections.property("rating"));

	        // Get the result as an Integer to handle null values
	        Integer score = (Integer) criteria.uniqueResult();

	        return score != null ? score : 0;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return 0;
	    }
	}
	
	@Override
	public boolean saveServiceRequest(Service_Request request) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(request);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Badges> getUserBadges(int id, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Badges.class);
			criteria.add(Restrictions.eq("user_id", id));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));

			List<Badges> events = criteria.list();

			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}

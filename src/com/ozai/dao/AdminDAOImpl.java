package com.ozai.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
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

import com.ozai.beans.ResidentsData;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.BlogArticle;
import com.ozai.model.Expenses;
import com.ozai.model.Groceries;
import com.ozai.model.Grocery_Booking;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Admin validateUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Admin other = null;
		try {
			System.out.println("\n"+username+password);
			
			Criteria criteria = session.createCriteria(Admin.class);
			criteria.add(Restrictions.eq("username", username));
			other = (Admin) criteria.uniqueResult();
			
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
	public Integer addResident(User user) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(user);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean updateResidentDetails(User other) {
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
	public B2C_Details getB2CResidentDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Details.class);
			criteria.add(Restrictions.eq("user_id", id));
			criteria.add(Restrictions.isNull("moveout_date"));
			B2C_Details user = (B2C_Details) criteria
					.uniqueResult();
			return user;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<User> getAllResidents() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(User.class);
			
			criteria.addOrder(Order.asc("id"));
			
			List<User> user = criteria.list();

			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<User> getAllB2CResidents() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(User.class);
			
			criteria.addOrder(Order.asc("id"));
			
			List<User> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Details> getActiveB2CResidents(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2C_Details.class);
			
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.eq("admin_id", id));
			criteria.addOrder(Order.asc("user_id"));
			//criteria.setFetchMode("b2c_details", FetchMode.JOIN);
			List<B2C_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public User getResidentDetailsByMobile(String mobile) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("mobile", mobile));
			criteria.add(Restrictions.isNull("moveout_date"));
			User user = (User) criteria
					.uniqueResult();
			return user;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getTicketsList(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Ticket.class);
			
			criteria.add(Restrictions.eq("admin_id", id));
			criteria.addOrder(Order.desc("id"));

			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<Ticket> events = criteria.list();

			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateTicketStatus(int id, String status, String admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Ticket.class);
			criteria.add(Restrictions.eq("id", id));
			Ticket tickets = (Ticket) criteria
					.uniqueResult();
			tickets.setStatus(status);
			Timestamp time = Timestamp.from(Instant.now());
			if(status.equals("Closed")) {
				tickets.setClosed_on(time);
				tickets.setClosed_by(admin);
			} else if(status.equals("In Progress")) {
				tickets.setProgress_on(time);
				tickets.setProgress_by(admin);
			} else if(status.equals("Opened")) {
				tickets.setOpened_on(time);
				tickets.setOpened_by(admin);
			}
			session.update(tickets);
			/*
			 * session.flush(); session.refresh(user);
			 */
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean addCommentsToTicket(String comments, int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Ticket.class);
			criteria.add(Restrictions.eq("id", id));
			Ticket tickets = (Ticket) criteria
					.uniqueResult();
			tickets.setComments(comments);
			session.update(tickets);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public Integer addAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(admin);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean isAdminExist(String username) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(Admin.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("username", username)));
			
			Admin admin = (Admin) criteria.uniqueResult();

			if (admin != null)
				return true;
			else
				return false;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	
	}
	
	@Override
	public List<Admin> getAllB2CAdmins() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Admin.class);
			criteria.addOrder(Order.asc("id"));
			
			List<Admin> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Admin getAdminRoleById(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Admin) session.get(Admin.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateAdminRole(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Admin.class);
			criteria.add(Restrictions.eq("id", admin.getId()));
			Admin ticket = (Admin) criteria
					.uniqueResult();
			ticket.setUsername(admin.getUsername());
			ticket.setPassword(admin.getPassword());
			ticket.setName(admin.getName());
			ticket.setProperty(admin.getProperty());
			ticket.setAccess_level(admin.getAccess_level());
			ticket.setActive(admin.getActive());
			ticket.setClient_code(admin.getClient_code());
			ticket.setClient(admin.getClient());
			//ticket.setEmail(admin.getEmail());
			//ticket.setMobile(admin.getMobile());
			session.update(ticket);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean updateResidentStatus(int id, Date moveout) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(B2C_Details.class);
			criteria.add(Restrictions.eq("user_id", id));
			B2C_Details user = (B2C_Details) criteria
					.uniqueResult();
			user.setMoveout_date(moveout);
			session.update(user);
			
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getRecentTickets(int client_id, int limit) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Ticket.class);
			
			criteria.add(Restrictions.eq("admin_id", client_id));
			criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));
			List<Ticket> tickets = criteria.list();

			return tickets;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getMaxClientCode() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Admin.class);
			criteria.setProjection(Projections.max("client_code"));
			Integer id = (Integer) criteria.uniqueResult();
			if (id != null)
				return id;
			else
				return 1;
		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getAllAdminsByEntity(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Admin.class);
			
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.addOrder(Order.asc("id"));
			List<Admin> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Notice> getNoticeByAdmin(int admin_id, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Notice.class);

			Criterion clientuser = Restrictions.eq("admin_id",
					admin_id);
			criteria.add(Restrictions.and(clientuser));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));

			List<Notice> invoices = criteria.list();

			return invoices;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ResidentsData> getPropertyWiseResidentsDataByAdmin(int client_code) {
	    Session session = sessionFactory.getCurrentSession();
	    List<ResidentsData> residentsDataList = new ArrayList<>();

	    try {
	        String query = "SELECT UPPER(p.name) AS property, COUNT(b.id) AS strength " +
	                       "FROM properties p " +
	                       "JOIN b2c_details b ON p.id = b.property_id " +
	                       "WHERE b.ADMIN_ID = :clientCode " +
	                       "AND b.moveout_date IS NULL " +
	                       "GROUP BY p.name";

	        Query compPointsQuery = session.createSQLQuery(query)
	                                       .addScalar("property", StandardBasicTypes.STRING)
	                                       .addScalar("strength", StandardBasicTypes.INTEGER)
	                                       .setResultTransformer(Transformers.aliasToBean(ResidentsData.class))
	                                       .setParameter("clientCode", client_code);

	        List<ResidentsData> result = compPointsQuery.list();
	        residentsDataList.addAll(result);

	    } catch (HibernateException e) {
	        // Log the exception (Consider using a logging framework like SLF4J)
	        e.printStackTrace();
	        // Optionally, rethrow the exception or wrap it in a custom exception
	        throw new RuntimeException("Error fetching property-wise residents data", e);
	    }

	    return residentsDataList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Groceries> getGroceryList() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Groceries.class);
			
			criteria.addOrder(Order.asc("id"));
			
			List<Groceries> user = criteria.list();

			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveBooking(Grocery_Booking booking) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(booking);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}

}

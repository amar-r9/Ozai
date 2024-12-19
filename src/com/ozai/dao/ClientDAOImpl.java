package com.ozai.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
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

import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Badges;
import com.ozai.model.BlogArticle;
import com.ozai.model.ClientUser;
import com.ozai.model.ClientWorkSites;
import com.ozai.model.Event;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.ReportUser;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Staff;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.util.OzaiUtil;
import com.ozai.model.Transport;
import com.ozai.model.UserComplaints;
import com.ozai.model.UserEmotion;
import com.ozai.model.Notice;
import com.ozai.model.GateRequests;
import com.ozai.beans.ResidentsData;
import com.ozai.beans.TicketsData;

@Repository
@Transactional
public class ClientDAOImpl implements ClientDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public ClientUser validateClientUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		ClientUser other = null;
		try {
			System.out.println("\n"+username+password);
			
			Criteria criteria = session.createCriteria(ClientUser.class);
			criteria.add(Restrictions.eq("username", username));
			other = (ClientUser) criteria.uniqueResult();
			
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
	public B2B_Details getResidentDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2B_Details.class);
			criteria.add(Restrictions.eq("user_id", id));
			criteria.add(Restrictions.isNull("moveout_date"));
			B2B_Details user = (B2B_Details) criteria
					.uniqueResult();
			return user;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2B_Details> getAllResidentsByClient(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2B_Details.class);
			criteria.add(Restrictions.eq("client_code", id));
			
			criteria.addOrder(Order.asc("id"));
			
			List<B2B_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2B_Details> getActiveResidentsByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2B_Details.class);
			criteria.add(Restrictions.eq("property_id", property_id));
			
			criteria.addOrder(Order.asc("id"));
			
			List<B2B_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<B2B_Details> getActiveResidentsByClient(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2B_Details.class);
			
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.eq("client_code", id));
			criteria.addOrder(Order.asc("user_id"));
			//criteria.setFetchMode("b2c_details", FetchMode.JOIN);
			List<B2B_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Details> getB2CResidentsByClient(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2C_Details.class);
			
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.eq("client_code", id));
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
	public List<Ticket> getTicketsListByClient(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Ticket.class);
			
			criteria.add(Restrictions.eq("client_code", id));
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
	public Integer addClientUser(ClientUser admin) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(admin);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean isClientUserExist(String username) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
	        Criteria criteria = session.createCriteria(ClientUser.class);
	        
	        // Using OR condition for username or mobile
	        criteria.add(Restrictions.or(
	            Restrictions.eq("username", username),
	            Restrictions.eq("mobile", username)
	        ));
	        
	        // Retrieve the results as a list
	        List<ClientUser> matchingUsers = criteria.list();

	        // Return true if the list is not empty (i.e., at least one match exists)
	        return !matchingUsers.isEmpty();

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return false;
	    }
	
	}
	
	@Override
	public List<ClientUser> getAllClientUsers() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
			criteria.addOrder(Order.asc("id"));
			
			List<ClientUser> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public ClientUser getClientUserRoleById(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (ClientUser) session.get(ClientUser.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateClientUserRole(ClientUser admin) {
		Session session = sessionFactory.getCurrentSession();
		try {			
			session.update(admin);
			session.flush();
			session.refresh(admin);
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
			
			Criteria criteria = session.createCriteria(B2B_Details.class);
			criteria.add(Restrictions.eq("user_id", id));
			B2B_Details user = (B2B_Details) criteria
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
	public List<Ticket> getRecentTicketsByClient(int client_id, int limit) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Ticket.class);
			
			criteria.add(Restrictions.eq("client_code", client_id));
			if (limit != 0)
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
	public Integer getResidentsCountByClient(int client) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2B_Details.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("client_code"),
					Restrictions.eq("client_code", client));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getPropertiesCountByClient(int client) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(PG.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("client_code"),
					Restrictions.eq("client_code", client));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.countDistinct("name"));
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Integer getTicketsCountByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Ticket.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("client_code"),
					Restrictions.eq("client_code", client_code));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getNotificationsCountByClient(int client) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Notice.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("client_code"),
					Restrictions.eq("client_code", client));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ResidentsData> getPropertyWiseResidentsDataByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<ResidentsData> studentCompPoints=new ArrayList<ResidentsData>();
		try {
			String query = "select UPPER(properties.name) as property, properties.CLIENT as client, COUNT(b2b_details.id) as strength from properties join b2b_details on properties.id=b2b_details.property_id where b2b_details.CLIENT_CODE='"+client_code+"' and b2b_details.moveout_date is null group by properties.name, properties.CLIENT";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("strength", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(ResidentsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ResidentsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Notice> getNoticeByClient(int client_code, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Notice.class);

			Criterion clientuser = Restrictions.eq("client_code",
					client_code);
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
	public boolean saveNotice(Notice notice) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(notice);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public List<ClientWorkSites> getClientWorkSites(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientWorkSites.class);

			Criterion clientuser = Restrictions.eq("client_code",
					client_code);
			criteria.add(Restrictions.and(clientuser));
			criteria.addOrder(Order.desc("id"));

			List<ClientWorkSites> invoices = criteria.list();

			return invoices;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean addWorkSite(ClientWorkSites site) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(site);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean saveRouteForClient(Transport transport) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(transport);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<Transport> getClientTripsList(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Transport.class);

			Criterion clientuser = Restrictions.eq("client_code",
					client_code);
			criteria.add(Restrictions.and(clientuser));
			criteria.addOrder(Order.asc("id"));

			List<Transport> invoices = criteria.list();

			return invoices;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveComplaintOnUser(UserComplaints report) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(report);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<UserComplaints> getUserComplaints(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(UserComplaints.class);
			
			Criterion scode = Restrictions.and(Restrictions.eq("user_id", id));
			criteria.add(Restrictions.and(scode));

			criteria.addOrder(Order.desc("id"));
			List<UserComplaints> escalations = criteria.list();

			return escalations;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveUserReport(ReportUser report) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(report);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean checkUserReportForMonth(int id, String month) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(ReportUser.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("user_id", id)));
			criteria.add(Restrictions.and(Restrictions.eq("report_month", month)));
			
			ReportUser admin = (ReportUser) criteria.uniqueResult();

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
	public List<ReportUser> getUserReports(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ReportUser.class);
			
			Criterion scode = Restrictions.and(Restrictions.eq("user_id", id));
			criteria.add(Restrictions.and(scode));

			criteria.addOrder(Order.desc("id"));
			List<ReportUser> escalations = criteria.list();

			return escalations;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public ClientUser getClientUserRoleByMobile(String mobile) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
			criteria.add(Restrictions.eq("mobile", mobile));
			ClientUser user = (ClientUser) criteria
					.uniqueResult();
			return user;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ClientUser> getAllClientUsersByClientId(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
			
			criteria.add(Restrictions.eq("client_code", client_code));

			criteria.addOrder(Order.desc("id"));
			List<ClientUser> escalations = criteria.list();

			return escalations;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Transport getTripDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Transport.class);
			criteria.add(Restrictions.eq("id", id));
			Transport user = (Transport) criteria
					.uniqueResult();
			return user;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TRIP_BOOKINGS> getBookingsList(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(TRIP_BOOKINGS.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			
			criteria.addOrder(Order.asc("id"));
			
			List<TRIP_BOOKINGS> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TRIP_BOOKINGS> getBookingsListByTrip(int trip_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(TRIP_BOOKINGS.class);
			criteria.add(Restrictions.eq("trip_id", trip_id));
			
			criteria.addOrder(Order.asc("id"));
			
			List<TRIP_BOOKINGS> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<TicketsData> getStatusWiseTicketsDataByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketsData> studentCompPoints=new ArrayList<TicketsData>();
		try {
			String query = "select UPPER(ticket.status) as status, COUNT(*) as count from ticket where ticket.CLIENT_CODE='"+client_code+"' group by ticket.status";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("status")
					.addScalar("count", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(TicketsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<TicketsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<TicketsData> getCategoryWiseTicketsDataByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketsData> studentCompPoints=new ArrayList<TicketsData>();
		try {
			String query = "select UPPER(ticket.category) as category, COUNT(*) as count from ticket where ticket.CLIENT_CODE='"+client_code+"' group by ticket.category";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("count", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(TicketsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<TicketsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getTicketsOfMonthAndPropertyByClient(int client_code, int property_id,
			String month) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Ticket.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			if(property_id!=0) 
				criteria.add(Restrictions.eq("property_id", property_id));
			//if(month!=null)
				//criteria.add(Restrictions.eq("month", month));
			
				criteria.addOrder(Order.desc("id"));
			List<Ticket> rents = criteria.list();
			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<TicketsData> getCategoryWiseTicketsDataByClientOnFilter(int client_code, String month, int property_id) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketsData> studentCompPoints=new ArrayList<TicketsData>();
		try {
			String query = null;
			if(property_id!=0) {
				query = "select UPPER(ticket.category) as category, COUNT(*) as count from ticket where ticket.property_id='"+property_id+"' and ticket.CLIENT_CODE='"+client_code+"' group by ticket.category";
			} else {
				query = "select UPPER(ticket.category) as category, COUNT(*) as count from ticket where ticket.CLIENT_CODE='"+client_code+"' group by ticket.category";
			}
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("count", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(TicketsData.class));			
			List<TicketsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ClientUser getClientUserByUsername(String user) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
			criteria.add(Restrictions.eq("username", user));
			ClientUser client = (ClientUser) criteria
					.uniqueResult();
			return client;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	@Override
	public Integer getEmotionsCountByClient(int clientCode) 
	{
		Session session = sessionFactory.getCurrentSession();

		try 
		{
			Criteria criteria = session.createCriteria(UserEmotion.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("clientCode"),
					Restrictions.eq("clientCode", clientCode));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} 
		catch(HibernateException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<UserEmotion> getUserEmotionsByClient(int clientCode) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        Criteria criteria = session.createCriteria(UserEmotion.class);
	        criteria.add(Restrictions.eq("clientCode", clientCode));
	        // Add any additional conditions if needed

	        List<UserEmotion> userEmotions = criteria.list();
	        //System.out.println("UserEMotions: "+userEmotions.get(clientCode));
	        return userEmotions;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}


	@Override
	public User getUserById(int userId) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        Criteria criteria = session.createCriteria(User.class);
	        criteria.add(Restrictions.eq("id", userId));
	        User user = (User) criteria.uniqueResult();
	        System.out.println("User: "+user);
	        return user;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@Override
	public boolean checkBadgeExistForMonth(int user_id, String month, String title) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Badges.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("user_id", user_id)));
			criteria.add(Restrictions.and(Restrictions.eq("month", month)));
			criteria.add(Restrictions.and(Restrictions.eq("title", title)));
			
			Badges admin = (Badges) criteria.uniqueResult();

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
	public boolean saveUserBadge(Badges badges) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(badges);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Badges> getUserBadges(int user_id) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        Criteria criteria = session.createCriteria(Badges.class);
	        criteria.add(Restrictions.eq("user_id", user_id));
	        // Add any additional conditions if needed

	        List<Badges> userEmotions = criteria.list();
	        //System.out.println("UserEMotions: "+userEmotions.get(clientCode));
	        return userEmotions;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@Override
	public Integer addGateRequest(GateRequests request) {
		Session session = sessionFactory.getCurrentSession();
		try {
			return (Integer) session.save(request);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean approveGateRequest(int id) {
		Session session = sessionFactory.getCurrentSession();		
		try {
			Criteria criteria = session.createCriteria(GateRequests.class);
			criteria.add(Restrictions.and(Restrictions.eq("id", id)));			
			GateRequests request = (GateRequests) criteria.uniqueResult();

			if (request != null) {
				request.setStatus("Approved");
				session.update(request);
				return true;
			} else
				return false;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GateRequests> getGateRequests(int client_code, String status, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(GateRequests.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			if (status != "All")
				criteria.add(Restrictions.eq("status", status));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));

			List<GateRequests> requests = criteria.list();

			return requests;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public GateRequests getGateRequestDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		GateRequests pass = null;
		try {
			Criteria criteria = session.createCriteria(GateRequests.class);
			criteria.add(Restrictions.eq("id", id));
			pass = (GateRequests) criteria.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		return pass;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GateRequests> getUserGateRequests(int user_id, String status, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(GateRequests.class);
			criteria.add(Restrictions.eq("user_id", user_id));
			if (status != "All")
				criteria.add(Restrictions.eq("status", status));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));

			List<GateRequests> requests = criteria.list();

			return requests;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Staff> getStaffListByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Staff.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			
			criteria.addOrder(Order.asc("id"));
			
			List<Staff> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Staff> getStaffListByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Staff.class);
			criteria.add(Restrictions.eq("property_id", property_id));
			
			criteria.addOrder(Order.asc("id"));
			
			List<Staff> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean addStaff(Staff staff) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(staff);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ResidentsData> getPropertyWiseResidentsDataOfCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		List<ResidentsData> studentCompPoints=new ArrayList<ResidentsData>();
		try {
			String query = "select UPPER(properties.name) as property, properties.CLIENT as client, COUNT(b2b_details.id) as strength from properties join b2b_details on properties.id=b2b_details.property_id where properties.CLUSTER_ID='"+cluster_id+"' and b2b_details.moveout_date is null group by properties.name, properties.CLIENT";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("strength", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(ResidentsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ResidentsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getRecentTicketsByCluster(int cluster_id, int limit) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
	        // Create Criteria for Ticket
	        Criteria criteria = session.createCriteria(Ticket.class, "ticket");

	        // Join Ticket with PG (PROPERTIES)
	        criteria.createAlias("ticket.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));

	        // Set limit if provided
	        if (limit != 0) {
	            criteria.setMaxResults(limit);
	        }

	        // Order by Ticket ID in descending order
	        criteria.addOrder(Order.desc("ticket.id"));

	        // Execute the query and return the results
	        List<Ticket> tickets = criteria.list();
	        return tickets;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notice> getNoticeByCluster(int cluster_id, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
	        // Create Criteria for Notice
	        Criteria criteria = session.createCriteria(Notice.class, "notice");

	        // Join Notice with PG (PROPERTIES)
	        criteria.createAlias("notice.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));

	        // Set limit if provided
	        if (limit != 0) {
	            criteria.setMaxResults(limit);
	        }

	        // Order by Notice ID in descending order
	        criteria.addOrder(Order.desc("notice.id"));

	        // Execute the query and return the results
	        List<Notice> notices = criteria.list();
	        return notices;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getRecentTicketsOfProperty(int property, int limit) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("property"+property);
		try {
			Criteria criteria = session.createCriteria(Ticket.class);
			
			criteria.add(Restrictions.eq("property_id", property));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.desc("id"));
			List<Ticket> tickets = criteria.list();

			return tickets;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notice> getNoticeByProperty(int property, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Notice.class);

			criteria.add(Restrictions.eq("property_id", property));
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
	public Integer getResidentsCountByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2B_Details.class, "details");
			
			criteria.createAlias("details.property", "property");
			
			criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getResidentsCountByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2B_Details.class);
			
			criteria.add(Restrictions.eq("property_id", property_id));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getPropertiesCountByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(PG.class);
			
			criteria.add(Restrictions.eq("cluster_id", cluster_id));
			criteria.setProjection(Projections.countDistinct("name"));
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Integer getTicketsCountByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Ticket.class, "ticket");
			
			criteria.createAlias("ticket.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getNotificationsCountByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Notice.class, "notice");
			criteria.createAlias("notice.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getTicketsCountByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Ticket.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("property_id"),
					Restrictions.eq("property_id", property_id));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getNotificationsCountByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Notice.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("property_id"),
					Restrictions.eq("property_id", property_id));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2B_Details> getActiveResidentsByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2B_Details.class, "details");
			criteria.createAlias("details.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			
			criteria.addOrder(Order.asc("details.id"));
			
			List<B2B_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<TicketsData> getStatusWiseTicketsDataByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketsData> studentCompPoints=new ArrayList<TicketsData>();
		try {
			String query = "SELECT UPPER(ticket.status) AS status, COUNT(*) AS count FROM TICKET ticket JOIN PROPERTIES property ON ticket.PROPERTY_ID = property.ID WHERE property.CLUSTER_ID ='"+cluster_id+"' GROUP BY ticket.status";
			
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("status")
					.addScalar("count", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(TicketsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<TicketsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<TicketsData> getCategoryWiseTicketsDataByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		List<TicketsData> studentCompPoints=new ArrayList<TicketsData>();
		try {
			String query ="SELECT UPPER(ticket.category) AS category, COUNT(*) AS count FROM TICKET ticket JOIN PROPERTIES property ON ticket.PROPERTY_ID = property.ID WHERE property.CLUSTER_ID ='"+cluster_id+"' GROUP BY ticket.category";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("count", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(TicketsData.class));
			//compPointsQuery.setParameter("client", client);
			
			List<TicketsData> userExpenses = compPointsQuery
					.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getClientMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
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
	public String getExistingClients(String name) {
	    Session session = sessionFactory.getCurrentSession();
	    StringBuilder colleges = new StringBuilder();
	    try {
	        Criteria criteria = session.createCriteria(ClientUser.class);
	        criteria.add(Restrictions.isNotNull("client"));
	        criteria.setProjection(Projections.distinct(Projections.property("client")));
	        List<String> locations = criteria.list();

	        colleges.append("[");
	        for (int i = 0; i < locations.size(); i++) {
	            colleges.append("\"");
	            colleges.append(locations.get(i));
	            colleges.append("\"");
	            if (i < locations.size() - 1) {
	                colleges.append(",");
	            }
	        }
	        colleges.append("]");

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	    return colleges.toString();
	}
	
	@Override
	public ClientUser getClientByName(String name) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        Criteria criteria = session.createCriteria(ClientUser.class);
	        criteria.add(Restrictions.eq("client", name));
	        criteria.add(Restrictions.eq("role", "Admin"));
	        criteria.add(Restrictions.eq("active", 1));
	        criteria.addOrder(Order.desc("id")); // Order by ID in descending order (latest record)
	        criteria.setMaxResults(1); // Limit to one result

	        return (ClientUser) criteria.uniqueResult();
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@Override
	public ClientUser findByVerificationToken(String token) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(ClientUser.class);
	        criteria.add(Restrictions.eq("verificationToken", token));
	        return (ClientUser) criteria.uniqueResult();
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}


	
}

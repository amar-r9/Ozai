package com.ozai.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Badminton_league;
import com.ozai.model.Contact;
import com.ozai.model.DailyUpdates;
import com.ozai.model.Delivery;
import com.ozai.model.Enquiry;
import com.ozai.model.Event;
import com.ozai.model.Expenses;
import com.ozai.model.FIND_BED;
import com.ozai.model.FlightTickets;
import com.ozai.model.INVITE_FRIEND;
import com.ozai.model.Insurance;
import com.ozai.model.Loan;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.Referral;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.Talent;
import com.ozai.model.Ticket;
import com.ozai.model.Token;
import com.ozai.model.Transport;
import com.ozai.model.User;
import com.ozai.model.UserEmotion;
import com.ozai.model.VehicleInsurance;
import com.ozai.model.VirtualDoctor;
import com.ozai.util.OzaiUtil;
import com.ozai.model.TRYITFIRST;
import com.ozai.model.UserLikeKey;
import com.ozai.model.UserLikeValidation;
import com.ozai.model.B2B_Details;
import com.ozai.model.ClientUser;

@Repository
@Transactional
public class OzaiDAOImpl implements OzaiDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean saveEnquiry(Enquiry enquiry) {
		Session session = sessionFactory.getCurrentSession();

		try {
			/*
			 * System.out.println("photo size" + photo.available()); if (photo
			 * != null && photo.available() > 0) { // UserProfileImage
			 * profileImage = new UserProfileImage(); byte[] image =
			 * IOUtils.toByteArray(photo); user.setImage(image); }
			 */
			//other.setTxnref("MSBU00" + (getStudentMaxID() + 1));

			session.save(enquiry);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean saveContact(Contact contact) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(contact);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public Integer saveTalent(Talent talent) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(talent);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Talent> getAllTalentEntries() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Talent.class);
			
				criteria.addOrder(Order.asc("id"));
				List<Talent> sessions = criteria.list();

			return sessions;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Talent> getAllTalentEntriesByClient(String client) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Talent.class);
			Criterion clientName = Restrictions.and(
					Restrictions.isNotNull("organization"),
					Restrictions.like("organization", client));
			criteria.add(Restrictions.and(clientName));
			criteria.addOrder(Order.asc("id"));
			List<Talent> sessions = criteria.list();

			return sessions;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Talent getTalentEntry(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Talent) session.get(Talent.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getUserTicketsList(int user_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Ticket.class);
			criteria.add(Restrictions.eq("user_id", user_id));
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
	public Ticket getTicketDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Ticket) session.get(
					Ticket.class, id);

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean addTicket(Ticket ticket) {
		Session session = sessionFactory.getCurrentSession();

		try {
			/*
			 * System.out.println("photo size" + photo.available()); if (photo
			 * != null && photo.available() > 0) { // UserProfileImage
			 * profileImage = new UserProfileImage(); byte[] image =
			 * IOUtils.toByteArray(photo); user.setImage(image); }
			 */
			//other.setTxnref("MSBU00" + (getStudentMaxID() + 1));

			session.save(ticket);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Notice getLatestNotice(Date date) {
		Session session = sessionFactory.getCurrentSession();

		System.out.println("In DAOImpl \n");
		System.out.println("The utl date is : "+date);
		try {
			Criteria criteria = session.createCriteria(Notice.class);

			criteria.add(Restrictions.eq("date", date));

			Notice propertyDetails = (Notice) criteria.uniqueResult();
			return propertyDetails;

		} catch(HibernateException exception){
		     exception.printStackTrace();
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
			criteria.add(Restrictions.and(Restrictions.isNull("moveout_date")));
			
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
	public boolean increaseLoginCount(String username) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("username", username));
			User other = (User) criteria.uniqueResult();
			other.setLogin_count(other.getLogin_count() + 1);
			session.merge(other);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean saveEntryVisit(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Talent.class);
			criteria.add(Restrictions.eq("id", id));
			Talent entry = (Talent) criteria.uniqueResult();
			entry.setViews(entry.getViews() + 1);
			session.merge(entry);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public Integer getTicketMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Ticket.class);
			criteria.setProjection(Projections.max("id"));
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
	public boolean applyLoan(Loan loan) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(loan);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean isUserAppliedForLoan(String id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(Loan.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("user_id", id)));
			
			Loan loan = (Loan) criteria.uniqueResult();

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
	public Integer getResidentsCountByAdmin(int client) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2C_Details.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client));
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
	public Integer getPropertiesCountByAdmin(int client) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(PG.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client));
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
	public Integer getTicketsCountByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Ticket.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client_code));
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
	public double getTotalRevenueByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2C_Details.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client_code));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.sum("rent"));
			//double rowCount = (double) criteria.uniqueResult();
			//if(rowCount!=0) {
				//return rowCount;
			//} else { 
				return 0;
			//}
		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public double getTotalPendningByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2C_Rents.class);
			
			Criterion scode = Restrictions.eq("admin_id", client_code);
			Criterion statusCheck = Restrictions.eq("status", "Due");
			criteria.add(Restrictions.and(scode, statusCheck));
			criteria.setProjection(Projections.sum("amount"));
			double rowCount = (double) criteria.uniqueResult();
			
			return rowCount;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public double getTotalCollectedByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(B2C_Rents.class);
			
			Criterion scode = Restrictions.eq("admin_id", client_code);
			Criterion statusCheck = Restrictions.eq("status", "Paid");
			criteria.add(Restrictions.and(scode, statusCheck));
			criteria.setProjection(Projections.sum("amount"));
			double rowCount = (double) criteria.uniqueResult();

			return rowCount;
			

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/*
	 * @Override public double getTotalMonthPendingByAdmin(int client_code, String
	 * month) { Session session = sessionFactory.getCurrentSession();
	 * 
	 * try {
	 * 
	 * Criteria criteria = session.createCriteria(B2C_Rents.class);
	 * 
	 * Criterion scode = Restrictions.eq("admin_id", client_code); Criterion
	 * statusCheck = Restrictions.eq("status", "Due");
	 * 
	 * Criterion adminStatus = Restrictions.and(scode, statusCheck); Criterion
	 * monthCheck = Restrictions.eq("service_month", month);
	 * 
	 * criteria.add(Restrictions.and(adminStatus, monthCheck));
	 * 
	 * criteria.setProjection(Projections.sum("amount")); double rowCount = (double)
	 * criteria.uniqueResult();
	 * 
	 * return rowCount;
	 * 
	 * } catch (HibernateException e) { e.printStackTrace(); return 0; } }
	 */
	
	@Override
	public double getTotalMonthPendingByAdmin(int client_code, String month) {
		Session session = sessionFactory.getCurrentSession();
		//double totalAmount = 0;
		try {
			SQLQuery q = session.createSQLQuery("select sum(amount) from B2C_RENTS where status='Due' and service_month='"+month+"' and admin_id='"+client_code+"'");
			
			//q.addEntity(ExpensePayments.class);
			List l = q.list();
			System.out.println("List: " +l);
			if(l!=null && l.size()>0 && l.get(0)!=null) {
				return (double) l.get(0);
			} else {
				return 0;
			}
			//return (l!=null && l.size()>0) ? (double) l.get(0):0;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public double getTotalMonthCollectedByAdmin(int client_code, String month) {
		Session session = sessionFactory.getCurrentSession();
		//double totalAmount = 0;
		try {
			SQLQuery q = session.createSQLQuery("select sum(amount) from B2C_RENTS where status='Paid' and service_month='"+month+"' and admin_id='"+client_code+"'");
			
			//q.addEntity(ExpensePayments.class);
			List l = q.list();
			System.out.println("List: " +l);
			if(l!=null && l.size()>0 && l.get(0)!=null) {
				return (double) l.get(0);
			} else {
				return 0;
			}
			//return (l!=null && l.size()>0) ? (double) l.get(0):0;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/*
	 * @Override public double getTotalMonthCollectedByAdmin(int client_code, String
	 * month) { Session session = sessionFactory.getCurrentSession();
	 * 
	 * try {
	 * 
	 * Criteria criteria = session.createCriteria(B2C_Rents.class);
	 * 
	 * Criterion scode = Restrictions.eq("admin_id", client_code); Criterion
	 * statusCheck = Restrictions.eq("status", "Paid");
	 * 
	 * Criterion adminStatus = Restrictions.and(scode, statusCheck); Criterion
	 * monthCheck = Restrictions.eq("service_month", month);
	 * 
	 * criteria.add(Restrictions.and(adminStatus, monthCheck));
	 * criteria.setProjection(Projections.sum("amount")); double rowCount = (double)
	 * criteria.uniqueResult(); if(rowCount)
	 * 
	 * return rowCount;
	 * 
	 * 
	 * } catch (HibernateException e) { e.printStackTrace(); return 0; } }
	 */
	
	@Override
	public boolean addMobileInterest(TRYITFIRST tryitfirst) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(tryitfirst);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean isUserInterestedInTryItFirst(String mobile) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(TRYITFIRST.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("mobile", mobile)));
			
			TRYITFIRST loan = (TRYITFIRST) criteria.uniqueResult();

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
	public boolean saveReferral(Referral refer) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(refer);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean saveInvitation(INVITE_FRIEND refer) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(refer);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean saveBedRequest(FIND_BED find) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(find);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean registerForBadminton(Badminton_league league) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(league);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean isUserRegisteredForBadminton(String user_type, int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(Badminton_league.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("user_type", user_type)));
			if(user_type.equalsIgnoreCase("Resident")) {
				criteria.add(Restrictions.and(Restrictions.eq("user_id", id)));
			} else {
				criteria.add(Restrictions.and(Restrictions.eq("admin_id", id)));
			}
			Badminton_league loan = (Badminton_league) criteria.uniqueResult();

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
	public boolean saveToken(Token token) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(token);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean deleteToken(String sessionId, String type) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Query deleteQuery = session
				.createQuery("delete from Token where session_id = :acode and user_type='"+type+"'");
				deleteQuery.setParameter("acode", sessionId);

				int deleted = deleteQuery.executeUpdate();
				System.out.println(deleted);
				if (deleted > 0) {
					return true;
				} else {
					return false;
				}

		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getUserDeviceId(String username, String type) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Token.class);
			
			Criterion uId = Restrictions.eq("sessionId", username);
			Criterion uType = Restrictions.eq("user_type", type);
			criteria.add(Restrictions.and(uId, uType));
			criteria.setProjection(Projections.distinct(Projections.property("deviceId")));
	        List<String> tokens = criteria.list();

			return tokens;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean bookThisTrip(TRIP_BOOKINGS trip) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(trip);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean isUserBookedThisTrip(int trip_id, int user_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking booked or not");
			Criteria criteria = session.createCriteria(TRIP_BOOKINGS.class);
			
			criteria.add(Restrictions.and(Restrictions.eq("trip_id", trip_id)));
			criteria.add(Restrictions.and(Restrictions.eq("user_id", user_id)));
			TRIP_BOOKINGS loan = (TRIP_BOOKINGS) criteria.uniqueResult();

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
	public boolean updateAvailableSeats(int tripId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Transport.class);
			criteria.add(Restrictions.eq("id", tripId));
			Transport other = (Transport) criteria.uniqueResult();
			other.setAvailable(other.getAvailable() - 1);
			session.merge(other);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean saveEvent(Event event) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(event);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventsByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Event.class);
			criteria.add(Restrictions.eq("admin_id", admin_id));
			criteria.addOrder(Order.desc("id"));

			List<Event> events = criteria.list();
			System.out.println("Dao:" +events);
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventsByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Event.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.addOrder(Order.desc("id"));

			List<Event> events = criteria.list();
			System.out.println("Dao:" +events);
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Integer getNotificationsCountByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Notice.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client_code));
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
	public double getExpensesCountByAdmin(int client_code, String month) {
		Session session = sessionFactory.getCurrentSession();
		//double totalAmount = 0;
		try {
			SQLQuery q = session.createSQLQuery("select sum(INVOICE_AMOUNT+GST_AMOUNT) from EXPENSES where status='Paid' and service_month='"+month+"' and admin_id='"+client_code+"'");
			
			//q.addEntity(ExpensePayments.class);
			List l = q.list();
			System.out.println("ListExp: " +l);
			if(l!=null && l.size()>0 && l.get(0)!=null) {
				return (double) l.get(0);
			} else {
				return 0;
			}
			//return (l!=null && l.size()>0) ? (double) l.get(0):0;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean addDeliveryUpdate(Delivery event) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(event);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean addDailyUpdate(DailyUpdates event) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(event);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Delivery> getDeliveryListByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Delivery.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.addOrder(Order.desc("id"));

			List<Delivery> events = criteria.list();
			System.out.println("Dao:" +events);
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DailyUpdates> getDailyUpdatesByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(DailyUpdates.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.addOrder(Order.desc("id"));

			List<DailyUpdates> events = criteria.list();
			System.out.println("Dao:" +events);
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean submitForVirtualDoctor(VirtualDoctor doctor) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(doctor);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean savePersonalInsurance(Insurance doctor) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(doctor);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean saveVehicleInsurance(VehicleInsurance doctor) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(doctor);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public Event getEventDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Event) session.get(Event.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getEventMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Event.class);
			criteria.setProjection(Projections.max("id"));
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
	
	@Override
	public boolean saveFlightTickets(FlightTickets flightTickets) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        session.save(flightTickets);
	        return true;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	@Override
	public boolean saveUserEmotion(UserEmotion userEmotion) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        session.save(userEmotion);
	        return true;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	@Override
	public boolean isUserEmotionSelectedForDate(int userId, Date date) {
	    Session session = sessionFactory.getCurrentSession();

	    try {
	        System.out.println("Checking if user emotion selected for date");
	        Criteria criteria = session.createCriteria(UserEmotion.class);

	        // Add restrictions to check if the user ID and date match
	        criteria.add(Restrictions.and(
	            Restrictions.eq("userId", userId),
	            Restrictions.eq("date", date)
	        ));

	        // Check if there's any record matching the criteria
	        UserEmotion userEmotion = (UserEmotion) criteria.uniqueResult();

	        return userEmotion != null; // If userEmotion is not null, it means the user has already selected an emotion for the given date
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

//	@SuppressWarnings("unchecked")
//	public List<String> getUsernamesByClientCode(int clientCode) {
//	    Session session = sessionFactory.getCurrentSession();
//	    try {
//	        // Retrieve user IDs associated with the client code
//	        Criteria userCriteria = session.createCriteria(B2B_Details.class);
//	        userCriteria.add(Restrictions.eq("client_code", clientCode));
//	        userCriteria.setProjection(Projections.property("user_id"));
//	        List<Integer> userIds = userCriteria.list();
//	        
//	        // Retrieve usernames based on user IDs
//	        Criteria usernameCriteria = session.createCriteria(User.class);
//	        usernameCriteria.add(Restrictions.in("id", userIds));
//	        usernameCriteria.setProjection(Projections.property("username"));
//	        List<String> usernames = usernameCriteria.list();
//	        System.out.println("1");
//	        System.out.println("UsernameDAO: "+usernames);
//	        return usernames;
//	    } catch (HibernateException e) {
//	        e.printStackTrace();
//	        return null;
//	    }
//	}
	

	@SuppressWarnings("unchecked")
	public List<String> getUsernamesByClientCode(int clientCode) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        // Retrieve usernames associated with the client code from the client_user table
	        Criteria clientUserCriteria = session.createCriteria(ClientUser.class);
	        clientUserCriteria.add(Restrictions.eq("client_code", clientCode));
	        clientUserCriteria.setProjection(Projections.property("username"));
	        //clientUserCriteria.setProjection(Projections.distinct(Projections.property("username")));
	        List<String> usernames = clientUserCriteria.list();

	        return usernames;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getUserDeviceIds(List<String> sessionId) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(Token.class);
	        criteria.add(Restrictions.in("sessionId", sessionId));
	        criteria.add(Restrictions.eq("user_type", "User"));
			criteria.setProjection(Projections.distinct(Projections.property("deviceId")));
	        List<String> deviceIds = criteria.list();
	        return deviceIds;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getCampUserDeviceIds(List<String> sessionId) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(Token.class);
	        criteria.add(Restrictions.in("sessionId", sessionId));
	        criteria.add(Restrictions.eq("user_type", "LCT"));
			criteria.setProjection(Projections.distinct(Projections.property("deviceId")));
	        List<String> deviceIds = criteria.list();
	        return deviceIds;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getResidentUsernamesByClient(int clientCode) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        // Retrieve usernames associated with the client code from the client_user table
	        Criteria clientUserCriteria = session.createCriteria(ClientUser.class);
	        clientUserCriteria.add(Restrictions.eq("client_code", clientCode));
	        clientUserCriteria.setProjection(Projections.property("username"));
	        List<String> usernames = clientUserCriteria.list();
	        return usernames;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getResidentUserDeviceIds(List<String> sessionId) {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(Token.class);
	        criteria.add(Restrictions.in("sessionId", sessionId));
	        criteria.add(Restrictions.eq("user_type", "User"));
			criteria.setProjection(Projections.distinct(Projections.property("deviceId")));
	        List<String> deviceIds = criteria.list();
	        return deviceIds;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getOrganizationsList() {
	    Session session = sessionFactory.getCurrentSession();
	    try {
	        Criteria criteria = session.createCriteria(Talent.class);
			criteria.setProjection(Projections.distinct(Projections.property("organization")));
	        List<String> deviceIds = criteria.list();
	        return deviceIds;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@Override
	public UserLikeValidation isUserLiked(
			UserLikeValidation userLikeValidation) {
		Session session = sessionFactory.getCurrentSession();

		int user_id = userLikeValidation.getLiked_user();
		int entry_id = userLikeValidation.getEntry_id();
		UserLikeValidation likeValidation = (UserLikeValidation) session.get(
				UserLikeValidation.class, new UserLikeKey(user_id, entry_id));
		return likeValidation;
	}
	
	@Override
	public boolean saveUserLike(UserLikeValidation userLikeValidation) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.saveOrUpdate(userLikeValidation);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateEntryPoints(int entry_id, int points) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Talent.class);
			criteria.add(Restrictions.eq("id", entry_id));
			Talent talent = (Talent) criteria.uniqueResult();
			talent.setPoints(talent.getPoints() + points);
			session.update(talent);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getSmartIdolRegistrations() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("countryCode", "+971"));
			
			criteria.addOrder(Order.asc("id"));
			List<User> sessions = criteria.list();

			return sessions;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventsByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
	        // Create Criteria for Event
	        Criteria criteria = session.createCriteria(Event.class, "event");

	        // Join Event with PG (PROPERTIES)
	        criteria.createAlias("event.property", "property");

	        // Add condition for cluster_id
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));

	        // Order by Event ID in descending order
	        criteria.addOrder(Order.desc("event.id"));

	        // Execute the query and return the results
	        List<Event> events = criteria.list();
	        return events;

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> getEventsByProperty(int property) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Event.class);
			criteria.add(Restrictions.eq("property_id", property));
			criteria.addOrder(Order.desc("id"));

			List<Event> events = criteria.list();
			System.out.println("Dao:" +events);
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

}

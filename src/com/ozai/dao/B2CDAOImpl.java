package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Talent;
import com.ozai.model.User;
import com.ozai.model.VACATENOTICE;
import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.Beds;
import com.ozai.model.Walkins;

@Repository
@Transactional
public class B2CDAOImpl implements B2CDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean isRentGenerated(int user_id, String month) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			System.out.println("checking mobile exist or not");
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			
			Criterion userId = Restrictions.eq("user_id", user_id);
			Criterion sMonth = Restrictions.eq("service_month", month);
			criteria.add(Restrictions.and(userId, sMonth));
			
			B2C_Rents user = (B2C_Rents) criteria.uniqueResult();

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
	public boolean generateResidentRent(B2C_Rents rent) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(rent);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getB2CRentsList(int client_code, String status, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("admin_id", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			criteria.add(Restrictions.and(adminId, rentStatus));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getB2CRentsListByMonth(int client_code, String status, String month, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("admin_id", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			Criterion rentMonth = Restrictions.eq("service_month", month);
			criteria.add(Restrictions.and(adminId, rentStatus, rentMonth));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getB2CRentsListByProperty(int client_code, String status, int property, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("admin_id", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			Criterion rentMonth = Restrictions.eq("property_id", property);
			criteria.add(Restrictions.and(adminId, rentStatus, rentMonth));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getB2CUserRents(int id, String status) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("user_id", id);
			Criterion rentStatus = Restrictions.eq("status", status);
			criteria.add(Restrictions.and(adminId, rentStatus));
			criteria.addOrder(Order.asc("id"));
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public B2C_Rents getB2CRentDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		B2C_Rents user = null;
		try {

			Criteria criteria = session.createCriteria(B2C_Rents.class);
			criteria.add(Restrictions.eq("id", id));
			user = (B2C_Rents) criteria.uniqueResult();
			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public boolean updateRentPayment(B2C_Rents payment) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(payment);
			session.flush();
			session.refresh(payment);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@Override
	public B2C_ElectricityBill getB2CElectricityBill(int id) {
		Session session = sessionFactory.getCurrentSession();
		B2C_ElectricityBill user = null;
		try {

			Criteria criteria = session.createCriteria(B2C_ElectricityBill.class);
			criteria.add(Restrictions.eq("id", id));
			user = (B2C_ElectricityBill) criteria.uniqueResult();
			
			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public boolean updateElectricityPayment(B2C_ElectricityBill payment) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(payment);
			session.flush();
			session.refresh(payment);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public B2C_SecurityDeposit getB2CSecurityDeposit(int id) {
		Session session = sessionFactory.getCurrentSession();
		B2C_SecurityDeposit user = null;
		try {

			Criteria criteria = session.createCriteria(B2C_SecurityDeposit.class);
			criteria.add(Restrictions.eq("id", id));
			user = (B2C_SecurityDeposit) criteria.uniqueResult();
			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public boolean updateSDPayment(B2C_SecurityDeposit payment) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(payment);
			session.flush();
			session.refresh(payment);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean addUserAsResident(B2C_Details details) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(details);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean saveUserVacateNotice(VACATENOTICE notice) {
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
	public VACATENOTICE getVacateNoticeOfUser(int user_id) {
		Session session = sessionFactory.getCurrentSession();
		VACATENOTICE user = null;
		try {

			Criteria criteria = session.createCriteria(VACATENOTICE.class);
			criteria.add(Restrictions.eq("user_id", user_id));
			user = (VACATENOTICE) criteria.uniqueResult();
			return user;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public boolean isUserUnderNoticePeriod(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(VACATENOTICE.class);
			
			Criterion userId = Restrictions.eq("user_id", id);
			criteria.add(Restrictions.and(userId));
			
			VACATENOTICE user = (VACATENOTICE) criteria.uniqueResult();

			if (user != null)
				return true;
			else
				return false;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	/* bookings dao starts */
	
	@Override
	public boolean saveWalkin(Walkins walkin) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(walkin);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Walkins> getAllWalkinsByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Walkins.class);
			Criterion userId = Restrictions.eq("admin_id", admin_id);
			criteria.add(Restrictions.and(userId));
			criteria.addOrder(Order.asc("id"));
				
			List<Walkins> sessions = criteria.list();

			return sessions;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Walkins getWalkinDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Walkins) session.get(Walkins.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveB2CBooking(B2C_BOOKINGS booking) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(booking);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public B2C_BOOKINGS getBookingDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_BOOKINGS.class);
			
			criteria.add(Restrictions.eq("id", id));
			B2C_BOOKINGS booking = (B2C_BOOKINGS) criteria.uniqueResult();
			return booking;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateBookingPayment(B2C_BOOKINGS booking) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(B2C_BOOKINGS.class);
			criteria.add(Restrictions.eq("id", booking.getId()));
			B2C_BOOKINGS paid = (B2C_BOOKINGS) criteria
					.uniqueResult();
			paid.setPaid_date(booking.getPaid_date());
			paid.setPayment_id(booking.getPayment_id());
			paid.setStatus(booking.getStatus());
			session.update(paid);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<B2C_BOOKINGS> getAllBookingsByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_BOOKINGS.class);
			Criterion userId = Restrictions.eq("admin_id", admin_id);
			criteria.add(Restrictions.and(userId));
			criteria.addOrder(Order.asc("id"));
			
			List<B2C_BOOKINGS> sessions = criteria.list();

			return sessions;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public boolean updateBookingDetails(B2C_BOOKINGS booking) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Beds.class);
			Criterion unitA = Restrictions.eq("unit", booking.getBed());
			Criterion propertyA = Restrictions.eq("property_id", booking.getProperty_id());

			criteria.add(Restrictions.and(unitA, propertyA));
			Beds paid = (Beds) criteria
					.uniqueResult();
			paid.setStatus("Booked");
			session.update(paid);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getClientB2CRentsList(int client_code, String status, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			criteria.add(Restrictions.and(adminId, rentStatus));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getClientB2CRentsListByMonth(int client_code, String status, String month, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			Criterion rentMonth = Restrictions.eq("service_month", month);
			criteria.add(Restrictions.and(adminId, rentStatus, rentMonth));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getClientB2CRentsListByProperty(int client_code, String status, int property, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			Criterion rentMonth = Restrictions.eq("property_id", property);
			criteria.add(Restrictions.and(adminId, rentStatus, rentMonth));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getClientRecentB2CRentPayments(int client_code, String status, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			criteria.add(Restrictions.and(adminId, rentStatus));
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("paid_date"));
			} else {
				criteria.addOrder(Order.desc("paid_date"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Rents> getClientB2CRentsListByMonthAndProperty(int client_code, String status,
			String month, int property, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2C_Rents.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion rentStatus = Restrictions.eq("status", status);
			Criterion rentMonths = Restrictions.eq("service_month", month);
			if(property!=0) {
				Criterion rentMonth = Restrictions.eq("property_id", property);
				criteria.add(Restrictions.and(adminId, rentStatus, rentMonth, rentMonths));
			} else {
				criteria.add(Restrictions.and(adminId, rentStatus, rentMonths));
			}
			if(limit!=0) {
				criteria.setMaxResults(limit);
				criteria.addOrder(Order.desc("id"));
			} else {
				criteria.addOrder(Order.asc("id"));				
			}
			List<B2C_Rents> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
}

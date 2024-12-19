package com.ozai.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.Badges;
import com.ozai.model.Expenses;
import com.ozai.model.Facility;
import com.ozai.model.FacilityBooking;
import com.ozai.model.User;

@Repository
@Transactional
public class FacilityBookingDAOImpl implements FacilityBookingDAO {

	@Autowired
	private SessionFactory sessionFactory; 

	@Override
	public List<FacilityBooking> getFacilityBookings() {
		System.out.println("FacilityBookingDAOImpl > getFacilityBookings");
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session
					.createCriteria(FacilityBooking.class);			
			criteria.add(Restrictions.isNotNull("id")); 
			List<FacilityBooking> bookings = criteria.list(); 
			System.out.println("bookings: "+bookings.size());
			return bookings;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public FacilityBooking getFacilityBookingDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		FacilityBooking booking;
		try {
			Criteria criteria = session.createCriteria(FacilityBooking.class);
				criteria.add(Restrictions.eq("id", id));				
				booking = (FacilityBooking) criteria.uniqueResult();
			return booking;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addFacilityBooking(FacilityBooking booking) {
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
	public boolean updateFacilityBooking(FacilityBooking facilityBookingObj) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(facilityBookingObj);
			session.flush();
			session.refresh(facilityBookingObj);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	/*@Override
	public List<FacilityBooking> getAdminApprovalFacilityBookings() {
		// TODO Auto-generated method stub
		System.out.println("FacilityBookingDAOImpl > getAdminApprovalFacilityBookings"); 
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql="SELECT facilityObj.name,userObj.name,bookingObj.booking_date,bookingObj.start_time,bookingObj.end_time FROM Facility facilityObj, User userObj, FacilityBooking bookingObj WHERE facilityObj.id=bookingObj.facility_id AND userObj.id=bookingObj.user_id";
			Query query = session.createQuery(hql);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			query.setResultTransformer(Transformers.aliasToBean(FacilityBooking.class));
		    return (List<FacilityBooking>) query.list();
		    
			List<FacilityBooking> bookings = new ArrayList<FacilityBooking>();
			Iterator iterator= query.list().iterator();
		    while(iterator.hasNext()){
		        Object[] tuple=  (HashMap[]) iterator.next();
		        FacilityBooking booking=new FacilityBooking();
		        booking.setFacility_name((String)tuple[0]);
		        booking.setUser_name((String)tuple[1]);
		        booking.setBooking_date((Date)tuple[2]);
		        booking.setStart_time((String)tuple[3]);
		        booking.setEnd_time((String)tuple[4]);
		        bookings.add(booking);
		    }
		    
			
					
			System.out.println("bookings: "+bookings.size());
			return bookings;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}	
	}*/

	

}

package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.Badges;
import com.ozai.model.Expenses;
import com.ozai.model.Facility;
import com.ozai.model.User;

@Repository
@Transactional
public class FacilityDAOImpl implements FacilityDAO {

	@Autowired
	private SessionFactory sessionFactory; 

	@Override
	public List<Facility> getFacilities() {
		System.out.println("FacilityDAOImpl > getFacilities");
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session
					.createCriteria(Facility.class);			
			criteria.add(Restrictions.isNotNull("name")); 
			List<Facility> facilities = criteria.list(); 
			System.out.println("facilities: "+facilities.size());
			return facilities;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Facility getFacilityDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		Facility facility;
		try {
			Criteria criteria = session.createCriteria(Facility.class);
				criteria.add(Restrictions.eq("id", id));				
				facility = (Facility) criteria.uniqueResult();
			return facility;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addFacility(Facility facility) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(facility);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteFacility(int id) {
		Session session = sessionFactory.getCurrentSession();
		Facility facility;
		try {
			Query deleteQuery = session.createQuery("delete Facility where id =:facility_id");
			deleteQuery.setParameter("facility_id", id);
			deleteQuery.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	

}

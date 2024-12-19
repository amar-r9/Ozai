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

import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Talent;
import com.ozai.model.User;

@Repository
@Transactional
public class B2BDAOImpl implements B2BDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addUserAsResident(B2B_Details details) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(details);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
}

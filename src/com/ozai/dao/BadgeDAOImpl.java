package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.Badges;

@Repository
@Transactional
public class BadgeDAOImpl implements BadgeDAO {

	@Autowired
	private SessionFactory sessionFactory; 

	@Override
	public List<Badges> getBadgeList() {
		System.out.println("BadgeDAOImpl > getBadgeList");
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session
					.createCriteria(Badges.class);			
			criteria.add(Restrictions.isNotNull("name")); 
			List<Badges> badges = criteria.list(); 
			System.out.println("badges: "+badges.size());
			return badges;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

}

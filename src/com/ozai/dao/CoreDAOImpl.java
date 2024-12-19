package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.Admin;
import com.ozai.model.ClientUser;
import com.ozai.model.CoreUser;
import com.ozai.model.Delivery;

@Repository
@Transactional
public class CoreDAOImpl implements CoreDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public CoreUser validateUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		CoreUser other = null;
		try {
			System.out.println("\n"+username+password);
			
			Criteria criteria = session.createCriteria(CoreUser.class);
			criteria.add(Restrictions.eq("username", username));
			other = (CoreUser) criteria.uniqueResult();
			
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getAllOperators() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Admin.class);
			//criteria.setProjection(Projections.groupProperty("client_code"));
			List<Admin> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Admin> getOperators() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Admin.class);
		    criteria.setProjection(Projections.projectionList()
		            .add(Projections.groupProperty("client_code").as("client_code"))
		            .add(Projections.property("client").as("client"))
		            .add(Projections.property("client_code").as("client_code")));
		    criteria.setResultTransformer(Transformers.aliasToBean(Admin.class));
		    List<Admin> list = criteria.list();

			return list;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientUser> getAllLCTUsers() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
			//criteria.setProjection(Projections.groupProperty("client_code"));
			List<ClientUser> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientUser> getLCTUsers() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ClientUser.class);
		    criteria.setProjection(Projections.projectionList()
		            .add(Projections.groupProperty("client_code").as("client_code"))
		            .add(Projections.property("client").as("client"))
		            .add(Projections.property("client_code").as("client_code")));
		    criteria.setResultTransformer(Transformers.aliasToBean(Admin.class));
		    List<ClientUser> list = criteria.list();

			return list;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public boolean makeUserAsAdmin(int id) {
		return false;
	}
	
	@Override
	public Integer saveDeliveryDetails(Delivery delivery) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(delivery);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public Integer getDeliveryMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Delivery.class);
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
	public List<Delivery> getDeliveryList(String type) {
		Session session = sessionFactory.getCurrentSession();
		List<Delivery> finance = null;
		try {
			Criteria criteria = session.createCriteria(Delivery.class);
			
			if(type.equalsIgnoreCase("all")) {
				criteria.addOrder(Order.asc("id"));
				finance = criteria.list();
			} else {
				criteria.add(Restrictions.eq("type", type));
				criteria.addOrder(Order.asc("id"));
				finance = criteria.list();
			}

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Delivery> getDeliveryListByCategory(String category) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Delivery.class);
			
			criteria.add(Restrictions.eq("category", category));
			criteria.addOrder(Order.asc("id"));
			List<Delivery> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Delivery getDeliveryDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Delivery) session.get(Delivery.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}

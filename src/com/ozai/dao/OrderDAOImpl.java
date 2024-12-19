package com.ozai.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
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

import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.Order_Items;
import com.ozai.model.OrdersList;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<OrdersList> getOrdersByAdmin(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(OrdersList.class);
			Criterion clientName = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.like("admin_id", id));
			criteria.add(Restrictions.and(clientName));
			criteria.addOrder(Order.desc("id"));
			List<OrdersList> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Integer getOrderMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(OrdersList.class);
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
	public boolean saveOrder(OrdersList order) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(order);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean saveOrderItems(Order_Items orders) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(orders);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public OrdersList getOrderDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (OrdersList) session.get(OrdersList.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<Order_Items> getOrderItemsById(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Order_Items.class);
			Criterion clientName = Restrictions.and(
					Restrictions.isNotNull("order_id"),
					Restrictions.like("order_id", id));
			criteria.add(Restrictions.and(clientName));
			criteria.addOrder(Order.asc("id"));
			List<Order_Items> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<OrdersList> getAllActiveOrders() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(OrdersList.class);
			criteria.addOrder(Order.desc("id"));
			List<OrdersList> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<OrdersList> getAllOrders() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(OrdersList.class);
			criteria.addOrder(Order.desc("id"));
			List<OrdersList> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
}

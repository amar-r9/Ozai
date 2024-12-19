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
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class ExpenseDAOImpl implements ExpenseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean updateVendorDetails(Vendor vendor) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Vendor.class);
			criteria.add(Restrictions.eq("id", vendor.getId()));
			Vendor ticket = (Vendor) criteria
					.uniqueResult();
			ticket.setName(vendor.getName());
			ticket.setAddress(vendor.getAddress());
			ticket.setContact(vendor.getContact());
			ticket.setApplicable_tds(vendor.getApplicable_tds());
			ticket.setBank_account(vendor.getBank_account());
			ticket.setBank_identifier(vendor.getBank_identifier());
			ticket.setCity(vendor.getCity());
			ticket.setEmail(vendor.getEmail());
			ticket.setPan(vendor.getPan());
			ticket.setGst(vendor.getGst());
			ticket.setIfsc(vendor.getIfsc());
			ticket.setPayment_terms(vendor.getPayment_terms());
			ticket.setState(vendor.getState());
			ticket.setVendor_type(vendor.getVendor_type());
			ticket.setAdmin_id(vendor.getAdmin_id());
			ticket.setClient_code(vendor.getClient_code());
			session.update(ticket);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public List<Expenses> getExpensesByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("admin_id", admin_id));
				criteria.addOrder(Order.asc("id"));
				List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<Products> getProductsList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Products.class);
			
				criteria.addOrder(Order.asc("id"));
				List<Products> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<Vendor> getVendorsList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Vendor.class);
			
				criteria.addOrder(Order.asc("id"));
				List<Vendor> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Integer getExpenseMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
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
	public Integer getPaymentMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ExpensePayments.class);
			criteria.setProjection(Projections.max("paymentId"));
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
	public boolean savePurchase(Expenses finance) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(finance);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean addVendor(Vendor vendor) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(vendor);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean addProduct(Products product) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(product);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Vendor getVendorDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Vendor) session.get(Vendor.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Vendor getVendorDetailsByCode(String vendor_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Vendor.class);
			criteria.add(Restrictions.eq("code", vendor_code));
			Vendor vendor = (Vendor) criteria
					.uniqueResult();
			return vendor;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		//return vendor;
	}
	
	@Override
	public boolean approveExpense(int id, String username) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("id", id));
			Expenses finance = (Expenses) criteria
					.uniqueResult();
			finance.setApproved(1);
			finance.setApproved_by(username);
			session.update(finance);

			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public Expenses getExpenseDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Expenses) session.get(Expenses.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ExpensePayments> getPaymentsForExpense(int expense_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(ExpensePayments.class);

			criteria.add(Restrictions.eq("expense_id", expense_code));

			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<ExpensePayments> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean savePaymentDetails(ExpensePayments payment) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(payment);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public double getTotalPaidForExpense(int expense_code) {
		Session session = sessionFactory.getCurrentSession();
		//double totalAmount = 0;
		try {
			SQLQuery q = session.createSQLQuery("select sum(amount_paid) from EXPENSE_PAYMENTS where expense_id='"+expense_code+"'");
			System.out.println("select sum(amount_paid) from EXPENSE_PAYMENTS where expense_id='"+expense_code+"'");
			
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
	public boolean updateExpenscePaymentStatus(int expense_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("id", expense_id));
			Expenses expense = (Expenses) criteria
					.uniqueResult();
			expense.setStatus("Paid");
			//if(status.equals("Closed")) {
			expense.setCleared_on(OzaiUtil.getCurrentDate());
			//}
			session.update(expense);
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
	public List<Expenses> getPendingExpensesByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("admin_id", admin_id));
				Criterion statusCheck = Restrictions.eq("status", "Due");
				criteria.add(Restrictions.and(statusCheck));
			
				criteria.addOrder(Order.asc("id"));
				List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<Expenses> getPaidExpensesByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("admin_id", admin_id));
				Criterion statusCheck = Restrictions.eq("status", "Paid");
				criteria.add(Restrictions.and(statusCheck));
			
				criteria.addOrder(Order.asc("cleared_on"));
				List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<Expenses> getClearedExpensesByAdmin(int admin_id, int offset, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("admin_id", admin_id));
				Criterion statusCheck = Restrictions.eq("status", "Paid");
				criteria.add(Restrictions.and(statusCheck));
			
				criteria.addOrder(Order.desc("cleared_on"));
				if (offset != 0)
					criteria.setFirstResult(offset);
				if (limit != 0)
					criteria.setMaxResults(limit);
				
				List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public int getExpensesCountByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("admin_id", admin_id));
			
			criteria.setProjection(Projections.rowCount());
			Integer row_count = (int) (long) criteria.uniqueResult();
			System.out.println(row_count);
			return row_count;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean saveProcurementRequest(Procurement_Request request) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(request);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Procurement_Request> getProcurementsRequestsByAdmin(int admin_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Procurement_Request.class);
				criteria.add(Restrictions.eq("admin_id", admin_id));
				criteria.addOrder(Order.asc("id"));
				List<Procurement_Request> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Expenses> getVendorExpenses(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("vendor_id", id));
			
				criteria.addOrder(Order.asc("id"));
				List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
}

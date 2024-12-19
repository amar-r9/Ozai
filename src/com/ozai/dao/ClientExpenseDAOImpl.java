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

import com.ozai.beans.ExpenseList;
import com.ozai.beans.TicketsData;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class ClientExpenseDAOImpl implements ClientExpenseDAO {
	
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
	public List<Expenses> getExpensesByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("client_code", client_code));
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Expenses> getPendingExpensesByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
				criteria.add(Restrictions.eq("client_code", client_code));
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
	public List<Expenses> getPaidExpensesByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);

				criteria.add(Restrictions.eq("client_code", client_code));
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
	public List<Expenses> getClearedExpensesByClient(int client_code, int offset, int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);

				criteria.add(Restrictions.eq("client_code", client_code));
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
	public int getExpensesCountByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			//Criterion user_name = Restrictions.eq("status", status);
			//criteria.add(user_name);
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
	public List<Procurement_Request> getProcurementsRequestsByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Procurement_Request.class);
				criteria.add(Restrictions.eq("client_code", client_code));
				criteria.addOrder(Order.asc("id"));
				List<Procurement_Request> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ExpenseList> getCategoryWiseExpenseDataByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<ExpenseList> studentCompPoints=new ArrayList<ExpenseList>();
		try {
			String query = "select UPPER(service_type) as category, sum(invoice_amount+gst_amount) as total_amount from expenses where CLIENT_CODE='"+client_code+"' group by service_type";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("total_amount", StandardBasicTypes.DOUBLE)
					.setResultTransformer(Transformers.aliasToBean(ExpenseList.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ExpenseList> userExpenses = compPointsQuery
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
	public List<Expenses> getPendingExpensesOfMonthAndPropertyByClient(int client_code, int property_id,
			String month) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.add(Restrictions.eq("status", "Due"));
			if(month!="All") {
				criteria.add(Restrictions.eq("service_month", month));
			}
			if(property_id!=0) {
				criteria.add(Restrictions.eq("property_code", property_id));
			} 
			criteria.addOrder(Order.desc("id"));
			
			List<Expenses> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Expenses> getPaidExpensesOfMonthAndPropertyByClient(int client_code, int property_id,
			String month) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			criteria.add(Restrictions.eq("status", "Paid"));
			if(month!="All") {
				criteria.add(Restrictions.eq("service_month", month));
			}
			if(property_id!=0) {
				criteria.add(Restrictions.eq("property_code", property_id));
			}
			criteria.addOrder(Order.desc("id"));
			
			List<Expenses> rents = criteria.list();

			return rents;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ExpenseList> getCategoryWiseExpenseDataByClientOnFilter(int client_code, String month, int property_id) {
		Session session = sessionFactory.getCurrentSession();
		List<ExpenseList> studentCompPoints=new ArrayList<ExpenseList>();
		try {
			String query = "select UPPER(service_type) as category, sum(invoice_amount+gst_amount) as total_amount from expenses where property_code='"+property_id+"' and CLIENT_CODE='"+client_code+"' group by service_type";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("total_amount", StandardBasicTypes.DOUBLE)
					.setResultTransformer(Transformers.aliasToBean(ExpenseList.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ExpenseList> userExpenses = compPointsQuery
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
	public List<Expenses> getPendingExpensesByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class, "expense");
			criteria.createAlias("expense.property", "property");

	        // Add condition for cluster_id
			criteria.add(Restrictions.eq("expense.status", "Due"));
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			
			criteria.addOrder(Order.asc("expense.id"));
			List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ExpenseList> getCategoryWiseExpenseDataByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		List<ExpenseList> studentCompPoints=new ArrayList<ExpenseList>();
		try {
			String query = "SELECT UPPER(expenses.service_type) AS category, SUM(expenses.invoice_amount + expenses.gst_amount) AS total_amount FROM EXPENSES expenses JOIN PROPERTIES property ON expenses.PROPERTY_CODE = property.ID WHERE property.CLUSTER_ID ='"+cluster_id+"' GROUP BY expenses.service_type";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("total_amount", StandardBasicTypes.DOUBLE)
					.setResultTransformer(Transformers.aliasToBean(ExpenseList.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ExpenseList> userExpenses = compPointsQuery
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
	public List<ExpenseList> getCategoryWiseExpenseDataByProperty(int property) {
		Session session = sessionFactory.getCurrentSession();
		List<ExpenseList> studentCompPoints=new ArrayList<ExpenseList>();
		try {
			String query = "SELECT UPPER(service_type) AS category, SUM(invoice_amount + gst_amount) AS total_amount FROM EXPENSES expenses WHERE PROPERTY_CODE = '"+property+"' GROUP BY expenses.service_type";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("category")
					.addScalar("total_amount", StandardBasicTypes.DOUBLE)
					.setResultTransformer(Transformers.aliasToBean(ExpenseList.class));
			//compPointsQuery.setParameter("client", client);
			
			List<ExpenseList> userExpenses = compPointsQuery
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
	public List<Expenses> getPaidExpensesByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Expenses.class, "expense");
			criteria.createAlias("expense.property", "property");

	        // Add condition for cluster_id
			criteria.add(Restrictions.eq("expense.status", "Paid"));
	        criteria.add(Restrictions.eq("property.cluster_id", cluster_id));
			
			criteria.addOrder(Order.asc("expense.id"));
			List<Expenses> finance = criteria.list();

			return finance;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
}

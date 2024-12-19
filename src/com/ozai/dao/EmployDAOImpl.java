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
import com.ozai.beans.PaymentsList;
import com.ozai.model.Employees;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.SalaryExpense;
import com.ozai.model.SalaryPayments;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class EmployDAOImpl implements EmployDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Employees> getEmployeesListByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Employees.class);
			criteria.add(Restrictions.eq("admin_id", client_code));
			criteria.addOrder(Order.asc("id"));
			List<Employees> employees = criteria.list();

			return employees;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Employees getEmployDetails(int id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Employees) session.get(Employees.class, id);

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getPaymentMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(SalaryPayments.class);
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
	public boolean saveSalaryPayment(SalaryPayments payment) {
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
	public List<SalaryPayments> getEmploySalaryListByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String query = "SELECT e.first_name as payment_status, p.ID as paymentId, e.id as employ_id, p.amount_paid as amount_paid, p.screen_shot as screen_shot, p.PAYMENT_DATE as payemnt_date FROM salary_payments p join employ e ON p.employ_id=e.id where p.admin_id='"+client_code+"'";
			Query topSchoolsQuery = session
					.createSQLQuery(query)
					.addScalar("payment_status")
					.addScalar("paymentId", StandardBasicTypes.INTEGER)
					.addScalar("employ_id")
					.addScalar("amount_paid", StandardBasicTypes.DOUBLE)
					.addScalar("screen_shot")
					.addScalar("payemnt_date", StandardBasicTypes.DATE)
					.setResultTransformer(
							Transformers.aliasToBean(SalaryPayments.class));

			@SuppressWarnings("unchecked")
			List<SalaryPayments> citiesList = topSchoolsQuery.list();
			return citiesList;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean addEmploy(Employees employ) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(employ);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/*
	 * @Override public boolean updateEmployDetails(Employees employ) { Session
	 * session = sessionFactory.getCurrentSession();
	 * 
	 * try { session.update(employ); session.flush(); session.refresh(employ);
	 * return true; } catch (HibernateException exception) {
	 * exception.printStackTrace(); return false; } }
	 */
	
	@Override
	public boolean updateEmployDetails(Employees employ) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Employees.class);
			criteria.add(Restrictions.eq("id", employ.getId()));
			Employees ticket = (Employees) criteria
					.uniqueResult();
			ticket.setAccount(employ.getAccount());
			ticket.setEmail(employ.getEmail());
			ticket.setFirst_name(employ.getFirst_name());
			ticket.setLast_name(employ.getLast_name());
			ticket.setIfsc(employ.getIfsc());
			ticket.setIdentifier(employ.getIdentifier());
			ticket.setMobile(employ.getMobile());
			ticket.setPan(employ.getPan());
			ticket.setRole(employ.getRole());
			ticket.setSalary(employ.getSalary());
			ticket.setJoin_date(employ.getJoin_date());
			ticket.setStatus(employ.getStatus());
			ticket.setResign_date(employ.getResign_date());
			session.update(ticket);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SalaryExpense> getSalariesPaidByMonthByAdmin(String month, int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session
					.createCriteria(SalaryExpense.class);
			
			Criterion join = Restrictions.eq("admin_id", client_code);
			Criterion monthCheck = Restrictions.eq("service_month", month);
			Criterion move = Restrictions.eq("status", "Paid");
			
			criteria.add(Restrictions.and(join, monthCheck, move));

			List<SalaryExpense> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SalaryExpense> getSalariesDueByMonthByAdmin(String month, int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session
					.createCriteria(SalaryExpense.class);
			
			Criterion join = Restrictions.eq("admin_id", client_code);
			Criterion monthCheck = Restrictions.eq("service_month", month);
			Criterion move = Restrictions.eq("status", "Due");
			
			criteria.add(Restrictions.and(join, monthCheck, move));

			List<SalaryExpense> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getSalaryExpenseMaxId() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(SalaryExpense.class);
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
	public boolean createExpense(SalaryExpense salary) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(salary);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SalaryExpense> getPendingSalariesByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(SalaryExpense.class);
			Criterion join = Restrictions.eq("admin_id", client_code);
			Criterion move = Restrictions.eq("status", "Due");
			
			criteria.add(Restrictions.and(join, move));

			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<SalaryExpense> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SalaryExpense> getPaidSalariesByAdmin(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(SalaryExpense.class);			
			Criterion join = Restrictions.and(
					Restrictions.isNotNull("admin_id"),
					Restrictions.eq("admin_id", client_code));
			Criterion move = Restrictions.and(
					Restrictions.isNotNull("status"),
					Restrictions.eq("status", "Paid"));
			
			criteria.add(Restrictions.and(join, move));
			
			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<SalaryExpense> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public SalaryExpense getExpenseDetails(int expense_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(SalaryExpense.class);

			criteria.add(Restrictions.eq("id", expense_code));

			SalaryExpense propertyDetails = (SalaryExpense) criteria.uniqueResult();
			return propertyDetails;

		} catch(HibernateException exception){
		     exception.printStackTrace();
				return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SalaryPayments> getSalaryPaymentsForExpense(int expense_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(SalaryPayments.class);

			criteria.add(Restrictions.eq("expense_id", expense_code));

			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<SalaryPayments> payments = criteria.list();

			return payments;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean updateExpenscePaymentStatus(int expense_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(SalaryExpense.class);
			criteria.add(Restrictions.eq("id", expense_id));
			SalaryExpense expense = (SalaryExpense) criteria
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
	public double getTotalPaidForExpense(int expense_code) {
		Session session = sessionFactory.getCurrentSession();
		//double totalAmount = 0;
		try {
			SQLQuery q = session.createSQLQuery("select sum(amount_paid) from SALARY_PAYMENTS where expense_id='"+expense_code+"'");
			System.out.println("select sum(amount_paid) from SALARY_PAYMENTS where expense_id='"+expense_code+"'");
			
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
	
	public Employees getEmployDetailsById(int employ_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Employees.class);

			criteria.add(Restrictions.eq("id", employ_id));

			Employees propertyDetails = (Employees) criteria.uniqueResult();
			return propertyDetails;

		} catch(HibernateException exception){
		     exception.printStackTrace();
				return null;
		}
	}
	
	@Override
	public boolean expenseAlreadyExist(int employ_id, String service_month) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("checking expense exist or not : "+employ_id+ " month:" +service_month);
			Criteria criteria = session.createCriteria(SalaryExpense.class);
			
			Criterion join = Restrictions.eq("id", employ_id);
			Criterion move = Restrictions.eq("service_month", service_month);
			
			criteria.add(Restrictions.and(join, move));
			
			SalaryExpense user = (SalaryExpense) criteria.uniqueResult();

			if (user != null) {
				System.out.println("Unnadu");
				return true;
			}
			else {
				System.out.println("Ledu");
				return false;
			}
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	
	}
	
	@Override
	public boolean resignEmploy(int id, Date resign_date) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Employees.class);
			criteria.add(Restrictions.eq("id", id));
			Employees user = (Employees) criteria
					.uniqueResult();
			user.setStatus("Resigned");
			user.setResign_date(resign_date);
			session.update(user);
			
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public List<Employees> getSalariesToBeGeneratedForMonthByAdmin(String month, int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String query = "SELECT EMPLOY.id as id, EMPLOY.first_name as first_name, EMPLOY.mobile as mobile, EMPLOY.role as role, EMPLOY.salary as salary, EMPLOY.join_date as join_date, EMPLOY.status as status FROM EMPLOY WHERE EMPLOY.ADMIN_ID='"+client_code+"' AND NOT EXISTS(SELECT NULL FROM SALARY_EXPENSE WHERE EMPLOY.id = SALARY_EXPENSE.employ_id and SALARY_EXPENSE.service_month='"+month+"')";
			Query topSchoolsQuery = session
					.createSQLQuery(query)
					.addScalar("id", StandardBasicTypes.INTEGER)
					.addScalar("first_name")
					.addScalar("mobile")
					.addScalar("role")
					.addScalar("salary", StandardBasicTypes.DOUBLE)
					.addScalar("join_date", StandardBasicTypes.DATE)
					//.addScalar("applicable_gst", StandardBasicTypes.DOUBLE)
					.setResultTransformer(
							Transformers.aliasToBean(Employees.class));

			@SuppressWarnings("unchecked")
			List<Employees> citiesList = topSchoolsQuery.list();
			return citiesList;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}

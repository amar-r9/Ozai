package com.ozai.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.beans.MessageBean;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.Expenses;
import com.ozai.model.Talent;

@Repository
@Transactional
public class MiscDAOImpl implements MiscDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ConsultDoctor> getPsychicMessages(String type, int limit, int offset) {
		Session session = sessionFactory.openSession();
	    Transaction transaction = null;
	    List<ConsultDoctor> list = null;

	    try {
	        transaction = session.beginTransaction();

	        String hql = "FROM ConsultDoctor m WHERE m.type = :type AND m.id IN " +
	                     "(SELECT MAX(m2.id) FROM ConsultDoctor m2 WHERE m2.type = :type GROUP BY m2.user_id)";

	        Query query = session.createQuery(hql);
	        query.setString("type", type);

	        // Set limit and offset for pagination
	        //query.setFirstResult(offset);
	        //query.setMaxResults(limit);

	        list = query.list();

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ConsultDoctor> getGynicMessages(String type, int limit, int offset) {
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;
	    List<ConsultDoctor> list = null;

	    try {
	        transaction = session.beginTransaction();

	        String hql = "FROM ConsultDoctor m WHERE m.type = :type AND m.id IN " +
	                     "(SELECT MAX(m2.id) FROM ConsultDoctor m2 WHERE m2.type = :type GROUP BY m2.user_id)";

	        Query query = session.createQuery(hql);
	        query.setString("type", type);

	        // Set limit and offset for pagination
	        //query.setFirstResult(offset);
	        //query.setMaxResults(limit);

	        list = query.list();

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ConsultDoctor> getUserMessages(String type, int user_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(ConsultDoctor.class);
			criteria.add(Restrictions.eq("user_id", user_id));
			criteria.add(Restrictions.eq("type", type));
			criteria.addOrder(Order.asc("id"));
			
			List<ConsultDoctor> messages = criteria.list();

			return messages;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public String getRecentMessage(String type, int user_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(ConsultDoctor.class);
			
			criteria.add(Restrictions.eq("user_id", user_id));
			criteria.add(Restrictions.eq("type", type));
			criteria.addOrder(Order.desc("id"));
			criteria.setMaxResults(1);
			criteria.setProjection(Projections.property("message"));
			String message = (String) criteria.uniqueResult();

			return message.toString();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveMessage(ConsultDoctor message) {
		
		Session session = sessionFactory.getCurrentSession();
		try {

			session.save(message);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ConsultDoctor> getRecentMessages(int user_id, String type, int limit, int offset) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(ConsultDoctor.class);
			
			criteria.add(Restrictions.eq("user_id", user_id));
			criteria.add(Restrictions.eq("type", type));
			
			criteria.addOrder(Order.asc("id"));
			
			//int start = (int) (criteria.list().size() - limit);
			//if (offset != 0)
				//criteria.setFirstResult(start);
			if (limit != 0)
				criteria.setMaxResults(limit);
			
			List<ConsultDoctor> messages = criteria.list();

			return messages;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean selectEntry(int id, String comment, String admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Talent.class);
			criteria.add(Restrictions.eq("id", id));
			Talent talent = (Talent) criteria.uniqueResult();
			talent.setRejected(0);
			talent.setSelected(1);
			talent.setComments(comment);
			talent.setUpdated_by(admin);
			session.update(talent);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Talent> getEntriesByOption(String option) {
	    Session session = sessionFactory.getCurrentSession();
	    
	    try {
	        Criteria criteria = session.createCriteria(Talent.class);
	        
	        // Check if the option is either "Selected" or "Rejected"
	        if(option.equalsIgnoreCase("Selected")) {
	            criteria.add(Restrictions.eq("selected", 1)); // Assuming Selected is the field
	        } else if(option.equalsIgnoreCase("Rejected")) {
	            criteria.add(Restrictions.eq("rejected", 1)); // Assuming Rejected is the field
	        }

	        // If "All" is selected, no additional criteria is added, so it retrieves all records

	        criteria.addOrder(Order.asc("id")); // Sort by ID
	        return criteria.list(); // Return the list of entries

	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return Collections.emptyList(); // Return empty list on error
	    }
	}
	
	@Override
	public boolean rejectEntry(int id, String admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Talent.class);
			criteria.add(Restrictions.eq("id", id));
			Talent talent = (Talent) criteria.uniqueResult();
			talent.setSelected(0);
			talent.setRejected(1);
			talent.setUpdated_by(admin);
			session.update(talent);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
}

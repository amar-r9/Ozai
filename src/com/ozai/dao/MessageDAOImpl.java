package com.ozai.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
import com.ozai.model.Messages;

@Repository
@Transactional
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveMessage(Messages message) {
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
	public List<Messages> getRecentMessages(int sender_id, int receiver_id, int limit, int offset) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Messages.class);
			
			Criterion sender = Restrictions.eq("sender_id", sender_id);
			Criterion receiver = Restrictions.eq("receiver_id", receiver_id);

			Criterion andFilter = Restrictions.and(sender, receiver);
			
			Criterion sendeR = Restrictions.eq("sender_id", receiver_id);
			Criterion receiveR = Restrictions.eq("receiver_id", sender_id);
			
			Criterion orFilter = Restrictions.and(sendeR, receiveR);
			
			criteria.add(Restrictions.or(andFilter, orFilter));
			criteria.addOrder(Order.asc("id"));
			
			//int start = (int) (criteria.list().size() - limit);
			//if (offset != 0)
				//criteria.setFirstResult(start);
			if (limit != 0)
				criteria.setMaxResults(limit);
			
			List<Messages> consultDoctor = criteria.list();

			return consultDoctor;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean likeAMessage(int message_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Messages.class);
			criteria.add(Restrictions.eq("id", message_id));
			Messages message = (Messages) criteria
					.uniqueResult();
			message.setLiked(true);
			session.update(message);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@Override
	public boolean reportAMessage(int message_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Messages.class);
			criteria.add(Restrictions.eq("id", message_id));
			Messages message = (Messages) criteria
					.uniqueResult();
			message.setReported(true);
			session.update(message);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Messages> getUserChats(int user_id, int limit, int offset) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Messages.class);
			
			Criterion sender = Restrictions.eq("sender_id", user_id);
			Criterion receiver = Restrictions.eq("receiver_id", user_id);
			
			criteria.add(Restrictions.or(sender, receiver));
			
			if (offset != 0)
				criteria.setFirstResult(offset);
			if (limit != 0)
				criteria.setMaxResults(limit);
			
			List<Messages> consultDoctor = criteria.list();

			return consultDoctor;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<MessageBean> getUserChatList(int client_id, int user_id, int limit, int offset) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String query = "SELECT USER.NAME AS NAME, USER.ID as OTHER_ID, MESSAGES.MESSAGE AS MESSAGE, MESSAGES.MESSAGE_TIME AS MESSAGE_TIME FROM MESSAGES JOIN USER ON MESSAGES.FINANCE where STATUS='Paid' and SERVICE_MONTH='"+offset+"' and SERVICE_YEAR='"+limit+"'";
			Query topSchoolsQuery = session
					.createSQLQuery(query)
					.addScalar("id", StandardBasicTypes.INTEGER)
					.addScalar("category")
					.addScalar("property")
					.addScalar("month")
					.addScalar("year")
					.addScalar("amount", StandardBasicTypes.DOUBLE)
					.addScalar("paid_date", StandardBasicTypes.DATE)
					.setResultTransformer(
							Transformers.aliasToBean(MessageBean.class));

			@SuppressWarnings("unchecked")
			List<MessageBean> expenseList = topSchoolsQuery.list();
			return expenseList;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public String getRecentMessage(int sender_id, int receiver_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Messages.class);
			
			Criterion sender = Restrictions.eq("sender_id", sender_id);
			Criterion receiver = Restrictions.eq("receiver_id", receiver_id);

			Criterion andFilter = Restrictions.and(sender, receiver);
			
			Criterion sendeR = Restrictions.eq("sender_id", receiver_id);
			Criterion receiveR = Restrictions.eq("receiver_id", sender_id);
			
			Criterion orFilter = Restrictions.and(sendeR, receiveR);
			criteria.add(Restrictions.or(andFilter, orFilter));
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
	public Messages getLatestMessage(int sender_id, int receiver_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Messages.class);
			
			Criterion sender = Restrictions.eq("sender_id", sender_id);
			Criterion receiver = Restrictions.eq("receiver_id", receiver_id);

			Criterion andFilter = Restrictions.and(sender, receiver);
			
			Criterion sendeR = Restrictions.eq("sender_id", receiver_id);
			Criterion receiveR = Restrictions.eq("receiver_id", sender_id);
			
			Criterion orFilter = Restrictions.and(sendeR, receiveR);
			criteria.add(Restrictions.or(andFilter, orFilter));
			criteria.addOrder(Order.desc("id"));
			criteria.setMaxResults(1);
			Messages message = (Messages) criteria.uniqueResult();

			return message;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}

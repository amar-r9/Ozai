package com.ozai.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.model.BlogArticle;

@Repository
@Transactional
public class ArticleDAOImpl implements ArticleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveArtcile(BlogArticle article) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(article);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<BlogArticle> getBlogArtciles(String category, int limit,
			int offset) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(BlogArticle.class);

			if (category != null && !category.equals("all"))
				criteria.add(Restrictions.eq("article_category", category));
			criteria.addOrder(Order.desc("article_id"));
			if (offset != 0)
				criteria.setFirstResult(offset);
			if (limit != 0)
				criteria.setMaxResults(limit);

			List<BlogArticle> Articles = criteria.list();

			return Articles;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BlogArticle> getRecentBlogArtciles(int limit) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(BlogArticle.class);

			criteria.addOrder(Order.desc("article_id"));

			if (limit != 0)
				criteria.setMaxResults(limit);
			List<BlogArticle> Articles = criteria.list();

			return Articles;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public BlogArticle getBlogArticle(int article_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (BlogArticle) session.get(
					BlogArticle.class, article_id);

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getBlogArticleCategoryList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(BlogArticle.class);

			criteria.setProjection(Projections.distinct(Projections
					.property("article_category")));

			return criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getNextOrPreviousBlogArticleCode(String category, int id,
			boolean next, boolean previous) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session
					.createCriteria(BlogArticle.class);
			criteria.add(Restrictions.eq("article_category", category));
			//criteria.addOrder(Order.desc("article_id"));
			if (next) {
				criteria.addOrder(Order.asc("article_id"));
				criteria.add(Restrictions.gt("article_id", id));
			}
			if (previous) {
				criteria.addOrder(Order.desc("article_id"));
				criteria.add(Restrictions.lt("article_id", id));

			}
			criteria.setMaxResults(1);
			BlogArticle article = (BlogArticle) criteria
					.uniqueResult();

			if (article != null && article.getArticle_id() != 0)
				return article.getArticle_id();
			else
				return 0;

		} catch (HibernateException e) {
			e.printStackTrace();

		}
		return 0;
	}

	@Override
	public int getBlogArticlesCount(String category) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(BlogArticle.class);
			if (!category.equals("all"))
				criteria.add(Restrictions.eq("article_category", category));

			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();
			return rowCount.intValue();
		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public List<BlogArticle> getUserBlogArtciles(String username, int limit,
			int offset) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(BlogArticle.class);

			//if (category != null && !category.equals("all"))
			criteria.add(Restrictions.eq("user_saved", username));
			criteria.addOrder(Order.desc("article_id"));
			if (offset != 0)
				criteria.setFirstResult(offset);
			if (limit != 0)
				criteria.setMaxResults(limit);

			List<BlogArticle> Articles = criteria.list();

			return Articles;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean incNoOfViews(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(BlogArticle.class);
			criteria.add(Restrictions.eq("article_id", id));
			BlogArticle competitionText = (BlogArticle) criteria
					.uniqueResult();
			competitionText.setViews(competitionText.getViews() + 1);
			session.update(competitionText);
			/*
			 * session.flush(); session.refresh(user);
			 */
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}

}

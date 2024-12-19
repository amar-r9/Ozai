package com.ozai.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.checkerframework.common.value.qual.IntVal;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ozai.beans.Properties;
import com.ozai.beans.RoomRevenue;
import com.ozai.model.B2BBeds;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Beds;
import com.ozai.model.BlogArticle;
import com.ozai.model.Cluster;
import com.ozai.model.DailyUpdates;
import com.ozai.model.DeliveryUpdates;
import com.ozai.model.Inventory;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.Products;
import com.ozai.model.Property_Ratings;
import com.ozai.model.RoomInventory;
import com.ozai.model.Rooms;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.model.Vendor;
import com.ozai.util.OzaiUtil;

@Repository
@Transactional
public class PropertyDAOImpl implements PropertyDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PG> getPropertiesList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(PG.class);
			
				criteria.addOrder(Order.asc("id"));
				List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;

	}
	
	public PG getPropertyDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion user = Restrictions.eq("id", id);
			Criterion sessionsId = Restrictions.eq("status", "OPEN");
			criteria.add(Restrictions.and(user, sessionsId));

			PG propertyDetails = (PG) criteria.uniqueResult();
			return propertyDetails;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPropertiesNamesList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(PG.class);

			criteria.setProjection(Projections.distinct(Projections
					.property("name")));

			return criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public List<PG> getB2CPropertiesList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion status = Restrictions.eq("client_type", "B2C");

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.asc("id"));
				List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;

	}
	
	@Override
	public List<PG> getB2BPropertiesList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion status = Restrictions.eq("client_type", "B2B");

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.asc("id"));
				List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;

	}
	
	@Override
	public List<B2BBeds> getB2BNonExPropertiesList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(B2BBeds.class);
			
			criteria.addOrder(Order.asc("id"));
			List<B2BBeds> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;

	}

	@Override
	public int getAvailableBeds(String property) {
		Session session = sessionFactory.getCurrentSession();
		try {

			Criteria criteria = session.createCriteria(B2BBeds.class);
			
			Criterion smonth = Restrictions.and(
					Restrictions.isNotNull("property_code"),
					Restrictions.eq("property_code", property));
			
			criteria.add(Restrictions.and(smonth));
			criteria.setProjection(Projections.property("remaining_beds"));
			int total = (int) criteria.uniqueResult();

			return total;

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean updateBedsNo(String code, int no) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(B2BBeds.class);
			criteria.add(Restrictions.eq("property_code", code));
			B2BBeds finance = (B2BBeds) criteria
					.uniqueResult();
			int total = finance.getNo_of_beds();
			int pre = finance.getBooked_beds();
			int totalBooked = pre + no;
			finance.setBooked_beds(totalBooked);
			finance.setRemaining_beds(total-totalBooked);
			session.update(finance);

			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	public B2BBeds getB2BBedsDetails(String code) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2BBeds.class);
			Criterion user = Restrictions.eq("property_code", code);
			//Criterion sessionsId = Restrictions.eq("status", "OPEN");
			criteria.add(Restrictions.and(user));

			B2BBeds propertyDetails = (B2BBeds) criteria.uniqueResult();
			return propertyDetails;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<User> getActiveB2CTenantsByProperty(String property) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("property", property));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.addOrder(Order.asc("id"));
			
			List<User> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket> getTicketsListByProperty(String property) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Ticket.class);
			criteria.add(Restrictions.eq("property", property));
			criteria.addOrder(Order.desc("status"));

			List<Ticket> events = criteria.list();

			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Long getPropertyRevenue(String property) {
		Session session = sessionFactory.getCurrentSession();
		try {
					
			Criteria criteria = session.createCriteria(User.class);
			
			Criterion join = Restrictions.and(
					Restrictions.isNotNull("property"),
					Restrictions.eq("property", property));
			Criterion move = Restrictions.isNotNull("moveout_date");
			
			criteria.add(Restrictions.and(join, move));
			
			criteria.setProjection(Projections.sum("rent"));
			Long total = (Long) criteria.uniqueResult();

			return total;

		} catch (HibernateException e) {
			e.printStackTrace();
			return (long) 0;
		}
	}
	
	@Override
	public Integer addProperty(PG property) {
		Session session = sessionFactory.getCurrentSession();

		try {

			return (Integer) session.save(property);
		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public Integer addRoom(Rooms room) {
		Session session = sessionFactory.getCurrentSession();

		try {
			return (Integer) session.save(room);

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PG> getActivePropertyListOfAdmin(int admin_id, int limit) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion adminId = Restrictions.eq("admin_id", admin_id);
			Criterion status = Restrictions.eq("status", "OPEN");

			criteria.add(Restrictions.and(adminId, status));
			if (limit != 0)
				criteria.setMaxResults(limit);
			criteria.addOrder(Order.asc("id"));
			List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean updatePropertyDetails(PG pg) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(pg);
			session.flush();
			session.refresh(pg);
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean updatePropertyRating(int pg_id, int rating, int user_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Property_Ratings.class);
			criteria.add(Restrictions.eq("property_id", pg_id));
			criteria.add(Restrictions.eq("user_id", user_id));
			Property_Ratings ratings = (Property_Ratings) criteria.uniqueResult();
			if(ratings!=null) {
				ratings.setRating(rating);
				ratings.setSubmit_date(OzaiUtil.getCurrentDate());
				session.update(ratings);
			} else {
				Property_Ratings rate = new Property_Ratings();
				rate.setUser_id(user_id);
				rate.setProperty_id(pg_id);
				rate.setRating(rating);
				rate.setSubmit_date(OzaiUtil.getCurrentDate());
				session.save(rate);
			}
				
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}

	@Override
	public double getPropertyRating(int pg_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Property_Ratings.class);
			criteria.add(Restrictions.eq("property_id", pg_id));
			
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();
			
			criteria.setProjection(Projections.sum("rating"));
			Long score = (Long) criteria.uniqueResult();
			if(score!=null) {
				float points = (float) score/rowCount;
				return points;
			} else {
				return 0;
			}

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int getPropertyRatingByUser(int pg_id, int user_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Criteria criteria = session.createCriteria(Property_Ratings.class);
			criteria.add(Restrictions.eq("property_id", pg_id));
			criteria.add(Restrictions.eq("user_id", user_id));
			
			criteria.setProjection(Projections.property("rating"));
			int points = (int) criteria.uniqueResult();
			if(points!=0) {
				return points;
			} else {
				return 0;
			}

		} catch (HibernateException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getLocationsByState(String state) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(PG.class);
			Criterion status = Restrictions.eq("state", state);

			criteria.add(Restrictions.and(status));
			criteria.setProjection(Projections.distinct(Projections
					.property("location")));

			return criteria.list();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PG> getPropertiesByLocation(String location) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion status = Restrictions.eq("location", location);

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.asc("id"));
				List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PG> getClientPropertiesList(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(PG.class);
			Criterion adminId = Restrictions.eq("client_code", client_code);
			Criterion status = Restrictions.eq("status", "OPEN");

				criteria.add(Restrictions.and(adminId, status));
			
				criteria.addOrder(Order.asc("id"));
				List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean saveInventory(Inventory inventory) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(inventory);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Inventory> getInventoryOfProperty(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Inventory.class);
			Criterion adminId = Restrictions.eq("property_id", id);

			criteria.add(Restrictions.and(adminId));
		
			criteria.addOrder(Order.asc("id"));
			List<Inventory> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean saveRoomInventory(RoomInventory inventory) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(inventory);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RoomInventory> getInventoryOfRoom(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(RoomInventory.class);
			Criterion adminId = Restrictions.eq("property_id", id);

			criteria.add(Restrictions.and(adminId));
		
			criteria.addOrder(Order.asc("id"));
			List<RoomInventory> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Rooms> getRoomsByProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session
					.createCriteria(Rooms.class);
			criteria.add(Restrictions.eq("property_id", property_id));
			criteria.addOrder(Order.asc("id"));

			//if (limit != 0)
				//criteria.setMaxResults(limit);
			List<Rooms> events = criteria.list();
			return events;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean addBed(Beds bed) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(bed);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Beds> getBedsByRoom(int room_id, String status) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Beds.class);
			Criterion adminId = Restrictions.eq("room_id", room_id);
			Criterion statu = Restrictions.eq("status", status);

			criteria.add(Restrictions.and(adminId, statu));
			
			criteria.addOrder(Order.desc("id"));
			List<Beds> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean updateBedStatus(int bed_id, String status) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("bed:"+bed_id+"status"+status);
		try {
			
			Criteria criteria = session.createCriteria(Beds.class);
			criteria.add(Restrictions.eq("id", bed_id));
			Beds ratings = (Beds) criteria.uniqueResult();
			
			ratings.setStatus(status);
			session.update(ratings);
			
				
			return true;
		} catch (HibernateException exception) {
			exception.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Beds> getBedsByProperty(int property_id, String status) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Beds.class);
			Criterion adminId = Restrictions.eq("property_id", property_id);
			criteria.add(Restrictions.and(adminId));			
			criteria.addOrder(Order.asc("id"));
			List<Beds> pGs = criteria.list();
			return pGs;
		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Beds> getBedsList() {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(Beds.class);
			
				criteria.addOrder(Order.asc("status"));
				List<Beds> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Properties> getPropertyList(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<Properties> studentCompPoints=new ArrayList<Properties>();
		try {
			String query = "select properties.name as property, properties.city as city, (select count(*) from beds where status='Available' and PROPERTY_ID=properties.id) as available, (select count(*) from beds where status='Occupied' and PROPERTY_ID=properties.id) as occupied from properties where properties.admin_id='"+client_code+"' group by properties.id";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("occupied", StandardBasicTypes.INTEGER)
					.addScalar("city")
					.addScalar("available", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(Properties.class));			
			List<Properties> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RoomRevenue> getPropertyWiseRevenue(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<RoomRevenue> studentCompPoints=new ArrayList<RoomRevenue>();
		try {
			String query = "select properties.name as property, properties.id as pg, (select count(*) from b2c_details where PROPERTY_ID=properties.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and PROPERTY_ID=properties.id) as total_rent from properties where properties.admin_id='"+client_code+"' group by properties.id";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("pg", StandardBasicTypes.INTEGER)
					.addScalar("count", StandardBasicTypes.INTEGER)
					.addScalar("total_rent", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(RoomRevenue.class));			
			List<RoomRevenue> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RoomRevenue> getRoomWiseRevenue(int client_code, int pg) {
		Session session = sessionFactory.getCurrentSession();
		List<RoomRevenue> studentCompPoints=new ArrayList<RoomRevenue>();
		try {
			String query = null;
			if(pg==0) {
				query = "select rooms.room_no as room, rooms.sharing as sharing, properties.name as property, (select count(*) from b2c_details where ROOM_ID=rooms.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and ROOM_ID=rooms.id) as total_rent from rooms join properties on properties.id=rooms.property_id where properties.ADMIN_ID='"+client_code+"' group by rooms.id";
			} else {
				query = "select rooms.room_no as room, rooms.sharing as sharing, properties.name as property, (select count(*) from b2c_details where ROOM_ID=rooms.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and ROOM_ID=rooms.id) as total_rent from rooms join properties on properties.id=rooms.property_id where properties.id='"+pg+"' and properties.ADMIN_ID='"+client_code+"' group by rooms.id";
			}
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("room")
					.addScalar("property")
					.addScalar("sharing", StandardBasicTypes.INTEGER)
					.addScalar("count", StandardBasicTypes.INTEGER)
					.addScalar("total_rent", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(RoomRevenue.class));			
			List<RoomRevenue> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Properties> getClientPropertyList(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<Properties> studentCompPoints=new ArrayList<Properties>();
		try {
			String query = "select properties.name as property, properties.city as city, (select count(*) from beds where status='Available' and PROPERTY_ID=properties.id) as available, (select count(*) from beds where status='Occupied' and PROPERTY_ID=properties.id) as occupied from properties where properties.client_code='"+client_code+"' group by properties.id";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("occupied", StandardBasicTypes.INTEGER)
					.addScalar("city")
					.addScalar("available", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(Properties.class));			
			List<Properties> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RoomRevenue> getClientPropertyWiseRevenue(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		List<RoomRevenue> studentCompPoints=new ArrayList<RoomRevenue>();
		try {
			String query = "select properties.name as property, properties.id as pg, (select count(*) from b2c_details where PROPERTY_ID=properties.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and PROPERTY_ID=properties.id) as total_rent from properties where properties.client_code='"+client_code+"' group by properties.id";
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("property")
					.addScalar("pg", StandardBasicTypes.INTEGER)
					.addScalar("count", StandardBasicTypes.INTEGER)
					.addScalar("total_rent", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(RoomRevenue.class));			
			List<RoomRevenue> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RoomRevenue> getClientRoomWiseRevenue(int client_code, int pg) {
		Session session = sessionFactory.getCurrentSession();
		List<RoomRevenue> studentCompPoints=new ArrayList<RoomRevenue>();
		try {
			String query = null;
			if(pg==0) {
				query = "select rooms.room_no as room, rooms.sharing as sharing, properties.name as property, (select count(*) from b2c_details where ROOM_ID=rooms.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and ROOM_ID=rooms.id) as total_rent from rooms join properties on properties.id=rooms.property_id where properties.client_code='"+client_code+"' group by rooms.id";
			} else {
				query = "select rooms.room_no as room, rooms.sharing as sharing, properties.name as property, (select count(*) from b2c_details where ROOM_ID=rooms.id and MOVEOUT_DATE is null) as count, (select sum(rent) from b2c_details where MOVEOUT_DATE is null and ROOM_ID=rooms.id) as total_rent from rooms join properties on properties.id=rooms.property_id where properties.id='"+pg+"' and properties.client_code='"+client_code+"' group by rooms.id";
			}
			Query compPointsQuery = session
					.createSQLQuery(query)
					.addScalar("room")
					.addScalar("property")
					.addScalar("sharing", StandardBasicTypes.INTEGER)
					.addScalar("count", StandardBasicTypes.INTEGER)
					.addScalar("total_rent", StandardBasicTypes.INTEGER)
					.setResultTransformer(Transformers.aliasToBean(RoomRevenue.class));			
			List<RoomRevenue> userExpenses = compPointsQuery.list();
			
			studentCompPoints.addAll(userExpenses);
			return studentCompPoints;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Beds> getBedsByPropertyAndSharing(int property_id, int sharing) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Beds.class);
			Criterion user = Restrictions.eq("property_id", property_id);
			Criterion sessionsId = Restrictions.eq("sharing", sharing);
			criteria.add(Restrictions.and(user, sessionsId));
			criteria.addOrder(Order.asc("status"));
			List<Beds> beds = criteria.list();
			return beds;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;
	}
	
	public Rooms getRoomDetails(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(Rooms.class);
			Criterion user = Restrictions.eq("id", id);
			criteria.add(Restrictions.and(user));

			Rooms room = (Rooms) criteria.uniqueResult();
			return room;

		} catch(HibernateException exception){
		     System.out.println("Problem creating session factory");
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Integer getPropertyTickets(int pg_id) {
		Session session = sessionFactory.getCurrentSession();
		Integer count=0;
		try {
			SQLQuery p = session.createSQLQuery("select ticket.id from ticket join b2c_details on ticket.user_id=b2c_details.USER_ID where b2c_details.PROPERTY_ID='"+pg_id+"'");
			SQLQuery q = session.createSQLQuery("select ticket.id from ticket join b2b_details on ticket.user_id=b2b_details.USER_ID where b2b_details.PROPERTY_ID='"+pg_id+"'");
			List l1 = p.list();
			List l2 = q.list();
			count = (l1.size()+l2.size());
			return count;

		} catch (HibernateException e) {
			e.printStackTrace();
			return count;
		}
	}
	
	@Override
	public Integer getPropertyOccupancy(int pg_id) {
		Session session = sessionFactory.getCurrentSession();

		try {

			Criteria criteria = session.createCriteria(Beds.class);
			
			Criterion scode = Restrictions.and(
					Restrictions.isNotNull("property_id"),
					Restrictions.eq("property_id", pg_id));
			criteria.add(Restrictions.and(scode));
			criteria.setProjection(Projections.rowCount());
			Long rowCount = (Long) criteria.uniqueResult();

			return rowCount.intValue();

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DailyUpdates> getDailyUpdatesOfClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(DailyUpdates.class);
			Criterion status = Restrictions.eq("client_code", client_code);

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.asc("id"));
				List<DailyUpdates> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DailyUpdates> getDailyUpdatesOfProperty(int property_id) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(DailyUpdates.class);
			Criterion status = Restrictions.eq("property_id", property_id);

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.desc("id"));
				List<DailyUpdates> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DailyUpdates> getDailyUpdatesOfDay(Date submit_date) {
		Session session = sessionFactory.getCurrentSession();

		try {
			Criteria criteria = session.createCriteria(DailyUpdates.class);
			Criterion status = Restrictions.eq("submit_date", submit_date);

				criteria.add(Restrictions.and(status));
			
				criteria.addOrder(Order.asc("id"));
				List<DailyUpdates> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2C_Details> getB2CResidentsOfRoom(int room_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2C_Details.class);
			criteria.add(Restrictions.eq("room_id", room_id));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.addOrder(Order.asc("id"));
			
			List<B2C_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<B2B_Details> getB2BResidentsOfRoom(int room_id) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Criteria criteria = session.createCriteria(B2B_Details.class);
			criteria.add(Restrictions.eq("room_id", room_id));
			criteria.add(Restrictions.isNull("moveout_date"));
			criteria.addOrder(Order.asc("id"));
			
			List<B2B_Details> tenants = criteria.list();

			return tenants;

		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public boolean saveDeliveryUpdate(DeliveryUpdates property) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(property);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DeliveryUpdates> getDeliveryUpdatesByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(DeliveryUpdates.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			
			criteria.addOrder(Order.asc("id"));
			List<DeliveryUpdates> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getRoomsByHomeTown(String home_town, int client_code) {
		Session session = sessionFactory.getCurrentSession();
	    List<Object[]> roomRowCounts = null;
	    try {
	        String queryString = "SELECT rooms.room_no, COUNT(*) AS row_count FROM rooms JOIN b2b_details ON rooms.id = b2b_details.room_id JOIN user ON b2b_details.user_id = user.id  JOIN properties ON properties.id = rooms.property_id WHERE user.home_town = :home_town AND properties.client_code = :clientCode GROUP BY rooms.id";
	        SQLQuery query = session.createSQLQuery(queryString);
	        query.setParameter("home_town", home_town);
	        query.setParameter("clientCode", client_code); // Set client code parameter
	        roomRowCounts = query.list();
	        return roomRowCounts;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return roomRowCounts;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getRoomsByLanguage(String language, int client_code) {
	    Session session = sessionFactory.getCurrentSession();
	    List<Object[]> roomRowCounts = null;
	    try {
	        String queryString = "SELECT rooms.room_no, COUNT(*) AS row_count FROM rooms JOIN b2b_details ON rooms.id = b2b_details.room_id JOIN user ON b2b_details.user_id = user.id  JOIN properties ON properties.id = rooms.property_id WHERE user.language = :language AND properties.client_code = :clientCode GROUP BY rooms.id";
	        SQLQuery query = session.createSQLQuery(queryString);
	        query.setParameter("language", language);
	        query.setParameter("clientCode", client_code); // Set client code parameter
	        roomRowCounts = query.list();
	        return roomRowCounts;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return roomRowCounts;
	    }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Rooms> getRoomsByPropertyWithAvailability(int property_id) {
	    Session session = sessionFactory.getCurrentSession();
	    List<Rooms> rooms = null;
	    try {
	        String queryString = "SELECT DISTINCT rooms.* FROM rooms WHERE rooms.id IN (SELECT DISTINCT beds.room_id FROM beds WHERE beds.status = 'Available') AND rooms.property_id = :property_id";
	        SQLQuery query = session.createSQLQuery(queryString);
	        query.setParameter("property_id", property_id);
	        rooms = query.addEntity(Rooms.class).list();
	        return rooms;
	    } catch (HibernateException e) {
	        e.printStackTrace();
	        return rooms;
	    }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PG> getPropertiesByCluster(int cluster_id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(PG.class);
			criteria.add(Restrictions.eq("cluster_id", cluster_id));
			criteria.add(Restrictions.eq("status", "OPEN"));
			
			criteria.addOrder(Order.asc("id"));
			List<PG> pGs = criteria.list();

			return pGs;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Cluster> getClustersByClient(int client_code) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Criteria criteria = session.createCriteria(Cluster.class);
			criteria.add(Restrictions.eq("client_code", client_code));
			
			criteria.addOrder(Order.asc("id"));
			List<Cluster> clusters = criteria.list();

			return clusters;

		} catch(HibernateException exception){
		     exception.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean saveClusterDetails(Cluster cluster) {
		Session session = sessionFactory.getCurrentSession();

		try {

			session.save(cluster);
			return true;

		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}

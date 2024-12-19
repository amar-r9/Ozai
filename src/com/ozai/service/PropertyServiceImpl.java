package com.ozai.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.Properties;
import com.ozai.beans.RoomRevenue;
import com.ozai.dao.PropertyDAO;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Beds;
import com.ozai.model.Cluster;
import com.ozai.model.DailyUpdates;
import com.ozai.model.DeliveryUpdates;
import com.ozai.model.Inventory;
import com.ozai.model.PG;
import com.ozai.model.RoomInventory;
import com.ozai.model.Rooms;
import com.ozai.model.Ticket;
import com.ozai.model.User;

@Service
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	PropertyDAO propertyDao;
	
	@Override
	public List<PG> getPropertiesList() {
		
		return propertyDao.getPropertiesList();
	}

	@Override
	public PG getPropertyDetails(int id) {
		return propertyDao.getPropertyDetails(id);
	}

	@Override
	public List<String> getPropertiesNamesList() {
		return propertyDao.getPropertiesNamesList();
	}
	
	@Override
	public List<PG> getB2CPropertiesList() {
		
		return propertyDao.getB2CPropertiesList();
	}

	@Override
	public List<User> getActiveB2CTenantsByProperty(String property) {
		return propertyDao.getActiveB2CTenantsByProperty(property);
	}

	@Override
	public List<Ticket> getTicketsListByProperty(String property) {
		return propertyDao.getTicketsListByProperty(property);
	}

	@Override
	public Long getPropertyRevenue(String property) {
		return propertyDao.getPropertyRevenue(property);
	}

	@Override
	public List<PG> getB2BPropertiesList() {
		return propertyDao.getB2BPropertiesList();
	}

	@Override
	public Integer addProperty(PG property) {
		return propertyDao.addProperty(property);
	}

	@Override
	public Integer addRoom(Rooms room) {
		return propertyDao.addRoom(room);
	}

	@Override
	public List<PG> getActivePropertyListOfAdmin(int admin_id, int limit) {
		return propertyDao.getActivePropertyListOfAdmin(admin_id, limit);
	}

	@Override
	public boolean updatePropertyDetails(PG pg) {
		return propertyDao.updatePropertyDetails(pg);
	}

	@Override
	public double getPropertyRating(int pg_id) {
		return propertyDao.getPropertyRating(pg_id);
	}

	@Override
	public boolean updatePropertyRating(int pg_id, int rating, int user_id) {
		return propertyDao.updatePropertyRating(pg_id, rating, user_id);
	}

	@Override
	public int getPropertyRatingByUser(int pg_id, int user_id) {
		return propertyDao.getPropertyRatingByUser(pg_id, user_id);
	}

	@Override
	public List<String> getLocationsByState(String state) {
		return propertyDao.getLocationsByState(state);
	}

	@Override
	public List<PG> getPropertiesByLocation(String location) {
		return propertyDao.getPropertiesByLocation(location);
	}

	@Override
	public List<PG> getClientPropertiesList(int client_code) {
		return propertyDao.getClientPropertiesList(client_code);
	}

	@Override
	public boolean saveInventory(Inventory inventory) {
		return propertyDao.saveInventory(inventory);
	}

	@Override
	public List<Inventory> getInventoryOfProperty(int id) {
		return propertyDao.getInventoryOfProperty(id);
	}

	@Override
	public List<Rooms> getRoomsByProperty(int pgId) {
		return propertyDao.getRoomsByProperty(pgId);
	}

	@Override
	public boolean addBed(Beds bed) {
		return propertyDao.addBed(bed);
	}

	@Override
	public List<Beds> getBedsByRoom(int room, String status) {
		return propertyDao.getBedsByRoom(room, status);
	}

	@Override
	public boolean updateBedStatus(int bed_id, String status) {
		return propertyDao.updateBedStatus(bed_id, status);
	}

	@Override
	public List<Beds> getBedsList() {
		return propertyDao.getBedsList();
	}

	@Override
	public List<Properties> getPropertyList(int client_code) {
		return propertyDao.getPropertyList(client_code);
	}

	@Override
	public List<RoomRevenue> getPropertyWiseRevenue(int client_code) {
		return propertyDao.getPropertyWiseRevenue(client_code);
	}

	@Override
	public List<RoomRevenue> getRoomWiseRevenue(int client_code, int pg) {
		return propertyDao.getRoomWiseRevenue(client_code, pg);
	}

	@Override
	public List<Beds> getBedsByProperty(int id, String status) {
		return propertyDao.getBedsByProperty(id, status);
	}

	@Override
	public List<Beds> getBedsByPropertyAndSharing(int property_id, int sharing) {
		return propertyDao.getBedsByPropertyAndSharing(property_id, sharing);
	}

	@Override
	public Rooms getRoomDetails(int id) {
		return propertyDao.getRoomDetails(id);
	}

	@Override
	public Integer getPropertyOccupancy(int pg_id) {
		return propertyDao.getPropertyOccupancy(pg_id);
	}

	@Override
	public Integer getPropertyTickets(int pg_id) {
		return propertyDao.getPropertyTickets(pg_id);
	}

	@Override
	public List<Properties> getClientPropertyList(int client_code) {
		return propertyDao.getClientPropertyList(client_code);
	}

	@Override
	public List<RoomRevenue> getClientPropertyWiseRevenue(int client_code) {
		return propertyDao.getClientPropertyWiseRevenue(client_code);
	}

	@Override
	public List<RoomRevenue> getClientRoomWiseRevenue(int client_code, int pg) {
		return propertyDao.getClientRoomWiseRevenue(client_code, pg);
	}

	@Override
	public boolean saveRoomInventory(RoomInventory inventory) {
		return propertyDao.saveRoomInventory(inventory);
	}

	@Override
	public List<RoomInventory> getInventoryOfRoom(int id) {
		return propertyDao.getInventoryOfRoom(id);
	}

	@Override
	public List<DailyUpdates> getDailyUpdatesOfClient(int client_code) {
		return propertyDao.getDailyUpdatesOfClient(client_code);
	}

	@Override
	public List<DailyUpdates> getDailyUpdatesOfProperty(int property_id) {
		return propertyDao.getDailyUpdatesOfProperty(property_id);
	}

	@Override
	public List<DailyUpdates> getDailyUpdatesOfDay(Date submit_date) {
		return propertyDao.getDailyUpdatesOfDay(submit_date);
	}

	@Override
	public List<B2C_Details> getB2CResidentsOfRoom(int id) {
		return propertyDao.getB2CResidentsOfRoom(id);
	}

	@Override
	public List<B2B_Details> getB2BResidentsOfRoom(int id) {
		return propertyDao.getB2BResidentsOfRoom(id);
	}

	@Override
	public boolean saveDeliveryUpdate(DeliveryUpdates inventory) {
		return propertyDao.saveDeliveryUpdate(inventory);
	}

	@Override
	public List<DeliveryUpdates> getDeliveryUpdatesByClient(int client_code) {
		return propertyDao.getDeliveryUpdatesByClient(client_code);
	}

	@Override
	public List<Object[]> getRoomsByHomeTown(String home_town, int client_code) {
		return propertyDao.getRoomsByHomeTown(home_town, client_code);
	}

	@Override
	public List<Object[]> getRoomsByLanguage(String language, int client_code) {
		return propertyDao.getRoomsByLanguage(language, client_code);
	}

	@Override
	public List<Rooms> getRoomsByPropertyWithAvailability(int pg) {
		return propertyDao.getRoomsByPropertyWithAvailability(pg);
	}

	@Override
	public List<PG> getPropertiesByCluster(int cluster_id) {
		return propertyDao.getPropertiesByCluster(cluster_id);
	}

	@Override
	public List<Cluster> getClustersByClient(int client_code) {
		return propertyDao.getClustersByClient(client_code);
	}

	@Override
	public boolean saveClusterDetails(Cluster cluster) {
		return propertyDao.saveClusterDetails(cluster);
	}
	
}

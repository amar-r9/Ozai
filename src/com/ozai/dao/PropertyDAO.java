package com.ozai.dao;

import java.sql.Date;
import java.util.List;

import com.ozai.beans.Properties;
import com.ozai.beans.RoomRevenue;
import com.ozai.model.B2BBeds;
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

public interface PropertyDAO {

	public List<PG> getPropertiesList();

	public PG getPropertyDetails(int id);

	public List<String> getPropertiesNamesList();

	public List<PG> getB2CPropertiesList();

	public List<B2BBeds> getB2BNonExPropertiesList();

	public int getAvailableBeds(String property);

	public boolean updateBedsNo(String code, int no_of_beds);

	public B2BBeds getB2BBedsDetails(String property);

	public List<User> getActiveB2CTenantsByProperty(String property);

	public List<Ticket> getTicketsListByProperty(String property);

	public Long getPropertyRevenue(String property);

	public List<PG> getB2BPropertiesList();

	public Integer addProperty(PG property);

	public Integer addRoom(Rooms room);

	public List<PG> getActivePropertyListOfAdmin(int admin_id, int limit);

	public boolean updatePropertyDetails(PG pg);

	public double getPropertyRating(int pg_id);

	public boolean updatePropertyRating(int pg_id, int rating, int user_id);

	public int getPropertyRatingByUser(int pg_id, int user_id);

	public List<String> getLocationsByState(String state);

	public List<PG> getPropertiesByLocation(String location);

	public List<PG> getClientPropertiesList(int client_code);

	public boolean saveInventory(Inventory inventory);

	public List<Inventory> getInventoryOfProperty(int id);

	public List<Rooms> getRoomsByProperty(int pgId);

	public boolean addBed(Beds bed);

	public List<Beds> getBedsByRoom(int room, String status);

	public boolean updateBedStatus(int bed_id, String status);

	public List<Beds> getBedsList();

	public List<Properties> getPropertyList(int client_code);

	public List<RoomRevenue> getPropertyWiseRevenue(int client_code);

	public List<RoomRevenue> getRoomWiseRevenue(int client_code, int pg);

	public List<Beds> getBedsByProperty(int id, String status);

	public List<Beds> getBedsByPropertyAndSharing(int property_id, int sharing);

	public Rooms getRoomDetails(int id);

	public Integer getPropertyOccupancy(int pg_id);

	public Integer getPropertyTickets(int pg_id);

	public List<Properties> getClientPropertyList(int client_code);

	public List<RoomRevenue> getClientPropertyWiseRevenue(int client_code);

	public List<RoomRevenue> getClientRoomWiseRevenue(int client_code, int pg);

	public boolean saveRoomInventory(RoomInventory inventory);

	public List<RoomInventory> getInventoryOfRoom(int id);

	public List<DailyUpdates> getDailyUpdatesOfClient(int client_code);

	public List<DailyUpdates> getDailyUpdatesOfProperty(int property_id);

	public List<DailyUpdates> getDailyUpdatesOfDay(Date submit_date);

	public List<B2C_Details> getB2CResidentsOfRoom(int id);

	public List<B2B_Details> getB2BResidentsOfRoom(int id);

	public boolean saveDeliveryUpdate(DeliveryUpdates inventory);

	public List<DeliveryUpdates> getDeliveryUpdatesByClient(int client_code);

	public List<Object[]> getRoomsByHomeTown(String home_town, int client_code);

	public List<Object[]> getRoomsByLanguage(String language, int client_code);

	public List<Rooms> getRoomsByPropertyWithAvailability(int pg);

	public List<PG> getPropertiesByCluster(int cluster_id);

	public List<Cluster> getClustersByClient(int client_code);

	public boolean saveClusterDetails(Cluster cluster);

	
}

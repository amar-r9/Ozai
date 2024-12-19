package com.ozai.service;

import java.sql.Date;
import java.util.List;

import com.ozai.beans.ResidentsData;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.Groceries;
import com.ozai.model.Grocery_Booking;
import com.ozai.model.Notice;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;

public interface AdminService {

	public Admin validateUser(String username, String password);

	public Integer addResident(User user);

	public boolean updateResidentDetails(User user);

	public List<User> getAllResidents();

	public List<User> getAllB2CResidents();

	public List<B2C_Details> getActiveB2CResidents(int id);

	public B2C_Details getB2CResidentDetails(int id);

	public List<Ticket> getTicketsList(int id);

	public boolean updateTicketStatus(int id, String status, String string);

	public Integer addAdmin(Admin admin);

	public boolean isAdminExist(String username);

	public List<Admin> getAllB2CAdmins();

	public Admin getAdminRoleById(int id);

	public boolean updateAdminRole(Admin admin);

	public User getResidentDetailsByMobile(String mobile);

	public boolean updateResidentStatus(int id, Date date);

	public boolean addCommentsToTicket(String comments, int id);

	public List<Ticket> getRecentTickets(int client_code, int limit);

	public Integer getMaxClientCode();

	public List<Admin> getAllAdminsByEntity(int client_code);

	public List<Notice> getNoticeByAdmin(int admin_id, int limit);

	public List<ResidentsData> getPropertyWiseResidentsDataByAdmin(int client_code);

	public List<Groceries> getGroceryList();

	public boolean saveBooking(Grocery_Booking booking);

}

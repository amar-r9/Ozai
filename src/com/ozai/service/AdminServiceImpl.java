package com.ozai.service;

import java.sql.SQLException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.ResidentsData;
import com.ozai.dao.AdminDAO;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.Groceries;
import com.ozai.model.Grocery_Booking;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.util.OzaiUtil;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	AdminDAO adminDao;
	
	@Override
	public Admin validateUser(String username, String password) {
		return adminDao.validateUser(username, password);
	}

	@Override
	public List<Ticket> getTicketsList(int id) {
		return adminDao.getTicketsList(id);
	}

	@Override
	public boolean updateTicketStatus(int id, String status, String admin) {
		return adminDao.updateTicketStatus(id, status, admin);
	}

	@Override
	public Integer addResident(User user) {
		return adminDao.addResident(user);
	}

	@Override
	public boolean updateResidentDetails(User user) {
		return adminDao.updateResidentDetails(user);
	}

	@Override
	public List<User> getAllResidents() {
		return adminDao.getAllResidents();
	}

	@Override
	public List<User> getAllB2CResidents() {
		return adminDao.getAllB2CResidents();
	}

	@Override
	public List<B2C_Details> getActiveB2CResidents(int id) {
		return adminDao.getActiveB2CResidents(id);
	}

	@Override
	public B2C_Details getB2CResidentDetails(int id) {
		return adminDao.getB2CResidentDetails(id);
	}

	@Override
	public Integer addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}

	@Override
	public boolean isAdminExist(String username) {
		return adminDao.isAdminExist(username);
	}

	@Override
	public List<Admin> getAllB2CAdmins() {
		return adminDao.getAllB2CAdmins();
	}

	@Override
	public Admin getAdminRoleById(int id) {
		return adminDao.getAdminRoleById(id);
	}

	@Override
	public boolean updateAdminRole(Admin admin) {
		return adminDao.updateAdminRole(admin);
	}

	@Override
	public User getResidentDetailsByMobile(String mobile) {
		return adminDao.getResidentDetailsByMobile(mobile);
	}

	@Override
	public boolean updateResidentStatus(int id, Date date) {
		return adminDao.updateResidentStatus(id, date);
	}

	@Override
	public boolean addCommentsToTicket(String comments, int id) {
		return adminDao.addCommentsToTicket(comments, id);
	}

	@Override
	public List<Ticket> getRecentTickets(int client_code, int limit) {
		return adminDao.getRecentTickets(client_code, limit);
	}

	@Override
	public Integer getMaxClientCode() {
		return adminDao.getMaxClientCode();
	}

	@Override
	public List<Admin> getAllAdminsByEntity(int client_code) {
		return adminDao.getAllAdminsByEntity(client_code);
	}

	@Override
	public List<Notice> getNoticeByAdmin(int admin_id, int limit) {
		return adminDao.getNoticeByAdmin(admin_id, limit);
	}

	@Override
	public List<ResidentsData> getPropertyWiseResidentsDataByAdmin(int client_code) {
		return adminDao.getPropertyWiseResidentsDataByAdmin(client_code);
	}

	@Override
	public List<Groceries> getGroceryList() {
		return adminDao.getGroceryList();
	}

	@Override
	public boolean saveBooking(Grocery_Booking booking) {
		return adminDao.saveBooking(booking);
	}
	
}

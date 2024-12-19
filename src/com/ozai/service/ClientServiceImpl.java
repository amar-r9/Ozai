package com.ozai.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.ResidentsData;
import com.ozai.beans.TicketsData;
import com.ozai.dao.AdminDAO;
import com.ozai.dao.ClientDAO;
import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Badges;
import com.ozai.model.ClientUser;
import com.ozai.model.ClientWorkSites;
import com.ozai.model.GateRequests;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.ReportUser;
import com.ozai.model.Staff;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.UserComplaints;
import com.ozai.model.UserEmotion;
import com.ozai.model.Ticket;
import com.ozai.model.Transport;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.util.OzaiUtil;

@Service
public class ClientServiceImpl implements ClientService {

	
	@Autowired
	ClientDAO adminDao;
	
	@Override
	public ClientUser validateClientUser(String username, String password) {
		return adminDao.validateClientUser(username, password);
	}

	@Override
	public List<Ticket> getTicketsListByClient(int id) {
		return adminDao.getTicketsListByClient(id);
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
	public List<B2B_Details> getAllResidentsByClient(int id) {
		return adminDao.getAllResidentsByClient(id);
	}
	
	@Override
	public List<B2B_Details> getActiveResidentsByClient(int id) {
		return adminDao.getActiveResidentsByClient(id);
	}

	@Override
	public B2B_Details getResidentDetails(int id) {
		return adminDao.getResidentDetails(id);
	}

	@Override
	public Integer addClientUser(ClientUser admin) {
		return adminDao.addClientUser(admin);
	}

	@Override
	public boolean isClientUserExist(String username) {
		return adminDao.isClientUserExist(username);
	}

	@Override
	public List<ClientUser> getAllClientUsers() {
		return adminDao.getAllClientUsers();
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
	public List<Ticket> getRecentTicketsByClient(int client_code, int limit) {
		return adminDao.getRecentTicketsByClient(client_code, limit);
	}

	@Override
	public ClientUser getClientUserRoleById(int id) {
		return adminDao.getClientUserRoleById(id);
	}

	@Override
	public boolean updateClientUserRole(ClientUser admin) {
		return adminDao.updateClientUserRole(admin);
	}

	@Override
	public Integer getResidentsCountByClient(int client_code) {
		return adminDao.getResidentsCountByClient(client_code);
	}

	@Override
	public Integer getPropertiesCountByClient(int client_code) {
		return adminDao.getPropertiesCountByClient(client_code);
	}

	@Override
	public Integer getTicketsCountByClient(int client_code) {
		return adminDao.getTicketsCountByClient(client_code);
	}

	@Override
	public List<ResidentsData> getPropertyWiseResidentsDataByClient(int client_code) {
		return adminDao.getPropertyWiseResidentsDataByClient(client_code);
	}

	@Override
	public List<Notice> getNoticeByClient(int client_code, int limit) {
		return adminDao.getNoticeByClient(client_code, limit);
	}

	@Override
	public boolean saveNotice(Notice notice) {
		return adminDao.saveNotice(notice);
	}

	@Override
	public List<ClientWorkSites> getClientWorkSites(int client_code) {
		return adminDao.getClientWorkSites(client_code);
	}

	@Override
	public boolean addWorkSite(ClientWorkSites site) {
		return adminDao.addWorkSite(site);
	}

	@Override
	public boolean saveRouteForClient(Transport transport) {
		return adminDao.saveRouteForClient(transport);
	}

	@Override
	public List<Transport> getClientTripsList(int client_code) {
		return adminDao.getClientTripsList(client_code);
	}

	@Override
	public boolean saveComplaintOnUser(UserComplaints report) {
		return adminDao.saveComplaintOnUser(report);
	}

	@Override
	public List<UserComplaints> getUserComplaints(int id) {
		return adminDao.getUserComplaints(id);
	}

	@Override
	public boolean saveUserReport(ReportUser report) {
		return adminDao.saveUserReport(report);
	}

	@Override
	public boolean checkUserReportForMonth(int id, String currentMonth) {
		return adminDao.checkUserReportForMonth(id, currentMonth);
	}

	@Override
	public List<ReportUser> getUserReports(int id) {
		return adminDao.getUserReports(id);
	}

	@Override
	public ClientUser getClientUserRoleByMobile(String mobile) {
		return adminDao.getClientUserRoleByMobile(mobile);
	}

	@Override
	public List<ClientUser> getAllClientUsersByClientId(int client_code) {
		return adminDao.getAllClientUsersByClientId(client_code);
	}

	@Override
	public Integer getNotificationsCountByClient(int client_code) {
		return adminDao.getNotificationsCountByClient(client_code);
	}

	@Override
	public Transport getTripDetails(int id) {
		return adminDao.getTripDetails(id);
	}

	@Override
	public List<TRIP_BOOKINGS> getBookingsList(int client_code) {
		return adminDao.getBookingsList(client_code);
	}

	@Override
	public List<TRIP_BOOKINGS> getBookingsListByTrip(int trip_id) {
		return adminDao.getBookingsListByTrip(trip_id);
	}

	@Override
	public List<B2B_Details> getActiveResidentsByProperty(int property_id) {
		return adminDao.getActiveResidentsByProperty(property_id);
	}

	@Override
	public List<B2C_Details> getB2CResidentsByClient(int client_code) {
		return adminDao.getB2CResidentsByClient(client_code);
	}

	@Override
	public List<TicketsData> getStatusWiseTicketsDataByClient(int client_code) {
		return adminDao.getStatusWiseTicketsDataByClient(client_code);
	}

	@Override
	public List<TicketsData> getCategoryWiseTicketsDataByClient(int client_code) {
		return adminDao.getCategoryWiseTicketsDataByClient(client_code);
	}

	@Override
	public List<Ticket> getTicketsOfMonthAndPropertyByClient(int client_code, int property_id, String month) {
		return adminDao.getTicketsOfMonthAndPropertyByClient(client_code, property_id, month);
	}

	@Override
	public List<TicketsData> getCategoryWiseTicketsDataByClientOnFilter(int client_code, String month,
			int property_id) {
		return adminDao.getCategoryWiseTicketsDataByClientOnFilter(client_code, month, property_id);
	}

	@Override
	public ClientUser getClientUserByUsername(String user) {
		return adminDao.getClientUserByUsername(user);
	}

	@Override
	public List<UserEmotion> getUserEmotionsByClient(int client_code) {
		return adminDao.getUserEmotionsByClient(client_code);
	}

	@Override
	public User getUserById(int user) {
		return adminDao.getUserById(user);
	}

	@Override
	public Integer getEmotionsCountByClient(int client_code) 
	{
		return adminDao.getEmotionsCountByClient(client_code);
	}

	@Override
	public boolean checkBadgeExistForMonth(int user_id, String currentMonth, String title) {
		return adminDao.checkBadgeExistForMonth(user_id, currentMonth, title);
	}

	@Override
	public boolean saveUserBadge(Badges badges) {
		return adminDao.saveUserBadge(badges);
	}

	@Override
	public List<Badges> getUserBadges(int id) {
		return adminDao.getUserBadges(id);
	}

	@Override
	public Integer addGateRequest(GateRequests request) {
		return adminDao.addGateRequest(request);
	}

	@Override
	public List<GateRequests> getGateRequests(int client_code, String status, int limit) {
		return adminDao.getGateRequests(client_code, status, limit);
	}

	@Override
	public GateRequests getGateRequestDetails(int id) {
		return adminDao.getGateRequestDetails(id);
	}

	@Override
	public boolean approveGateRequest(int requestId) {
		return adminDao.approveGateRequest(requestId);
	}

	@Override
	public List<GateRequests> getUserGateRequests(int user_id, String status, int limit) {
		return adminDao.getUserGateRequests(user_id, status, limit);
	}

	@Override
	public List<Staff> getStaffListByClient(int client_code) {
		return adminDao.getStaffListByClient(client_code);
	}

	@Override
	public List<Staff> getStaffListByProperty(int property_id) {
		return adminDao.getStaffListByProperty(property_id);
	}

	@Override
	public boolean addStaff(Staff staff) {
		return adminDao.addStaff(staff);
	}

	@Override
	public List<ResidentsData> getPropertyWiseResidentsDataOfCluster(int cluster_id) {
		return adminDao.getPropertyWiseResidentsDataOfCluster(cluster_id);
	}

	@Override
	public List<Ticket> getRecentTicketsByCluster(int cluster_id, int limit) {
		return adminDao.getRecentTicketsByCluster(cluster_id, limit);
	}

	@Override
	public List<Notice> getNoticeByCluster(int cluster_id, int limit) {
		return adminDao.getNoticeByCluster(cluster_id, limit);
	}

	@Override
	public List<Ticket> getRecentTicketsOfProperty(int property, int limit) {
		return adminDao.getRecentTicketsOfProperty(property, limit);
	}

	@Override
	public List<Notice> getNoticeByProperty(int property, int limit) {
		return adminDao.getNoticeByProperty(property, limit);
	}

	@Override
	public Integer getResidentsCountByCluster(int cluster_id) {
		return adminDao.getResidentsCountByCluster(cluster_id);
	}

	@Override
	public Integer getResidentsCountByProperty(int property_id) {
		return adminDao.getResidentsCountByProperty(property_id);
	}

	@Override
	public Integer getPropertiesCountByCluster(int cluster_id) {
		return adminDao.getPropertiesCountByCluster(cluster_id);
	}

	@Override
	public Integer getTicketsCountByCluster(int cluster_id) {
		return adminDao.getTicketsCountByCluster(cluster_id);
	}

	@Override
	public Integer getTicketsCountByProperty(int property) {
		return adminDao.getTicketsCountByProperty(property);
	}

	@Override
	public Integer getNotificationsCountByCluster(int cluster_id) {
		return adminDao.getNotificationsCountByCluster(cluster_id);
	}

	@Override
	public Integer getNotificationsCountByProperty(int property) {
		return adminDao.getNotificationsCountByProperty(property);
	}

	@Override
	public List<B2B_Details> getActiveResidentsByCluster(int cluster_id) {
		return adminDao.getActiveResidentsByCluster(cluster_id);
	}

	@Override
	public List<TicketsData> getStatusWiseTicketsDataByCluster(int cluster_id) {
		return adminDao.getStatusWiseTicketsDataByCluster(cluster_id);
	}

	@Override
	public List<TicketsData> getCategoryWiseTicketsDataByCluster(int cluster_id) {
		return adminDao.getCategoryWiseTicketsDataByCluster(cluster_id);
	}

	@Override
	public Integer getClientMaxId() {
		return adminDao.getClientMaxId();
	}

	@Override
	public String getExistingClients(String name) {
		return adminDao.getExistingClients(name);
	}

	@Override
	public ClientUser getClientByName(String client) {
		return adminDao.getClientByName(client);
	}

	@Override
	public ClientUser findByVerificationToken(String token) {
		return adminDao.findByVerificationToken(token);
	}
	
}

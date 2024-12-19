package com.ozai.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.List;

import com.ozai.beans.ResidentsData;
import com.ozai.beans.TicketsData;
import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Badges;
import com.ozai.model.ClientUser;
import com.ozai.model.ClientWorkSites;
import com.ozai.model.GateRequests;
import com.ozai.model.Notice;
import com.ozai.model.ReportUser;
import com.ozai.model.Staff;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.UserComplaints;
import com.ozai.model.UserEmotion;
import com.ozai.model.Ticket;
import com.ozai.model.Transport;
import com.ozai.model.User;

public interface ClientDAO {
	
	public ClientUser validateClientUser(String username, String password);

	public Integer addClientUser(ClientUser admin);

	public boolean isClientUserExist(String username);

	public List<ClientUser> getAllClientUsers();

	public ClientUser getClientUserRoleById(int id);

	public boolean updateClientUserRole(ClientUser admin);

	public Integer addResident(User user);

	public boolean updateResidentDetails(User user);

	public List<B2B_Details> getAllResidentsByClient(int id);

	public List<B2B_Details> getActiveResidentsByClient(int id);

	public B2B_Details getResidentDetails(int id);

	public List<Ticket> getTicketsListByClient(int id);

	public boolean updateTicketStatus(int id, String status, String admin);

	public User getResidentDetailsByMobile(String mobile);

	public boolean updateResidentStatus(int id, Date moveout);

	public boolean addCommentsToTicket(String comments, int id);

	public List<Ticket> getRecentTicketsByClient(int client_code, int limit);

	public Integer getResidentsCountByClient(int client_code);

	public Integer getPropertiesCountByClient(int client_code);

	public Integer getTicketsCountByClient(int client_code);

	public List<ResidentsData> getPropertyWiseResidentsDataByClient(int client_code);

	public List<Notice> getNoticeByClient(int client_code, int limit);

	public boolean saveNotice(Notice notice);

	public List<ClientWorkSites> getClientWorkSites(int client_code);

	public boolean addWorkSite(ClientWorkSites site);

	public boolean saveRouteForClient(Transport transport);

	public List<Transport> getClientTripsList(int client_code);

	public boolean saveComplaintOnUser(UserComplaints report);

	public List<UserComplaints> getUserComplaints(int id);

	public boolean saveUserReport(ReportUser report);

	public boolean checkUserReportForMonth(int id, String currentMonth);

	public List<ReportUser> getUserReports(int id);

	public ClientUser getClientUserRoleByMobile(String mobile);

	public List<ClientUser> getAllClientUsersByClientId(int client_code);

	public Integer getNotificationsCountByClient(int client_code);

	public Transport getTripDetails(int id);

	public List<TRIP_BOOKINGS> getBookingsList(int client_code);

	public List<TRIP_BOOKINGS> getBookingsListByTrip(int trip_id);

	public List<B2B_Details> getActiveResidentsByProperty(int property_id);

	public List<B2C_Details> getB2CResidentsByClient(int client_code);

	public List<TicketsData> getStatusWiseTicketsDataByClient(int client_code);

	public List<TicketsData> getCategoryWiseTicketsDataByClient(int client_code);

	public List<Ticket> getTicketsOfMonthAndPropertyByClient(int client_code, int property_id, String month);

	public List<TicketsData> getCategoryWiseTicketsDataByClientOnFilter(int client_code, String month, int property_id);

	public ClientUser getClientUserByUsername(String user);

	public List<UserEmotion> getUserEmotionsByClient(int client_code);
	
	public User getUserById(int user);

	public Integer getEmotionsCountByClient(int client);

	public boolean checkBadgeExistForMonth(int user_id, String currentMonth, String title);

	public boolean saveUserBadge(Badges badges);

	public List<Badges> getUserBadges(int id);

	public Integer addGateRequest(GateRequests request);

	public List<GateRequests> getGateRequests(int client_code, String status, int limit);

	public GateRequests getGateRequestDetails(int id);

	public boolean approveGateRequest(int requestId);

	public List<GateRequests> getUserGateRequests(int user_id, String status, int limit);

	public List<Staff> getStaffListByClient(int client_code);

	public List<Staff> getStaffListByProperty(int property_id);

	public boolean addStaff(Staff staff);

	public List<ResidentsData> getPropertyWiseResidentsDataOfCluster(int cluster_id);

	public List<Ticket> getRecentTicketsByCluster(int cluster_id, int limit);

	public List<Notice> getNoticeByCluster(int cluster_id, int limit);

	public List<Ticket> getRecentTicketsOfProperty(int property, int limit);

	public List<Notice> getNoticeByProperty(int property, int limit);

	public Integer getResidentsCountByCluster(int cluster_id);

	public Integer getResidentsCountByProperty(int property_id);

	public Integer getPropertiesCountByCluster(int cluster_id);

	public Integer getTicketsCountByCluster(int cluster_id);

	public Integer getTicketsCountByProperty(int property);

	public Integer getNotificationsCountByCluster(int cluster_id);

	public Integer getNotificationsCountByProperty(int property);

	public List<B2B_Details> getActiveResidentsByCluster(int cluster_id);

	public List<TicketsData> getStatusWiseTicketsDataByCluster(int cluster_id);

	public List<TicketsData> getCategoryWiseTicketsDataByCluster(int cluster_id);

	public Integer getClientMaxId();

	public String getExistingClients(String name);

	public ClientUser getClientByName(String client);

	public ClientUser findByVerificationToken(String token);
}

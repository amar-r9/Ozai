package com.ozai.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.OzaiDAO;
import com.ozai.model.Badminton_league;
import com.ozai.model.Contact;
import com.ozai.model.DailyUpdates;
import com.ozai.model.Delivery;
import com.ozai.model.Enquiry;
import com.ozai.model.Event;
import com.ozai.model.FIND_BED;
import com.ozai.model.FlightTickets;
import com.ozai.model.INVITE_FRIEND;
import com.ozai.model.Insurance;
import com.ozai.model.Loan;
import com.ozai.model.Notice;
import com.ozai.model.Referral;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.TRYITFIRST;
import com.ozai.model.Talent;
import com.ozai.model.Ticket;
import com.ozai.model.Token;
import com.ozai.model.User;
import com.ozai.model.UserEmotion;
import com.ozai.model.UserLikeValidation;
import com.ozai.model.VehicleInsurance;
import com.ozai.model.VirtualDoctor;
import com.ozai.util.OzaiUtil;

@Service
public class OzaiServiceImpl implements OzaiService {

	@Autowired
	OzaiDAO ozaiDao;

	@Override
	public boolean saveEnquiry(Enquiry enquiry) {
		return ozaiDao.saveEnquiry(enquiry);
	}
	
	@Override
	public Integer saveTalent(Talent talent) {
		return ozaiDao.saveTalent(talent);
	}
	
	@Override
	public List<Talent> getAllTalentEntries() {
		return ozaiDao.getAllTalentEntries();
	}
	
	@Override
	public Talent getTalentEntry(int id) {
		return ozaiDao.getTalentEntry(id);
	}
	
	@Override
	public List<Ticket> getUserTicketsList(int user_id) {
		return ozaiDao.getUserTicketsList(user_id);
	}

	@Override
	public Ticket getTicketDetails(int id) {
		return ozaiDao.getTicketDetails(id);
	}
	
	@Override
	public boolean addTicket(Ticket ticket) {
		return ozaiDao.addTicket(ticket);
	}
	
	@Override
	public Notice getLatestNotice(Date date) {
		return ozaiDao.getLatestNotice(date);
	}

	@Override
	public boolean isMobileExist(String mobile) {
		
		return ozaiDao.isMobileExist(mobile);
	}

	@Override
	public boolean increaseLoginCount(String username) {
		return ozaiDao.increaseLoginCount(username);
	}

	@Override
	public List<Talent> getAllTalentEntriesByClient(String client) {
		return ozaiDao.getAllTalentEntriesByClient(client);
	}

	@Override
	public boolean saveEntryVisit(int id) {
		return ozaiDao.saveEntryVisit(id);
	}

	@Override
	public Integer getTicketMaxId() {
		return ozaiDao.getTicketMaxId();
	}

	@Override
	public boolean applyLoan(Loan loan) {
		return ozaiDao.applyLoan(loan);
	}

	@Override
	public boolean isUserAppliedForLoan(String user_id) {
		return ozaiDao.isUserAppliedForLoan(user_id);
	}

	@Override
	public Integer getResidentsCountByAdmin(int client_code) {
		return ozaiDao.getResidentsCountByAdmin(client_code);
	}

	@Override
	public Integer getPropertiesCountByAdmin(int client_code) {
		return ozaiDao.getPropertiesCountByAdmin(client_code);
	}

	@Override
	public Integer getTicketsCountByAdmin(int client_code) {
		return ozaiDao.getTicketsCountByAdmin(client_code);
	}

	@Override
	public double getTotalRevenueByAdmin(int client_code) {
		return ozaiDao.getTotalRevenueByAdmin(client_code);
	}

	@Override
	public double getTotalPendningByAdmin(int client_code) {
		return ozaiDao.getTotalPendningByAdmin(client_code);
	}

	@Override
	public double getTotalCollectedByAdmin(int client_code) {
		return ozaiDao.getTotalCollectedByAdmin(client_code);
	}

	@Override
	public double getTotalMonthPendingByAdmin(int client_code, String month) {
		return ozaiDao.getTotalMonthPendingByAdmin(client_code, month);
	}

	@Override
	public double getTotalMonthCollectedByAdmin(int client_code, String month) {
		return ozaiDao.getTotalMonthCollectedByAdmin(client_code, month);
	}

	@Override
	public boolean addMobileInterest(TRYITFIRST tryitfirst) {
		return ozaiDao.addMobileInterest(tryitfirst);
	}

	@Override
	public boolean isUserInterestedInTryItFirst(String mobile) {
		return ozaiDao.isUserInterestedInTryItFirst(mobile);
	}

	@Override
	public boolean saveReferral(Referral refer) {
		return ozaiDao.saveReferral(refer);
	}

	@Override
	public boolean saveInvitation(INVITE_FRIEND refer) {
		return ozaiDao.saveInvitation(refer);
	}

	@Override
	public boolean saveContact(Contact contact) {
		return ozaiDao.saveContact(contact);
	}

	@Override
	public boolean saveBedRequest(FIND_BED find) {
		return ozaiDao.saveBedRequest(find);
	}

	@Override
	public boolean registerForBadminton(Badminton_league league) {
		return ozaiDao.registerForBadminton(league);
	}

	@Override
	public boolean isUserRegisteredForBadminton(String user_type, int id) {
		return ozaiDao.isUserRegisteredForBadminton(user_type, id);
	}

	@Override
	public boolean saveToken(Token token) {
		return ozaiDao.saveToken(token);
	}

	@Override
	public boolean deleteToken(String sessionId, String type) {
		return ozaiDao.deleteToken(sessionId, type);
	}

	@Override
	public List<String> getUserDeviceId(String username, String type) {
		return ozaiDao.getUserDeviceId(username, type);
	}

		
	@Override
	public boolean isUserBookedThisTrip(int trip_id, int user_id) {
		return ozaiDao.isUserBookedThisTrip(trip_id, user_id);
	}

	@Override
	public boolean bookThisTrip(TRIP_BOOKINGS trip) {
		return ozaiDao.bookThisTrip(trip);
	}

	@Override
	public boolean updateAvailableSeats(int tripId) {
		return ozaiDao.updateAvailableSeats(tripId);
	}

	@Override
	public boolean saveEvent(Event event) {
		return ozaiDao.saveEvent(event);
	}

	@Override
	public List<Event> getEventsByAdmin(int client_code) {
		return ozaiDao.getEventsByAdmin(client_code);
	}

	@Override
	public Integer getNotificationsCountByAdmin(int client_code) {
		return ozaiDao.getNotificationsCountByAdmin(client_code);
	}

	@Override
	public double getExpensesCountByAdmin(int client_code, String thisMonth) {
		return ozaiDao.getExpensesCountByAdmin(client_code, thisMonth);
	}

	@Override
	public List<Event> getEventsByClient(int client_code) {
		return ozaiDao.getEventsByClient(client_code);
	}

	@Override
	public boolean addDeliveryUpdate(Delivery delivery) {
		return ozaiDao.addDeliveryUpdate(delivery);
	}

	@Override
	public boolean addDailyUpdate(DailyUpdates update) {
		return ozaiDao.addDailyUpdate(update);
	}

	@Override
	public List<DailyUpdates> getDailyUpdatesByClient(int client_code) {
		return ozaiDao.getDailyUpdatesByClient(client_code);
	}

	@Override
	public boolean submitForVirtualDoctor(VirtualDoctor doctor) {
		return ozaiDao.submitForVirtualDoctor(doctor);
	}

	@Override
	public boolean savePersonalInsurance(Insurance insurance) {
		return ozaiDao.savePersonalInsurance(insurance);
	}

	@Override
	public boolean saveVehicleInsurance(VehicleInsurance insurance) {
		return ozaiDao.saveVehicleInsurance(insurance);
	}

	@Override
	public Event getEventDetails(int id) {
		return ozaiDao.getEventDetails(id);
	}

	@Override
	public Integer getEventMaxId() {
		return ozaiDao.getEventMaxId();
	}
	
	@Override
	public boolean saveFlightTickets(FlightTickets flightTickets)
	{
		return ozaiDao.saveFlightTickets(flightTickets);
	}
	
	
	@Override
	public boolean saveUserEmotion(UserEmotion userEmotion)
	{
		return ozaiDao.saveUserEmotion(userEmotion);
	}

	@Override
	public boolean isUserEmotionSelectedForDate(int userId, Date today) 
	{
		return ozaiDao.isUserEmotionSelectedForDate(userId, today);
	}
	
	@Override
	public List<String> getUsernamesByClientCode(int clientCode) {
		return ozaiDao.getUsernamesByClientCode(clientCode);
	}

	@Override
	public List<String> getUserDeviceIds(List<String> usernames) {
		return ozaiDao.getUserDeviceIds(usernames);
	}
	
	@Override
	public List<String> getCampUserDeviceIds(List<String> usernames) {
		return ozaiDao.getCampUserDeviceIds(usernames);
	}

	@Override
	public List<String> getResidentUsernamesByClient(int client_code) {
		return ozaiDao.getResidentUsernamesByClient(client_code);
	}

	@Override
	public List<String> getResidentUserDeviceIds(List<String> usernames) {
		return ozaiDao.getResidentUserDeviceIds(usernames);
	}

	@Override
	public List<String> getOrganizationsList() {
		return ozaiDao.getOrganizationsList();
	}

	@Override
	public boolean isUserLiked(UserLikeValidation userLikeValidation) {
		
		UserLikeValidation userLike = ozaiDao
				.isUserLiked(userLikeValidation);
		if (userLike != null) {
			return OzaiUtil.isDateIsToday(String.valueOf(userLike.getLikeDate()));

		} else
			return false;

	}

	@Override
	public boolean saveUserLike(UserLikeValidation userLikeValidation) {
		return ozaiDao.saveUserLike(userLikeValidation);
	}

	@Override
	public boolean updateEntryPoints(int entry_id, int points) {
		return ozaiDao.updateEntryPoints(entry_id, points);		
	}

	@Override
	public List<User> getSmartIdolRegistrations() {
		return ozaiDao.getSmartIdolRegistrations();
	}

	@Override
	public List<Event> getEventsByCluster(int cluster_id) {
		return ozaiDao.getEventsByCluster(cluster_id);
	}

	@Override
	public List<Event> getEventsByProperty(int property) {
		return ozaiDao.getEventsByProperty(property);
	}
}

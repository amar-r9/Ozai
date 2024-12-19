package com.ozai.dao;

import java.util.Date;
import java.util.List;

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

public interface OzaiDAO {

	public boolean saveEnquiry(Enquiry enquiry);

	public Integer saveTalent(Talent talent);
	
	public List<Talent> getAllTalentEntries();
	
	public Talent getTalentEntry(int id);

	public List<Ticket> getUserTicketsList(int user_id);

	public Ticket getTicketDetails(int id);

	public boolean addTicket(Ticket ticket);

	public Notice getLatestNotice(Date date);

	public boolean isMobileExist(String mobile);

	public boolean increaseLoginCount(String username);

	public List<Talent> getAllTalentEntriesByClient(String client);

	public boolean saveEntryVisit(int id);

	public Integer getTicketMaxId();

	public boolean applyLoan(Loan loan);

	public boolean isUserAppliedForLoan(String id);

	public Integer getResidentsCountByAdmin(int client_code);

	public Integer getPropertiesCountByAdmin(int client_code);

	public Integer getTicketsCountByAdmin(int client_code);

	public double getTotalRevenueByAdmin(int client_code);

	public double getTotalPendningByAdmin(int client_code);

	public double getTotalCollectedByAdmin(int client_code);

	public double getTotalMonthPendingByAdmin(int client_code, String month);

	public double getTotalMonthCollectedByAdmin(int client_code, String month);

	public boolean addMobileInterest(TRYITFIRST tryitfirst);

	public boolean isUserInterestedInTryItFirst(String mobile);

	public boolean saveReferral(Referral refer);

	public boolean saveInvitation(INVITE_FRIEND refer);

	public boolean saveContact(Contact contact);

	public boolean saveBedRequest(FIND_BED find);

	public boolean registerForBadminton(Badminton_league league);

	public boolean isUserRegisteredForBadminton(String user_type, int id);

	public boolean saveToken(Token token);

	public boolean deleteToken(String sessionId, String type);

	public List<String> getUserDeviceId(String username, String type);

	public boolean isUserBookedThisTrip(int trip_id, int user_id);

	public boolean bookThisTrip(TRIP_BOOKINGS trip);

	public boolean updateAvailableSeats(int tripId);

	public boolean saveEvent(Event event);

	public List<Event> getEventsByAdmin(int client_code);

	public Integer getNotificationsCountByAdmin(int client_code);

	public double getExpensesCountByAdmin(int client_code, String thisMonth);

	public List<Event> getEventsByClient(int client_code);

	public boolean addDeliveryUpdate(Delivery delivery);

	public boolean addDailyUpdate(DailyUpdates update);

	public List<Delivery> getDeliveryListByClient(int client_code);

	public List<DailyUpdates> getDailyUpdatesByClient(int client_code);

	public boolean submitForVirtualDoctor(VirtualDoctor doctor);

	public boolean savePersonalInsurance(Insurance insurance);

	public boolean saveVehicleInsurance(VehicleInsurance insurance);

	public Event getEventDetails(int id);

	public Integer getEventMaxId();
	
	public boolean saveFlightTickets(FlightTickets flightTickets);
	
	public boolean saveUserEmotion(UserEmotion userEmotion);

	public boolean isUserEmotionSelectedForDate(int userId, Date date);
	
	public List<String> getUsernamesByClientCode(int clientCode);
	
	public List<String> getCampUserDeviceIds(List<String> usernames);

	public List<String> getResidentUsernamesByClient(int client_code);

	public List<String> getResidentUserDeviceIds(List<String> usernames);

	public List<String> getUserDeviceIds(List<String> sessionId);

	public List<String> getOrganizationsList();

	public boolean saveUserLike(UserLikeValidation userLikeValidation);

	public UserLikeValidation isUserLiked(UserLikeValidation userLikeValidation);

	public boolean updateEntryPoints(int entry_id, int points);

	public List<User> getSmartIdolRegistrations();

	public List<Event> getEventsByCluster(int cluster_id);

	public List<Event> getEventsByProperty(int property);
	
}

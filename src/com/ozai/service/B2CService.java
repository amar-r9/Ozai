package com.ozai.service;

import java.util.List;

import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.VACATENOTICE;
import com.ozai.model.Walkins;

public interface B2CService {

	public boolean generateResidentRent(B2C_Rents rents);

	public boolean isRentGenerated(int id, String month);

	public List<B2C_Rents> getB2CRentsList(int client_code, String status, int limit);

	public List<B2C_Rents> getB2CRentsListByMonth(int client_code, String status, String month, int limit);

	public List<B2C_Rents> getB2CUserRents(int id, String status);

	public B2C_Rents getB2CRentDetails(int id);

	public boolean updateRentPayment(B2C_Rents payment);

	public B2C_ElectricityBill getB2CElectricityBill(int id);

	public boolean updateElectricityPayment(B2C_ElectricityBill bill);

	public B2C_SecurityDeposit getB2CSecurityDeposit(int id);

	public boolean updateSDPayment(B2C_SecurityDeposit bill);

	public boolean addUserAsResident(B2C_Details details);

	public boolean saveUserVacateNotice(VACATENOTICE notice);

	public boolean isUserUnderNoticePeriod(int id);

	public List<B2C_Rents> getB2CRentsListByProperty(int client_code, String status, int property, int limit);

	public boolean saveWalkin(Walkins walkin);

	public List<Walkins> getAllWalkinsByAdmin(int client_code);

	public Walkins getWalkinDetails(int id);

	public boolean saveB2CBooking(B2C_BOOKINGS booking);

	public List<B2C_BOOKINGS> getAllBookingsByAdmin(int client_code);

	public B2C_BOOKINGS getBookingDetails(int id);

	public boolean updateBookingPayment(B2C_BOOKINGS bill);

	public boolean updateBookingDetails(B2C_BOOKINGS bill);

	public List<B2C_Rents> getClientB2CRentsList(int client_code, String status, int limit);

	public List<B2C_Rents> getClientB2CRentsListByMonth(int client_code, String status, String month, int limit);

	public List<B2C_Rents> getClientB2CRentsListByProperty(int client_code, String status, int property, int limit);

	public List<B2C_Rents> getClientRecentB2CRentPayments(int client_code, String status, int limit);

	public List<B2C_Rents> getClientB2CRentsListByMonthAndProperty(int client_code, String status, String month,
			int property, int limit);

}

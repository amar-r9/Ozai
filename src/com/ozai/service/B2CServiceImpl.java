package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.B2CDAO;
import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.VACATENOTICE;
import com.ozai.model.Walkins;


@Service
public class B2CServiceImpl implements B2CService {

	
	@Autowired
	B2CDAO b2cDao;

	@Override
	public boolean generateResidentRent(B2C_Rents rents) {
		return b2cDao.generateResidentRent(rents);
	}

	@Override
	public boolean isRentGenerated(int id, String month) {
		return b2cDao.isRentGenerated(id, month);
	}

	@Override
	public List<B2C_Rents> getB2CRentsList(int client_code, String status, int limit) {
		return b2cDao.getB2CRentsList(client_code, status, limit);
	}

	@Override
	public List<B2C_Rents> getB2CRentsListByMonth(int client_code, String status, String month, int limit) {
		return b2cDao.getB2CRentsListByMonth(client_code, status, month, limit);
	}

	@Override
	public List<B2C_Rents> getB2CUserRents(int id, String status) {
		return b2cDao.getB2CUserRents(id, status);
	}

	@Override
	public B2C_Rents getB2CRentDetails(int id) {
		return b2cDao.getB2CRentDetails(id);
	}

	@Override
	public boolean updateRentPayment(B2C_Rents payment) {
		return b2cDao.updateRentPayment(payment);
	}

	@Override
	public B2C_ElectricityBill getB2CElectricityBill(int id) {
		return b2cDao.getB2CElectricityBill(id);
	}

	@Override
	public boolean updateElectricityPayment(B2C_ElectricityBill bill) {
		return b2cDao.updateElectricityPayment(bill);
	}

	@Override
	public B2C_SecurityDeposit getB2CSecurityDeposit(int id) {
		return b2cDao.getB2CSecurityDeposit(id);
	}

	@Override
	public boolean updateSDPayment(B2C_SecurityDeposit bill) {
		return b2cDao.updateSDPayment(bill);
	}

	@Override
	public boolean addUserAsResident(B2C_Details details) {
		return b2cDao.addUserAsResident(details);
	}

	@Override
	public boolean saveUserVacateNotice(VACATENOTICE notice) {
		return b2cDao.saveUserVacateNotice(notice);
	}

	@Override
	public boolean isUserUnderNoticePeriod(int id) {
		return b2cDao.isUserUnderNoticePeriod(id);
	}

	@Override
	public List<B2C_Rents> getB2CRentsListByProperty(int client_code, String status, int property, int limit) {
		return b2cDao.getB2CRentsListByProperty(client_code, status, property, limit);
	}

	@Override
	public boolean saveWalkin(Walkins walkin) {
		return b2cDao.saveWalkin(walkin);
	}

	@Override
	public List<Walkins> getAllWalkinsByAdmin(int admin_id) {
		return b2cDao.getAllWalkinsByAdmin(admin_id);
	}

	@Override
	public Walkins getWalkinDetails(int id) {
		return b2cDao.getWalkinDetails(id);
	}

	@Override
	public boolean saveB2CBooking(B2C_BOOKINGS booking) {
		return b2cDao.saveB2CBooking(booking);
	}

	@Override
	public List<B2C_BOOKINGS> getAllBookingsByAdmin(int admin_id) {
		return b2cDao.getAllBookingsByAdmin(admin_id);
	}

	@Override
	public B2C_BOOKINGS getBookingDetails(int id) {
		return b2cDao.getBookingDetails(id);
	}

	@Override
	public boolean updateBookingPayment(B2C_BOOKINGS bill) {
		return b2cDao.updateBookingPayment(bill);
	}

	@Override
	public boolean updateBookingDetails(B2C_BOOKINGS bill) {
		return b2cDao.updateBookingDetails(bill);
	}

	@Override
	public List<B2C_Rents> getClientB2CRentsList(int client_code, String status, int limit) {
		return b2cDao.getClientB2CRentsList(client_code, status, limit);
	}

	@Override
	public List<B2C_Rents> getClientB2CRentsListByMonth(int client_code, String status, String month, int limit) {
		return b2cDao.getClientB2CRentsListByMonth(client_code, status, month, limit);
	}

	@Override
	public List<B2C_Rents> getClientB2CRentsListByProperty(int client_code, String status, int property, int limit) {
		return b2cDao.getClientB2CRentsListByProperty(client_code, status, property, limit);
	}

	@Override
	public List<B2C_Rents> getClientRecentB2CRentPayments(int client_code, String status, int limit) {
		return b2cDao.getClientRecentB2CRentPayments(client_code, status, limit);
	}

	@Override
	public List<B2C_Rents> getClientB2CRentsListByMonthAndProperty(int client_code, String status, String month,
			int property, int limit) {
		return b2cDao.getClientB2CRentsListByMonthAndProperty(client_code, status, month, property, limit);
	}
	
}

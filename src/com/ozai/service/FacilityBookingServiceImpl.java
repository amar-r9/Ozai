package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.BadgeDAO;
import com.ozai.dao.FacilityBookingDAO;
import com.ozai.dao.FacilityDAO;
import com.ozai.model.Badges;
import com.ozai.model.Facility;
import com.ozai.model.FacilityBooking;

@Service
public class FacilityBookingServiceImpl implements FacilityBookingService {

	@Autowired
	FacilityBookingDAO facilityBookingDAO;	

	@Override
	public FacilityBooking getFacilityBookingDetails(int id) {
		// TODO Auto-generated method stub
		return facilityBookingDAO.getFacilityBookingDetails(id);
	}

	@Override
	public boolean addFacilityBooking(FacilityBooking booking) {
		// TODO Auto-generated method stub
		return facilityBookingDAO.addFacilityBooking(booking);
	}

	@Override
	public List<FacilityBooking> getFacilityBookings() {
		// TODO Auto-generated method stub
		return facilityBookingDAO.getFacilityBookings();
	}
	
	public boolean updateFacilityBooking(FacilityBooking facilityBooking) {
		return facilityBookingDAO.updateFacilityBooking(facilityBooking);
	}

}

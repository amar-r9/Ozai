package com.ozai.service;

import java.util.List;

import com.ozai.model.Badges;
import com.ozai.model.Facility;
import com.ozai.model.FacilityBooking;

public interface FacilityBookingService {

	public FacilityBooking getFacilityBookingDetails(int id);

	public boolean addFacilityBooking(FacilityBooking booking);
	
	public List<FacilityBooking> getFacilityBookings();
	
	public boolean updateFacilityBooking(FacilityBooking facilityBooking);
}
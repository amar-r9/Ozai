package com.ozai.dao;

import java.util.List;

import com.ozai.model.Badges;
import com.ozai.model.Facility;
import com.ozai.model.FacilityBooking;
import com.ozai.model.Ticket;

public interface FacilityBookingDAO {
	
	public FacilityBooking getFacilityBookingDetails(int id);

	public boolean addFacilityBooking(FacilityBooking facilityBooking);
	
	public List<FacilityBooking> getFacilityBookings();
	
	public boolean updateFacilityBooking(FacilityBooking facilityBooking);
}

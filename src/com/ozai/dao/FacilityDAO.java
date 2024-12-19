package com.ozai.dao;

import java.util.List;

import com.ozai.model.Badges;
import com.ozai.model.Facility;
import com.ozai.model.Ticket;
import com.ozai.model.User;

public interface FacilityDAO {
	
	public Facility getFacilityDetails(int id);

	public boolean addFacility(Facility facility);
	
	public List<Facility> getFacilities();
	
	public boolean deleteFacility(int id);

}

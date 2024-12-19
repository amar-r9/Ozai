package com.ozai.service;

import java.util.List;

import com.ozai.model.Badges;
import com.ozai.model.Facility;

public interface FacilityService {

	public Facility getFacilityDetails(int id);

	public boolean addFacility(Facility facility);
	
	public List<Facility> getFacilities();
	
	public boolean deleteFacility(int id);

}
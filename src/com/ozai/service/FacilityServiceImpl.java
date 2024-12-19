package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.BadgeDAO;
import com.ozai.dao.FacilityDAO;
import com.ozai.model.Badges;
import com.ozai.model.Facility;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	FacilityDAO facilityDAO;	

	@Override
	public Facility getFacilityDetails(int id) {
		// TODO Auto-generated method stub
		return facilityDAO.getFacilityDetails(id);
	}

	@Override
	public boolean addFacility(Facility facility) {
		// TODO Auto-generated method stub
		return facilityDAO.addFacility(facility);
	}

	@Override
	public List<Facility> getFacilities() {
		// TODO Auto-generated method stub
		return facilityDAO.getFacilities();
	}

	@Override
	public boolean deleteFacility(int id) {
		// TODO Auto-generated method stub
		return facilityDAO.deleteFacility(id);
	}

}

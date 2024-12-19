package com.ozai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.CoreDAO;
import com.ozai.model.Admin;
import com.ozai.model.ClientUser;
import com.ozai.model.CoreUser;
import com.ozai.model.Delivery;
import com.ozai.model.OrdersList;

@Service
public class CoreServiceImpl implements CoreService {

	
	@Autowired
	CoreDAO coreDao;
	
	@Override
	public CoreUser validateUser(String username, String password) {
		return coreDao.validateUser(username, password);
	}

	@Override
	public List<Admin> getOperators() {
		return coreDao.getOperators();
	}

	@Override
	public List<Admin> getAllOperators() {
		return coreDao.getAllOperators();
	}

	@Override
	public List<ClientUser> getAllLCTUsers() {
		return coreDao.getAllLCTUsers();
	}

	@Override
	public List<ClientUser> getLCTUsers() {
		return coreDao.getLCTUsers();
	}

	@Override
	public boolean makeUserAsAdmin(int id) {
		return coreDao.makeUserAsAdmin(id);
	}

	@Override
	public Integer saveDeliveryDetails(Delivery delivery) {
		return coreDao.saveDeliveryDetails(delivery);
	}

	@Override
	public Integer getDeliveryMaxId() {
		return coreDao.getDeliveryMaxId();
	}

	@Override
	public List<Delivery> getDeliveryList(String type) {
		return coreDao.getDeliveryList(type);
	}

	@Override
	public Delivery getDeliveryDetails(int id) {
		return coreDao.getDeliveryDetails(id);
	}

	@Override
	public List<Delivery> getDeliveryListByCategory(String category) {
		return coreDao.getDeliveryListByCategory(category);
	}
	
}

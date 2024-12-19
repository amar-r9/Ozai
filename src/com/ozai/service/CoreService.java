package com.ozai.service;

import java.sql.Date;
import java.util.List;

import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.ClientUser;
import com.ozai.model.CoreUser;
import com.ozai.model.Delivery;
import com.ozai.model.OrdersList;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;

public interface CoreService {

	public CoreUser validateUser(String username, String password);

	public List<Admin> getOperators();

	public List<Admin> getAllOperators();

	public List<ClientUser> getAllLCTUsers();

	public List<ClientUser> getLCTUsers();

	public boolean makeUserAsAdmin(int id);

	public Integer saveDeliveryDetails(Delivery delivery);

	public Integer getDeliveryMaxId();

	public List<Delivery> getDeliveryList(String type);

	public Delivery getDeliveryDetails(int id);

	public List<Delivery> getDeliveryListByCategory(String category);

}

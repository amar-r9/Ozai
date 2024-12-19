package com.ozai.service;

import java.sql.SQLException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.ExpenseDAO;
import com.ozai.dao.OrderDAO;
import com.ozai.dao.PropertyDAO;
import com.ozai.dao.OzaiDAO;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.Order_Items;
import com.ozai.model.OrdersList;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO financeDao;
	
	@Override
	public List<OrdersList> getOrdersByAdmin(int id) {
		return financeDao.getOrdersByAdmin(id);
	}

	@Override
	public boolean saveOrder(OrdersList order) {
		return financeDao.saveOrder(order);
	}

	@Override
	public boolean saveOrderItems(Order_Items orders) {
		return financeDao.saveOrderItems(orders);
	}
	
	@Override
	public Integer getOrderMaxId() {
		return financeDao.getOrderMaxId();
	}

	@Override
	public OrdersList getOrderDetails(int id) {
		return financeDao.getOrderDetails(id);
	}

	@Override
	public List<Order_Items> getOrderItemsById(int id) {
		return financeDao.getOrderItemsById(id);
	}

	@Override
	public List<OrdersList> getAllActiveOrders() {
		return financeDao.getAllActiveOrders();
	}

	@Override
	public List<OrdersList> getAllOrders() {
		return financeDao.getAllOrders();
	}
	
}

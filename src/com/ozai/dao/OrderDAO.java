package com.ozai.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.Order_Items;
import com.ozai.model.OrdersList;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

public interface OrderDAO {

	public List<OrdersList> getOrdersByAdmin(int id);

	public boolean saveOrder(OrdersList order);

	public boolean saveOrderItems(Order_Items orders);

	public Integer getOrderMaxId();

	public OrdersList getOrderDetails(int id);

	public List<Order_Items> getOrderItemsById(int id);

	public List<OrdersList> getAllActiveOrders();

	public List<OrdersList> getAllOrders();
	
}

package com.ozai.service;

import java.sql.SQLException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.beans.ExpenseList;
import com.ozai.dao.ClientExpenseDAO;
import com.ozai.dao.PropertyDAO;
import com.ozai.dao.OzaiDAO;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

@Service
public class ClientExpenseServiceImpl implements ClientExpenseService {

	@Autowired
	ClientExpenseDAO financeDao;

	@Override
	public boolean updateVendorDetails(Vendor vendor) {
		return financeDao.updateVendorDetails(vendor);
	}
	
	@Override
	public List<Expenses> getExpensesByClient(int client_code) {
		return financeDao.getExpensesByClient(client_code);
	}

	@Override
	public List<Vendor> getVendorsList() {
		return financeDao.getVendorsList();
	}

	@Override
	public boolean savePurchase(Expenses finance) {
		return financeDao.savePurchase(finance);
	}

	@Override
	public boolean addVendor(Vendor vendor) {
		return financeDao.addVendor(vendor);
	}

	@Override
	public boolean addProduct(Products product) {
		return financeDao.addProduct(product);
	}
	
	@Override
	public Integer getExpenseMaxId() {
		return financeDao.getExpenseMaxId();
	}

	@Override
	public Vendor getVendorDetails(int id) {
		return financeDao.getVendorDetails(id);
	}

	@Override
	public boolean approveExpense(int id, String username) {
		return financeDao.approveExpense(id, username);
	}

	@Override
	public Expenses getExpenseDetails(int id) {
		return financeDao.getExpenseDetails(id);
	}

	@Override
	public Vendor getVendorDetailsByCode(String vendor_code) {
		return financeDao.getVendorDetailsByCode(vendor_code);
	}

	@Override
	public boolean savePaymentDetails(ExpensePayments payment) {
		return financeDao.savePaymentDetails(payment);
	}
	
	@Override
	public List<ExpensePayments> getPaymentsForExpense(int expense_code) {
		return financeDao.getPaymentsForExpense(expense_code);
	}

	@Override
	public double getTotalPaidForExpense(int expense_code) {
		return financeDao.getTotalPaidForExpense(expense_code);
	}

	@Override
	public Integer getPaymentMaxId() {
		return financeDao.getPaymentMaxId();
	}
	
	@Override
	public boolean updateExpenscePaymentStatus(int expense_id) {
		return financeDao.updateExpenscePaymentStatus(expense_id);
	}
	
	@Override
	public List<Expenses> getPendingExpensesByClient(int client_code) {
		return financeDao.getPendingExpensesByClient(client_code);
	}
	
	
	@Override 
	public List<Expenses> getPaidExpensesByClient(int client_code) {
	  return financeDao.getPaidExpensesByClient(client_code); 
	}

	@Override
	public List<Expenses> getClearedExpensesByClient(int client_code, int offset, int i) {
		return financeDao.getClearedExpensesByClient(client_code, offset, i);
	}

	@Override
	public int getExpensesCountByClient(int client_code) {
		return financeDao.getExpensesCountByClient(client_code);
	}

	@Override
	public List<Products> getProductsList() {
		return financeDao.getProductsList();
	}

	@Override
	public boolean saveProcurementRequest(Procurement_Request request) {
		return financeDao.saveProcurementRequest(request);
	}

	@Override
	public List<Procurement_Request> getProcurementsRequestsByClient(int client_code) {
		return financeDao.getProcurementsRequestsByClient(client_code);
	}

	@Override
	public List<ExpenseList> getCategoryWiseExpenseDataByClient(int client_code) {
		return financeDao.getCategoryWiseExpenseDataByClient(client_code);
	}

	@Override
	public List<Expenses> getPendingExpensesOfMonthAndPropertyByClient(int client_code, int property_id, String month) {
		return financeDao.getPendingExpensesOfMonthAndPropertyByClient(client_code, property_id, month);
	}

	@Override
	public List<Expenses> getPaidExpensesOfMonthAndPropertyByClient(int client_code, int property_id, String month) {
		return financeDao.getPaidExpensesOfMonthAndPropertyByClient(client_code, property_id, month);
	}

	@Override
	public List<ExpenseList> getCategoryWiseExpenseDataByClientOnFilter(int client_code, String month,
			int property_id) {
		return financeDao.getCategoryWiseExpenseDataByClientOnFilter(client_code, month, property_id);
	}

	@Override
	public List<Expenses> getPendingExpensesByCluster(int cluster_id) {
		return financeDao.getPendingExpensesByCluster(cluster_id);
	}

	@Override
	public List<ExpenseList> getCategoryWiseExpenseDataByCluster(int cluster_id) {
		return financeDao.getCategoryWiseExpenseDataByCluster(cluster_id);
	}

	@Override
	public List<ExpenseList> getCategoryWiseExpenseDataByProperty(int property) {
		return financeDao.getCategoryWiseExpenseDataByProperty(property);
	}

	@Override
	public List<Expenses> getPaidExpensesByCluster(int cluster_id) {
		return financeDao.getPaidExpensesByCluster(cluster_id);
	}
	
}

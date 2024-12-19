package com.ozai.service;

import java.sql.SQLException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.ExpenseDAO;
import com.ozai.dao.PropertyDAO;
import com.ozai.dao.OzaiDAO;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

@Service
public class ExpenseServiceImpl implements ExpenseService {

	@Autowired
	ExpenseDAO financeDao;

	@Override
	public boolean updateVendorDetails(Vendor vendor) {
		return financeDao.updateVendorDetails(vendor);
	}
	
	@Override
	public List<Expenses> getExpensesByAdmin(int admin_id) {
		return financeDao.getExpensesByAdmin(admin_id);
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
	public List<Expenses> getPendingExpensesByAdmin(int admin_id) {
		return financeDao.getPendingExpensesByAdmin(admin_id);
	}
	
	
	@Override 
	public List<Expenses> getPaidExpensesByAdmin(int admin_id) {
	  return financeDao.getPaidExpensesByAdmin(admin_id); 
	}

	@Override
	public List<Expenses> getClearedExpensesByAdmin(int admin_id, int offset, int i) {
		return financeDao.getClearedExpensesByAdmin(admin_id, offset, i);
	}

	@Override
	public int getExpensesCountByAdmin(int admin_id) {
		return financeDao.getExpensesCountByAdmin(admin_id);
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
	public List<Procurement_Request> getProcurementsRequestsByAdmin(int admin_id) {
		return financeDao.getProcurementsRequestsByAdmin(admin_id);
	}

	@Override
	public List<Expenses> getVendorExpenses(int id) {
		return financeDao.getVendorExpenses(id);
	}
	
}

package com.ozai.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

public interface ExpenseDAO {

	public boolean updateVendorDetails(Vendor vendor);

	public List<Expenses> getExpensesByAdmin(int admin_id);

	public List<Vendor> getVendorsList();

	public boolean savePurchase(Expenses finance);

	public boolean addVendor(Vendor vendor);

	public boolean addProduct(Products product);

	public Integer getExpenseMaxId();

	public Vendor getVendorDetails(int id);

	public boolean approveExpense(int id, String username);

	public Expenses getExpenseDetails(int id);

	public Vendor getVendorDetailsByCode(String vendor_code);

	public boolean savePaymentDetails(ExpensePayments payment);

	public List<ExpensePayments> getPaymentsForExpense(int expense_code);

	public double getTotalPaidForExpense(int expense_code);

	public Integer getPaymentMaxId();

	public boolean updateExpenscePaymentStatus(int expense_id);

	public List<Expenses> getPendingExpensesByAdmin(int admin_id);

	public List<Expenses> getPaidExpensesByAdmin(int admin_id);

	public List<Expenses> getClearedExpensesByAdmin(int admin_id, int offset, int i);

	public int getExpensesCountByAdmin(int admin_id);

	public List<Products> getProductsList();

	public boolean saveProcurementRequest(Procurement_Request request);

	public List<Procurement_Request> getProcurementsRequestsByAdmin(int admin_id);

	public List<Expenses> getVendorExpenses(int id);
	
}

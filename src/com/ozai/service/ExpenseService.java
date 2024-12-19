package com.ozai.service;

import java.sql.Date;
import java.util.List;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

public interface ExpenseService {

	public boolean updateVendorDetails(Vendor vendor);

	public List<Products> getProductsList();

	public List<Vendor> getVendorsList();

	public Vendor getVendorDetails(int id);

	public List<Expenses> getPendingExpensesByAdmin(int admin_id);

	public List<Expenses> getClearedExpensesByAdmin(int admin_id, int offset, int i);

	public int getExpensesCountByAdmin(int admin_id);

	public List<Expenses> getPaidExpensesByAdmin(int admin_id);

	public boolean addVendor(Vendor vendor);

	public boolean addProduct(Products product);

	public Vendor getVendorDetailsByCode(String vendor_code);

	public Integer getExpenseMaxId();

	public boolean savePurchase(Expenses finance);

	public boolean approveExpense(int id, String username);

	public Expenses getExpenseDetails(int id);

	public List<ExpensePayments> getPaymentsForExpense(int expense_code);

	public double getTotalPaidForExpense(int expense_code);

	public Integer getPaymentMaxId();

	public boolean savePaymentDetails(ExpensePayments payment);

	public boolean updateExpenscePaymentStatus(int expense_id);

	public List<Expenses> getExpensesByAdmin(int admin_id);

	public boolean saveProcurementRequest(Procurement_Request request);

	public List<Procurement_Request> getProcurementsRequestsByAdmin(int admin_id);

	public List<Expenses> getVendorExpenses(int id);

}

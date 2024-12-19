package com.ozai.service;

import java.sql.Date;
import java.util.List;

import com.ozai.beans.ExpenseList;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;

public interface ClientExpenseService {

	public boolean updateVendorDetails(Vendor vendor);

	public List<Products> getProductsList();

	public List<Vendor> getVendorsList();

	public Vendor getVendorDetails(int id);

	public List<Expenses> getPendingExpensesByClient(int client_code);

	public List<Expenses> getClearedExpensesByClient(int client_code, int offset, int i);

	public int getExpensesCountByClient(int client_code);

	public List<Expenses> getPaidExpensesByClient(int client_code);

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

	public List<Expenses> getExpensesByClient(int client_code);

	public boolean saveProcurementRequest(Procurement_Request request);

	public List<Procurement_Request> getProcurementsRequestsByClient(int client_code);

	public List<ExpenseList> getCategoryWiseExpenseDataByClient(int client_code);

	public List<Expenses> getPendingExpensesOfMonthAndPropertyByClient(int client_code, int property_id, String month);

	public List<Expenses> getPaidExpensesOfMonthAndPropertyByClient(int client_code, int property_id, String month);

	public List<ExpenseList> getCategoryWiseExpenseDataByClientOnFilter(int client_code, String month, int property_id);

	public List<Expenses> getPendingExpensesByCluster(int cluster_id);

	public List<ExpenseList> getCategoryWiseExpenseDataByCluster(int cluster_id);

	public List<ExpenseList> getCategoryWiseExpenseDataByProperty(int property);

	public List<Expenses> getPaidExpensesByCluster(int cluster_id);


}

package com.ozai.service;

import java.sql.Date;
import java.util.List;

import com.ozai.model.Employees;
import com.ozai.model.SalaryExpense;
import com.ozai.model.SalaryPayments;

public interface EmployService {

	public List<Employees> getEmployeesListByAdmin(int client_code);

	public Employees getEmployDetails(int id);

	public Integer getPaymentMaxId();

	public boolean saveSalaryPayment(SalaryPayments payment);

	public List<SalaryPayments> getEmploySalaryListByAdmin(int client_code);

	public boolean addEmploy(Employees employ);

	public boolean updateEmployDetails(Employees employ);

	public List<SalaryExpense> getSalariesPaidByMonthByAdmin(String month, int client_code);

	public List<SalaryExpense> getSalariesDueByMonthByAdmin(String month, int client_code);

	public Integer getSalaryExpenseMaxId();

	public boolean createExpense(SalaryExpense expense);

	public SalaryExpense getExpenseDetails(int id);

	public List<SalaryPayments> getSalaryPaymentsForExpense(int id);

	public boolean updateExpenscePaymentStatus(int expense_code);

	public double getTotalPaidForExpense(int id);

	public List<SalaryExpense> getPendingSalariesByAdmin(int client_code);

	public List<SalaryExpense> getPaidSalariesByAdmin(int client_code);

	public boolean expenseAlreadyExist(int id, String month);

	public boolean resignEmploy(int id, Date resign_date);

	public List<Employees> getSalariesToBeGeneratedForMonthByAdmin(String month, int client_code);

}

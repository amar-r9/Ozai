package com.ozai.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.ozai.model.Employees;
import com.ozai.model.PG;
import com.ozai.model.SalaryExpense;
import com.ozai.model.SalaryPayments;

public interface EmployDAO {

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

	public boolean createExpense(SalaryExpense salary);

	public List<SalaryExpense> getPendingSalariesByAdmin(int client_code);

	public SalaryExpense getExpenseDetails(int expense_code);

	public List<SalaryPayments> getSalaryPaymentsForExpense(int expense_code);

	public boolean updateExpenscePaymentStatus(int expense_id);

	public double getTotalPaidForExpense(int expense_code);

	public List<SalaryExpense> getPaidSalariesByAdmin(int client_code);

	public boolean expenseAlreadyExist(int id, String month);

	public boolean resignEmploy(int id, Date resign_date);

	public List<Employees> getSalariesToBeGeneratedForMonthByAdmin(String month, int client_code);
	
}

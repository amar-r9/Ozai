package com.ozai.service;

import java.sql.SQLException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ozai.dao.PropertyDAO;
import com.ozai.dao.EmployDAO;
import com.ozai.model.Employees;
import com.ozai.model.PG;
import com.ozai.model.SalaryExpense;
import com.ozai.model.SalaryPayments;

@Service
public class EmployServiceImpl implements EmployService {

	@Autowired
	EmployDAO employDao;

	@Override
	public List<Employees> getEmployeesListByAdmin(int client_code) {
		return employDao.getEmployeesListByAdmin(client_code);
	}

	@Override
	public Employees getEmployDetails(int id) {
		return employDao.getEmployDetails(id);
	}

	@Override
	public Integer getPaymentMaxId() {
		return employDao.getPaymentMaxId();
	}

	@Override
	public boolean saveSalaryPayment(SalaryPayments payment) {
		return employDao.saveSalaryPayment(payment);
	}

	@Override
	public List<SalaryPayments> getEmploySalaryListByAdmin(int client_code) {
		return employDao.getEmploySalaryListByAdmin(client_code);
	}

	@Override
	public boolean addEmploy(Employees employ) {
		return employDao.addEmploy(employ);
	}

	@Override
	public boolean updateEmployDetails(Employees employ) {
		return employDao.updateEmployDetails(employ);
	}

	@Override
	public List<SalaryExpense> getSalariesPaidByMonthByAdmin(String month, int client_code) {
		return employDao.getSalariesPaidByMonthByAdmin(month, client_code);
	}
	
	@Override
	public List<SalaryExpense> getSalariesDueByMonthByAdmin(String month, int client_code) {
		return employDao.getSalariesDueByMonthByAdmin(month, client_code);
	}

	@Override
	public Integer getSalaryExpenseMaxId() {
		return employDao.getSalaryExpenseMaxId();
	}

	@Override
	public boolean createExpense(SalaryExpense rental) {
		return employDao.createExpense(rental);
	}

	@Override
	public SalaryExpense getExpenseDetails(int id) {
		return employDao.getExpenseDetails(id);
	}

	@Override
	public List<SalaryPayments> getSalaryPaymentsForExpense(int id) {
		return employDao.getSalaryPaymentsForExpense(id);
	}

	@Override
	public boolean updateExpenscePaymentStatus(int expense_code) {
		return employDao.updateExpenscePaymentStatus(expense_code);
	}

	@Override
	public double getTotalPaidForExpense(int id) {
		return employDao.getTotalPaidForExpense(id);
	}

	@Override
	public List<SalaryExpense> getPendingSalariesByAdmin(int client_code) {
		return employDao.getPendingSalariesByAdmin(client_code);
	}

	@Override
	public List<SalaryExpense> getPaidSalariesByAdmin(int client_code) {
		return employDao.getPaidSalariesByAdmin(client_code);
	}

	@Override
	public boolean expenseAlreadyExist(int id, String month) {
		return employDao.expenseAlreadyExist(id, month);
	}

	@Override
	public boolean resignEmploy(int id, Date resign_date) {
		return employDao.resignEmploy(id, resign_date);
	}

	@Override
	public List<Employees> getSalariesToBeGeneratedForMonthByAdmin(String month, int client_code) {
		return employDao.getSalariesToBeGeneratedForMonthByAdmin(month, client_code);
	}
	
}

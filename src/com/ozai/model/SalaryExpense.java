package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "SALARY_EXPENSE")
public class SalaryExpense implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "SERVICE_MONTH")
	private String service_month;

	@Column(name = "EMPLOY_ID")
	private int employ_id;
	
	@Column(name = "AMOUNT_TO_BE_PAID")
	private double amount_to_be_paid;

	@Column(name = "PAYMENT_DUE_DATE")
	private Date payment_due_date;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "CLEARED_ON")
	private Date cleared_on;
	
	
	
	@ManyToOne(targetEntity = Employees.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "EMPLOY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Employees employ;
	public Employees getEmploy() {
		return employ;
	}

	public void setEmploy(Employees employ) {
		this.employ = employ;
	}
	
	
	
	public SalaryExpense() {
		//setSubmit_date(TikaanaUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getService_month() {
		return service_month;
	}

	public void setService_month(String service_month) {
		this.service_month = service_month;
	}

	public int getEmploy_id() {
		return employ_id;
	}

	public void setEmploy_id(int employ_id) {
		this.employ_id = employ_id;
	}

	public Date getPayment_due_date() {
		return payment_due_date;
	}

	public void setPayment_due_date(Date date) {
		this.payment_due_date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCleared_on() {
		return cleared_on;
	}

	public void setCleared_on(Date cleared_on) {
		this.cleared_on = cleared_on;
	}

	public double getAmount_to_be_paid() {
		return amount_to_be_paid;
	}

	public void setAmount_to_be_paid(double amount_to_be_paid) {
		this.amount_to_be_paid = amount_to_be_paid;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

}

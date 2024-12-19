package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "LOAN")
public class Loan implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private String user_id;
	
	@Column(name = "FIRSTNAME")
	private String firstname;

	@Column(name = "LASTNAME")
	private String lastname;

	@Column(name = "MOBILE")
	private String mobile;
	
	@Column(name = "PAN")
	private String pan;
	
	@Column(name = "MONEY_NEEDED")
	private double money_needed;
	
	@Column(name = "SALARY")
	private double salary;
	
	@Column(name = "JOB_ROLE")
	private String job_role;
	
	@Column(name = "COMPANY")
	private String company;
	
	@Column(name = "HOW_SOON")
	private String how_soon;
	
	@Column(name = "ENQUIRY_DATE")
	private Date enquiry_date;

	public Loan() {
		enquiry_date = OzaiUtil.getCurrentDate();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getEnquiry_date() {
		return enquiry_date;
	}

	public void setEnquiry_date(Date enquiry_date) {
		this.enquiry_date = enquiry_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public double getMoney_needed() {
		return money_needed;
	}

	public void setMoney_needed(double money_needed) {
		this.money_needed = money_needed;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getJob_role() {
		return job_role;
	}

	public void setJob_role(String job_role) {
		this.job_role = job_role;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getHow_soon() {
		return how_soon;
	}

	public void setHow_soon(String how_soon) {
		this.how_soon = how_soon;
	}

}

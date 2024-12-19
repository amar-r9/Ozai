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
@Table(name = "ENQUIRY")
public class Enquiry implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "LOCATION")
	private String location;
	
	@Column(name = "CITY")
	private String city;
	
	@Column(name = "COMPANY")
	private String company;
	
	@Column(name = "SHARING")
	private String sharing;
	
	@Column(name = "NEEDIN")
	private String needin;
	
	@Column(name = "ENQUIRY_DATE")
	private Date enquiry_date;
	
	@Column(name = "BUDGET")
	private String budget;

	public Enquiry() {
		enquiry_date = OzaiUtil.getCurrentDate();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Date getEnquiry_date() {
		return enquiry_date;
	}

	public void setEnquiry_date(Date enquiry_date) {
		this.enquiry_date = enquiry_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSharing() {
		return sharing;
	}

	public void setSharing(String sharing) {
		this.sharing = sharing;
	}

	public String getNeedin() {
		return needin;
	}

	public void setNeedin(String needin) {
		this.needin = needin;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}

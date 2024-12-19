package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "REPORT_USER")
public class ReportUser implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "REPORT_MONTH")
	private String report_month;
	
	@Column(name = "CLEANLINESS")
	private int cleanliness;
	
	@Column(name = "BEHAVIOR")
	private int behavior;
	
	@Column(name = "REPORT_DATE")
	private Date report_date;
	
	
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private User user; 
	
	public User getUser() {
		return user;
	}
	  
	public void setUser(User user) { 
		this.user = user; 
	}
	
	public ReportUser() {
		report_date = OzaiUtil.getCurrentDate();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public String getReport_month() {
		return report_month;
	}

	public void setReport_month(String report_month) {
		this.report_month = report_month;
	}

	public int getCleanliness() {
		return cleanliness;
	}

	public void setCleanliness(int cleanliness) {
		this.cleanliness = cleanliness;
	}

	public int getBehavior() {
		return behavior;
	}

	public void setBehavior(int behavior) {
		this.behavior = behavior;
	}

}

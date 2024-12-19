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
@Table(name = "REFERRAL")
public class Referral implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "MOBILE")
	private String mobile;
	
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "REFERRED_USER")
	private int referred_user;
	
	@Column(name = "REFERRED_DATE")
	private Date referred_date;
	
	@Column(name = "STATUS")
	private int status;

	public Referral() {
		setStatus(0);
		setReferred_date(OzaiUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReferred_user() {
		return referred_user;
	}

	public void setReferred_user(int referred_user) {
		this.referred_user = referred_user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Date getReferred_date() {
		return referred_date;
	}

	public void setReferred_date(Date referred_date) {
		this.referred_date = referred_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

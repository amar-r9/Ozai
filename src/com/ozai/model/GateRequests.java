package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;

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
@Table(name = "GATE_REQUESTS")
public class GateRequests implements Serializable
{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "DELIVERY_FROM")
	private String from;
	
	@Column(name = "DATE")
	private Date date;

	@Column(name = "TIME")
	private Timestamp time;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "STATUS")
	private String status;
	
	public GateRequests() {
		date = OzaiUtil.getCurrentDate();
		time = Timestamp.from(Instant.now());
	}
	
	@ManyToOne(targetEntity = B2B_Details.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
	private B2B_Details bdetails; 
	
	public B2B_Details getBdetails() {
		return bdetails;
	}
	  
	public void setBdetails(B2B_Details bdetails) { 
		this.bdetails = bdetails; 
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}	

}

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

import com.ozai.model.User;
import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "STAFF")
public class Staff implements Serializable {

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
	
	@Column(name = "DESIGNATION")
	private String designation;

	@Column(name = "ACTIVE")
	private int active;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	private PG property; 
	
	public PG getProperty() {
		return property;
	}
	  
	public void setProperty(PG property) { 
		this.property = property; 
	}
	 
	
	public Staff() {
		setActive(1);
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
}

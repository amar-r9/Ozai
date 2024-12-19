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
@Table(name = "VACATE_NOTICE")
public class VACATENOTICE implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "VACATE_DATE")
	private Date vacate_date;
	
	@Column(name = "SUBMIT_DATE")
	private Date submit_date;
	
	
	@ManyToOne(targetEntity = B2C_Details.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
	private B2C_Details details; 
	
	public B2C_Details getDetails() {
		return details;
	}
	  
	public void setDetails(B2C_Details details) { 
		this.details = details; 
	}
	

	public VACATENOTICE() {
		submit_date = OzaiUtil.getCurrentDate();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getVacate_date() {
		return vacate_date;
	}

	public void setVacate_date(Date vacate_date) {
		this.vacate_date = vacate_date;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

}

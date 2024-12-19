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
@Table(name = "SERVICE_REQUEST")
public class Service_Request implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "ITEM")
	private String item;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "REQUEST_DATE")
	private Date request_date;

	public Service_Request() {
		request_date = OzaiUtil.getCurrentDate();
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
	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public Date getRequest_date() {
		return request_date;
	}

	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}

}

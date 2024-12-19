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
@Table(name = "PROCUREMENT_REQUEST")
public class Procurement_Request implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "ITEM")
	private String item;

	@Column(name = "QUANTITY")
	private String quantity;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "NEEDED_BY")
	private Date needed_by;
	
	@Column(name = "REQUEST_DATE")
	private Date request_date;

	public Procurement_Request() {
		request_date = OzaiUtil.getCurrentDate();
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
	

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public Date getNeeded_by() {
		return needed_by;
	}

	public void setNeeded_by(Date needed_by) {
		this.needed_by = needed_by;
	}
	

	public Date getRequest_date() {
		return request_date;
	}

	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}


	public int getClient_code() {
		return client_code;
	}


	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

}

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
@Table(name = "ORDERS_LIST")
public class OrdersList implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "ORDER_DATE")
	private Date order_date;
	
	@Column(name = "CATEGORY")
	private String category;
	
	@Column(name = "STATUS")
	private String status;

	public OrdersList() {
		order_date = OzaiUtil.getCurrentDate();
		status = "Order Received";
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
	

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public int getClient_code() {
		return client_code;
	}


	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

}

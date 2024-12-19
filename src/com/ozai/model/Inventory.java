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
import com.ozai.model.OrdersList;

@Entity
@Table(name = "INVENTORY")
public class Inventory implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;

	@Column(name = "ITEM")
	private String item;

	@Column(name = "QUANTITY")
	private String quantity;

	public Inventory() {
		//request_date = OzaiUtil.getCurrentDate();
	}
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "id", updatable = false,insertable=false)
	private PG pg;

	public PG getPg() {
		return pg;
	}
	
	public void setPg(PG pg) {
		this.pg = pg;
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

}

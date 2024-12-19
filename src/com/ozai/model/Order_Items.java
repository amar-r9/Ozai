package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;
import com.ozai.model.OrdersList;

@Entity
@Table(name = "ORDER_ITEMS")
public class Order_Items implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "ORDER_ID")
	private int order_id;
	
	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "ITEM")
	private String item;

	@Column(name = "QUANTITY")
	private String quantity;

	public Order_Items() {
		//request_date = OzaiUtil.getCurrentDate();
	}
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "ORDER_ID", referencedColumnName = "id", updatable = false,insertable=false)
	private OrdersList order;

	public OrdersList getOrder() {
		return order;
	}
	
	public void setOrder(OrdersList order) {
		this.order = order;
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
	

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}

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

/**
 * @author 91970
 *
 */
@Entity
@Table(name = "GROCERIES")
public class Grocery_Booking implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "GROCERY_ID")
	private int grocery_id;
	
	@Column(name = "QUANTITY")
	private int quantity;

	@Column(name = "BOOKING_DATE")
	private Date booking_date;
	
	@Column(name = "STATUS")
	private String status;
	
	@ManyToOne(targetEntity = Groceries.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "GROCERY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Groceries grocery;
	public Groceries getGrocery() {
		return grocery;
	}

	public void setGrocery(Groceries grocery) {
		this.grocery = grocery;
	}
	
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Grocery_Booking() {
		booking_date = OzaiUtil.getCurrentDate();
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

	public int getGrocery_id() {
		return grocery_id;
	}

	public void setGrocery_id(int grocery_id) {
		this.grocery_id = grocery_id;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}	

}

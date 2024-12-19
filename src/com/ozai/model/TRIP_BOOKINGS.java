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
@Table(name = "TRIP_BOOKINGS")
public class TRIP_BOOKINGS implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "TRIP_ID")
	private int trip_id;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "STATUS")
	private String status;
	
	@ManyToOne(targetEntity = Transport.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "TRIP_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Transport trip;
	public Transport getTrip() {
		return trip;
	}

	public void setTrip(Transport trip) {
		this.trip = trip;
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

	public TRIP_BOOKINGS() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTrip_id() {
		return trip_id;
	}

	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
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

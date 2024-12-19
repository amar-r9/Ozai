package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FACILITY_BOOKINGS")
public class FacilityBooking implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	public FacilityBooking() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	@Id
	@Column(name = "BOOKING_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;
	
	@Column(name = "FACILITY_ID")
	public int facility_id;
	
	@Column(name = "FACILITY_NAME")
	public String facility_name;
	
	@Column(name = "USER_ID")
	public int user_id;
	
	@Column(name = "USER_NAME")
	public String user_name;
	
	@Column(name = "BOOKING_DATE")
	public Date booking_date;
	
	@Column(name = "START_TIME")
	public String start_time;	
	
	@Column(name = "END_TIME")
	public String end_time;	
	
	@Column(name = "STATUS")
	public String status;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFacility_id() {
		return facility_id;
	}

	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "FacilityBooking [id=" + id + ", facility_id=" + facility_id + ", facility_name=" + facility_name
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", booking_date=" + booking_date
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", status=" + status + "]";
	}

	
	
}

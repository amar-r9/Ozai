package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRANSPORT")
public class Transport implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "PICK_UP")
	private String pickup;

	@Column(name = "DROP_OFF")
	private String dropoff;
	
	@Column(name = "DATE")
	private Date date;
	
	@Column(name = "TIME")
	private String time;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name ="BUS_NO")
	private String bus_no;
	
	@Column(name = "PERMANENT")
	private int permanent;
	
	@Column(name = "SEATS")
	private int seats;
	
	@Column(name = "AVAILABLE")
	private int available;
	
	public Transport() {
		//setAvailable(getSeats());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public String getDropoff() {
		return dropoff;
	}

	public void setDropoff(String dropoff) {
		this.dropoff = dropoff;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public String getBus_no() {
		return bus_no;
	}

	public void setBus_no(String bus_no) {
		this.bus_no = bus_no;
	}

	public int getPermanent() {
		return permanent;
	}

	public void setPermanent(int permanent) {
		this.permanent = permanent;
	}

}

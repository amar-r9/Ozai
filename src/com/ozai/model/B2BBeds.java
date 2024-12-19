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
@Table(name = "B2B_BEDS")
public class B2BBeds implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "PROPERTY_CODE")
	private String property_code;

	@Column(name = "PROPERTY")
	private String property;
	
	@Column(name = "LOCATION")
	private String location;
	
	@Column(name = "CITY")
	private String city;
	
	@Column(name = "STATE")
	private String state;

	@Column(name = "NO_OF_BEDS")
	private int no_of_beds;
	
	@Column(name = "BOOKED_BEDS")
	private int booked_beds;
	
	@Column(name = "REMAINING_BEDS")
	private int remaining_beds;
	
	public B2BBeds() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProperty_code() {
		return property_code;
	}

	public void setProperty_code(String property_code) {
		this.property_code = property_code;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public int getNo_of_beds() {
		return no_of_beds;
	}

	public void setNo_of_beds(int no_of_beds) {
		this.no_of_beds = no_of_beds;
	}

	public int getBooked_beds() {
		return booked_beds;
	}

	public void setBooked_beds(int booked_beds) {
		this.booked_beds = booked_beds;
	}

	public int getRemaining_beds() {
		return remaining_beds;
	}

	public void setRemaining_beds(int remaining_beds) {
		this.remaining_beds = remaining_beds;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}

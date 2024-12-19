package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FACILITIES")
public class Facility implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	public Facility() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	@Id
	@Column(name = "FACILITY_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;
	
	@Column(name = "NAME")
	public String name;
	
	@Column(name = "LOCATION")
	public String location;
	
	@Column(name = "PROPERTY_NAME")
	public String property_name;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getProperty_name() {
		return property_name;
	}

	public void setProperty_name(String property_name) {
		this.property_name = property_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Facility [id=" + id + ", name=" + name + ", location=" + location + ", property_name=" + property_name
				+ "]";
	}
	
	

}

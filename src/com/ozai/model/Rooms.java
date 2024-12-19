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
@Table(name = "ROOMS")
public class Rooms implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "ROOM_NO")
	private String room_no;

	@Column(name = "PROPERTY_ID")
	private int property_id;

	@Column(name = "SHARING")
	private int sharing;

	@Column(name = "AC")
	private String ac;
	
	@Column(name = "VENTILATED")
	private String ventilated;
	
	@Column(name = "PREMIUM")
	private String premium;
	
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}
	public void setProperty(PG property) {
		this.property =  property;
	}
	
	
	public Rooms() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSharing() {
		return sharing;
	}

	public void setSharing(int sharing) {
		this.sharing = sharing;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getAc() {
		return ac;
	}

	public void setAc(String ac) {
		this.ac = ac;
	}

	public String getVentilated() {
		return ventilated;
	}

	public void setVentilated(String ventilated) {
		this.ventilated = ventilated;
	}

	public String getPremium() {
		return premium;
	}

	public void setPremium(String premium) {
		this.premium = premium;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	
	

}

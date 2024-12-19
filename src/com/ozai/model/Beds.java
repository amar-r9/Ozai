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
@Table(name = "BEDS")
public class Beds implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "ROOM_ID")
	private int room_id;

	@Column(name = "BED_NO")
	private String bed_no;

	@Column(name = "PROPERTY_ID")
	private int property_id;

	@Column(name = "SHARING")
	private int sharing;

	@Column(name = "STATUS")
	private String status;
	
	
	
	@ManyToOne(targetEntity = Rooms.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "ROOM_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Rooms room;
	public Rooms getRoom() {
		return room;
	}

	public void setRoom(Rooms room) {
		this.room = room;
	}
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}
	public void setProperty(PG property) {
		this.property = property;
	}
	
	
	
	public Beds() {
		
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

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getBed_no() {
		return bed_no;
	}

	public void setBed_no(String bed_no) {
		this.bed_no = bed_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

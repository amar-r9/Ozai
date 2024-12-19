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

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "WALKINS")
public class Walkins implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	@Column(name = "ROOM_ID")
	private int room_id;
	
	@Column(name="BED_ID")
	private int bed_id;
	
	@Column(name = "MOBILE")
	private String mobile;
	
	@Column(name = "SHARING")
	private int sharing;
	
	@Column(name = "RENT")
	private double rent;

	@Column(name = "JOINING_DATE")
	private Date joining_date;
	
	@Column(name = "ENTRY_BY")
	private String entry_by;
	
	@Column(name = "ENQUIRY_DATE")
	private Date enquiry_date;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "COMPANY")
	private String company;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}
	
	@ManyToOne(targetEntity = Rooms.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "ROOM_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Rooms room;
	public Rooms getRoom() {
		return room;
	}

	public void setRoom(Rooms room) {
		this.room = room;
	}
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = Beds.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "BED_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Beds bed;
	public Beds getBed() {
		return bed;
	}

	public void setBed(Beds bed) {
		this.bed = bed;
	}
	
	public Walkins() {
		setEnquiry_date(OzaiUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getSharing() {
		return sharing;
	}

	public void setSharing(int sharing) {
		this.sharing = sharing;
	}

	public double getRent() {
		return rent;
	}

	public void setRent(double rent) {
		this.rent = rent;
	}

	public Date getJoining_date() {
		return joining_date;
	}

	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}

	public String getEntry_by() {
		return entry_by;
	}

	public void setEntry_by(String entry_by) {
		this.entry_by = entry_by;
	}

	public Date getEnquiry_date() {
		return enquiry_date;
	}

	public void setEnquiry_date(Date enquiry_date) {
		this.enquiry_date = enquiry_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public int getBed_id() {
		return bed_id;
	}

	public void setBed_id(int bed_id) {
		this.bed_id = bed_id;
	}
	
}

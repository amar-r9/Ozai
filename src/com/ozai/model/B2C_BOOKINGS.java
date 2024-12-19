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
@Table(name = "B2C_BOOKINGS")
public class B2C_BOOKINGS implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "WALKIN_ID")
	private int walkin_id;
	
	@Column(name = "ROOM_ID")
	private int room_id;
	
	@Column(name="BED_ID")
	private int bed_id;

	@Column(name = "PROPERTY_ID")
	private int property_id;

	@Column(name = "BOOKING_AMOUNT")
	private double booking_amount;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "PAID_DATE")
	private Date paid_date;
	
	@Column(name = "PAYMENT_ID")
	private String payment_id;
	
	@Column(name = "GENERATED_DATE")
	private Date generated_date;
	
	
	@ManyToOne(targetEntity = Walkins.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "WALKIN_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Walkins walkin;
	public Walkins getWalkin() {
		return walkin;
	}

	public void setWalkin(Walkins walkin) {
		this.walkin = walkin;
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
	

	public B2C_BOOKINGS() {
		generated_date = OzaiUtil.getCurrentDate();
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

	public Date getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public Date getGenerated_date() {
		return generated_date;
	}

	public void setGenerated_date(Date generated_date) {
		this.generated_date = generated_date;
	}

	public int getWalkin_id() {
		return walkin_id;
	}

	public void setWalkin_id(int walkin_id) {
		this.walkin_id = walkin_id;
	}

	public double getBooking_amount() {
		return booking_amount;
	}

	public void setBooking_amount(double booking_amount) {
		this.booking_amount = booking_amount;
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

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

}

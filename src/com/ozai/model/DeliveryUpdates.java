package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "DELIVERY_UPDATES")
public class DeliveryUpdates implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "NAME")
	private String name;

	@Column(name = "PROPERTY_ID")
	private int property_id;

	//@Column(name = "ROOM_ID")
	//private int room_id;
	
	@Column(name = "SUBMIT_DATE")
	private Date submit_date;
	
	@Column(name = "ENTRY_BY")
	private String entry_by;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "STATUS")
	private String status;
	
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG pg;
	public PG getPg() {
		return pg;
	}

	public void setPg(PG pg) {
		this.pg = pg;
	}
	
	public DeliveryUpdates() {
		setSubmit_date(OzaiUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public String getEntry_by() {
		return entry_by;
	}

	public void setEntry_by(String entry_by) {
		this.entry_by = entry_by;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//public int getRoom_id() {
		//return room_id;
	//}

	//public void setRoom_id(int room_id) {
		//this.room_id = room_id;
	//}

}

package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

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
@Table(name = "NOTICE")
public class Notice implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "MESSAGE")
	private String message;

	@Column(name = "DATE")
	private Date date;
	
	@Column(name = "POST_TIME")
	private Timestamp post_time;
	
	@Column(name = "FILENAME")
	private String filename;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	public Notice() {
		date = OzaiUtil.getCurrentDate();
	}
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Timestamp getPost_time() {
		return post_time;
	}

	public void setPost_time(Timestamp post_time) {
		this.post_time = post_time;
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

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

}

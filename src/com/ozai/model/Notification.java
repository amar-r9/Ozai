package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "NOTIFICATION")
public class Notification implements Serializable {

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
	
	@Column(name = "CLIENT")
	private String client;
	
	public Notification() {
		date = OzaiUtil.getCurrentDate();
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
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

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

}

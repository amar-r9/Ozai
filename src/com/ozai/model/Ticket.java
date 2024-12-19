package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;

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

import com.ozai.model.User;
import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "TICKET")
public class Ticket implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "SUMMARY")
	private String summary;
	
	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "RAISED_DATE")
	private Timestamp raised_date;
	
	@Column(name = "STATUS")
	private String status;

	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "OPENED_ON")
	private Timestamp opened_on;
	
	@Column(name = "OPENED_BY")
	private String opened_by;
	
	@Column(name = "PROGRESS_ON")
	private Timestamp progress_on;
	
	@Column(name = "PROGRESS_BY")
	private String progress_by;
	
	@Column(name = "CLOSED_ON")
	private Timestamp closed_on;
	
	@Column(name = "CLOSED_BY")
	private String closed_by;
	
	@Column(name = "FILENAME")
	private String filename;
	
	@Column(name = "COMMENTS")
	private String comments;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	private User user; 
	
	public User getUser() {
		return user;
	}
	  
	public void setUser(User user) { 
		this.user = user; 
	}
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = B2B_Details.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
	private B2B_Details bdetails; 
	
	public B2B_Details getBdetails() {
		return bdetails;
	}
	  
	public void setBdetails(B2B_Details bdetails) { 
		this.bdetails = bdetails; 
	}
	
	
	@ManyToOne(targetEntity = B2C_Details.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
	private B2C_Details details; 
	
	public B2C_Details getDetails() {
		return details;
	}
	  
	public void setDetails(B2C_Details details) { 
		this.details = details; 
	}
	 
	
	public Ticket() {
		Timestamp time = Timestamp.from(Instant.now());
		setRaised_date(time);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Timestamp getClosed_on() {
		return closed_on;
	}

	public void setClosed_on(Timestamp closed_on) {
		this.closed_on = closed_on;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getClosed_by() {
		return closed_by;
	}

	public void setClosed_by(String closed_by) {
		this.closed_by = closed_by;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRaised_date() {
		return raised_date;
	}

	public void setRaised_date(Timestamp raised_date) {
		this.raised_date = raised_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public Timestamp getOpened_on() {
		return opened_on;
	}

	public void setOpened_on(Timestamp opened_on) {
		this.opened_on = opened_on;
	}

	public String getOpened_by() {
		return opened_by;
	}

	public void setOpened_by(String opened_by) {
		this.opened_by = opened_by;
	}

	public Timestamp getProgress_on() {
		return progress_on;
	}

	public void setProgress_on(Timestamp progress_on) {
		this.progress_on = progress_on;
	}

	public String getProgress_by() {
		return progress_by;
	}

	public void setProgress_by(String progress_by) {
		this.progress_by = progress_by;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	
}

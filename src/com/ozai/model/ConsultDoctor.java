package com.ozai.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CONSULT_DOCTOR")
public class ConsultDoctor implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "MESSAGE")
	private String message;
	
	@Column(name = "SENT_BY")
	private String sent_by;

	@Column(name = "MESSAGE_TIME")
	private Timestamp message_time;

	@Column(name = "STATUS")
	private String status;
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", updatable = false,insertable=false)
	private B2B_Details details;

	public B2B_Details getDetails() {
		return details;
	}
	
	public void setDetails(B2B_Details details) {
		this.details = details;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getMessage_time() {
		return message_time;
	}

	public void setMessage_time(Timestamp message_time) {
		this.message_time = message_time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSent_by() {
		return sent_by;
	}

	public void setSent_by(String sent_by) {
		this.sent_by = sent_by;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}

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
@Table(name = "MESSAGES")
public class Messages implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "SENDER_ID")
	private int sender_id;

	@Column(name = "REPORTED")
	private boolean reported;

	@Column(name = "RECEIVER_ID")
	private int receiver_id;

	@Column(name = "LIKED")
	private boolean liked;

	@Column(name = "STATUS")
	private String status;

	@Column(name = "MESSAGE")
	private String message;

	@Column(name = "MESSAGE_TIME")
	private Timestamp message_time;
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "SENDER_ID", referencedColumnName = "id", updatable = false,insertable=false)
	private User sender;

	public User getsender() {
		return sender;
	}
	
	public void setSender(User sender) {
		this.sender = sender;
	}
	
	
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "RECEIVER_ID", referencedColumnName = "id", updatable = false,insertable=false)
	private User receiver;

	public User getReceiver() {
		return receiver;
	}
	
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public boolean isReported() {
		return reported;
	}

	public void setReported(boolean reported) {
		this.reported = reported;
	}

	public int getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}

	public boolean isLiked() {
		return liked;
	}

	public void setLiked(boolean liked) {
		this.liked = liked;
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

}

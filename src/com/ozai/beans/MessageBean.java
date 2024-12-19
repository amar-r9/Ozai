package com.ozai.beans;

import java.sql.Timestamp;

public class MessageBean {

	private int id;
	private String name;
	private int other_id;
	private String message;
	private Timestamp message_time;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOther_id() {
		return other_id;
	}
	public void setOther_id(int other_id) {
		this.other_id = other_id;
	}

}

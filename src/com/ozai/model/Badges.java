package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "USER_BADGES")
public class Badges implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "MONTH")
	private String month;
	
	
	
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

	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}	
	
}

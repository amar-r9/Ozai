package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "USER_RATINGS")
public class User_Ratings implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "RATING")
	private int rating;

	public User_Ratings() {
		//submit_date = OzaiUtil.getCurrentDate();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

}

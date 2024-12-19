package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.ozai.util.OzaiUtil;

@IdClass(UserLikeKey.class)
@Entity
@Table(name = "USER_LIKE_VALIDATION")
public class UserLikeValidation implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "LIKED_USER")
	private int liked_user;

	@Id
	@Column(name = "ENTRY_ID")
	private int entry_id;

	@Column(name = "DATE_OF_LIKE")
	private Date likeDate;
	
	@Transient
	private int entry_user;
	
	//int oldLikes;
	
	public UserLikeValidation(){
		setLikeDate(OzaiUtil.getCurrentDate());
	}

	public int getEntry_id() {
		return entry_id;
	}

	public void setEntry_id(int entry_id) {
		this.entry_id = entry_id;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public int getLiked_user() {
		return liked_user;
	}

	public void setLiked_user(int liked_user) {
		this.liked_user = liked_user;
	}

	public int getEntry_user() {
		return entry_user;
	}

	public void setEntry_user(int entry_user) {
		this.entry_user = entry_user;
	}	

}

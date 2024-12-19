package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;

public class UserLikeKey implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "LIKED_USER")
	private int liked_user;

	@Column(name = "ENTRY_ID")
	private int entry_id;
	
	public  UserLikeKey(){
		
	}
	
	
	public  UserLikeKey(int liked_user,int entry_id) {
		this.liked_user=liked_user;
		this.entry_id=entry_id;
	}

	public int getLiked_user() {
		return liked_user;
	}

	public void setLiked_user(int liked_user) {
		this.liked_user = liked_user;
	}

	public int getEntry_id() {
		return entry_id;
	}

	public void setEntry_id(int entry_id) {
		this.entry_id = entry_id;
	}

}

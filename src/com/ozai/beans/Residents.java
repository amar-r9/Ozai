package com.ozai.beans;

import java.sql.Date;

public class Residents {

	private String name;
	private String mobile;
	private String email;
	private int property_id;
	private String property;
	private int room_id;
	private String room;
	private int bed_id;
	private String bed;
	private String resident_type;
	private double rent;
	private Date joining_date;
	private int sharing;
	private String admin_type;
	private int admin_id;
	private int client_code;
	private Date dob;
	private String language;
	private String home_town;
	private String food_preferences;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	
	public Date getJoining_date() {
		return joining_date;
	}
	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}
	
	public int getSharing() {
		return sharing;
	}
	public void setSharing(int sharing) {
		this.sharing = sharing;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public double getRent() {
		return rent;
	}
	public void setRent(double rent) {
		this.rent = rent;
	}
	public int getProperty_id() {
		return property_id;
	}
	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	public int getBed_id() {
		return bed_id;
	}
	public void setBed_id(int bed_id) {
		this.bed_id = bed_id;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String getResident_type() {
		return resident_type;
	}
	public void setResident_type(String resident_type) {
		this.resident_type = resident_type;
	}
	public String getAdmin_type() {
		return admin_type;
	}
	public void setAdmin_type(String admin_type) {
		this.admin_type = admin_type;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public int getClient_code() {
		return client_code;
	}
	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getHome_town() {
		return home_town;
	}
	public void setHome_town(String home_town) {
		this.home_town = home_town;
	}
	public String getFood_preferences() {
		return food_preferences;
	}
	public void setFood_preferences(String food_preferences) {
		this.food_preferences = food_preferences;
	}

}

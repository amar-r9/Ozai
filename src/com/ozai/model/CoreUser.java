package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;

@Entity
@Table(name = "CORE_USER")
@SecondaryTables({ @SecondaryTable(name = "COREUSER_IMAGE", pkJoinColumns = {
		@PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id") }) })

public class CoreUser implements Serializable {

	public interface SaveUser {
	};

	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String name;
	private String mobile;
	private String email;
	private int id;
	private int access_level;
	private int active;
	private byte[] image;

	public CoreUser() {
		//setReg_date(MsbUtil.getCurrentDate());
		//setPoints(250);
		setActive(1);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "USER_NAME")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LoginModel{" + "userName=" + username + ", name=" + password + '}';
	}

	public int getRandomNumber(int min, int max) {
		return ((int) Math.floor(Math.random() * (max - min + 1)) + min);
	}

	@Column(name = "ACCESS_LEVEL")
	public int getAccess_level() {
		return access_level;
	}

	public void setAccess_level(int access_level) {
		this.access_level = access_level;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	@Column(table = "COREUSER_IMAGE")
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "MOBILE")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}

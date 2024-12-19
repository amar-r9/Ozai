package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "ADMIN")
@SecondaryTables({ @SecondaryTable(name = "ADMIN_IMAGE", pkJoinColumns = {
		@PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id") }) })

public class Admin implements Serializable {

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
	private String admin_type;
	private String client;
	private String property;
	private int client_code;
	private int active;
	private byte[] image;

	public Admin() {
		//setReg_date(MsbUtil.getCurrentDate());
		//setPoints(250);
		setActive(1);
	}
	
	//@NotFound(action = NotFoundAction.IGNORE)
	//@ManyToOne(targetEntity = AdminStatus.class, fetch = FetchType.EAGER)
	//@JoinColumn(name = "CLIENT_CODE", referencedColumnName = "CLIENT_CODE", insertable = false, updatable = false)
	//private AdminStatus adminstatus;
	//public AdminStatus getAdminstatus() {
		//return adminstatus;
	//}

	//public void setAdminstatus(AdminStatus adminstatus) {
		//this.adminstatus = adminstatus;
	//}
	

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

	@Column(name = "CLIENT")
	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	@Column(name = "PROPERTY")
	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	@Column(name = "CLIENT_CODE")
	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	@Column(name = "ADMIN_TYPE")
	public String getAdmin_type() {
		return admin_type;
	}

	public void setAdmin_type(String admin_type) {
		this.admin_type = admin_type;
	}

	@Column(name = "ACTIVE")
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	@Column(table = "ADMIN_IMAGE")
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

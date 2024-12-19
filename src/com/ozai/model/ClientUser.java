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

@Entity
@Table(name = "CLIENT_USER")
@SecondaryTables({ @SecondaryTable(name = "CLIENTUSER_IMAGE", pkJoinColumns = {
		@PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id") }) })

public class ClientUser implements Serializable {

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
	private int cluster_id;
	private String client;
	private int property;
	private int client_code;
	private int active;
	private byte[] image;
	private int premium;
	private String role;
	private String verificationToken;
	

	public ClientUser() {
		//setReg_date(MsbUtil.getCurrentDate());
		//setPoints(250);
		//setActive(1);
		setCluster_id(0);
		setProperty(0);
	}
	
	/*
	 * @ManyToOne(targetEntity = Token.class, fetch = FetchType.EAGER)
	 * 
	 * @JoinColumn(name = "USER_NAME", referencedColumnName = "SESSION_ID",
	 * insertable = false, updatable = false)
	 * 
	 * private Token token; public Token getToken() { return token; }
	 * 
	 * public void setToken(Token token) { this.token = token; }
	 */

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
	public int getProperty() {
		return property;
	}

	public void setProperty(int property) {
		this.property = property;
	}

	@Column(name = "CLIENT_CODE")
	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	@Column(name = "ACTIVE")
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	@Column(table = "CLIENTUSER_IMAGE")
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

	@Column(name = "PREMIUM")
	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

	@Column(name = "ROLE")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "CLUSTER_ID")
	public int getCluster_id() {
		return cluster_id;
	}

	public void setCluster_id(int cluster_id) {
		this.cluster_id = cluster_id;
	}

	@Column(name = "VERIFICATION_TOKEN")
	public String getVerificationToken() {
		return verificationToken;
	}

	public void setVerificationToken(String verificationToken) {
		this.verificationToken = verificationToken;
	}

}

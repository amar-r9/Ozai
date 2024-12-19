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
@Table(name = "EMPLOY")
public class Employees implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "FIRST_NAME")
	private String first_name;
	
	@Column(name = "LAST_NAME")
	private String last_name;
	
	@Column(name = "ROLE")
	private String role;

	@Column(name = "MOBILE")
	private String mobile;
	
	@Column(name = "SALARY")
	private double salary;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "PAN")
	private String pan;
	
	@Column(name = "ACCOUNT")
	private String account;

	@Column(name = "IFSC")
	private String ifsc;
	
	@Column(name = "JOIN_DATE")
	private Date join_date;
	
	@Column(name = "RESIGN_DATE")
	private Date resign_date;
	
	@Column(name = "PAN_FILE")
	private String pan_file;
	
	@Column(name = "ID_PROOF")
	private String id_proof;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "IDENTIFIER")
	private String identifier;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;

	public Employees() {
		setStatus("Active");
		setResign_date(null);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getResign_date() {
		return resign_date;
	}

	public void setResign_date(Date resign_date) {
		this.resign_date = resign_date;
	}

	public String getPan_file() {
		return pan_file;
	}

	public void setPan_file(String pan_file) {
		this.pan_file = pan_file;
	}

	public String getId_proof() {
		return id_proof;
	}

	public void setId_proof(String id_proof) {
		this.id_proof = id_proof;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIdentifier() {
		return identifier;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

}

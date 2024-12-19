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
@Table(name = "VENDOR")
public class Vendor implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "CITY")
	private String city;

	@Column(name = "STATE")
	private String state;

	@Column(name = "CONTACT")
	private String contact;
	
	@Column(name = "PAN")
	private String pan;
	
	@Column(name = "GST")
	private String gst;
	
	@Column(name = "APPLICABLE_TDS")
	private double applicable_tds;
	
	@Column(name = "PAYMENT_TERMS")
	private String payment_terms;
	
	@Column(name = "BANK_ACCOUNT")
	private String bank_account;
	
	@Column(name = "IFSC")
	private String ifsc;
	
	@Column(name = "BANK_IDENTIFIER")
	private String bank_identifier;
	
	@Column(name = "VENDOR_TYPE")
	private String vendor_type;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	public Vendor() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getVendor_type() {
		return vendor_type;
	}

	public void setVendor_type(String vendor_type) {
		this.vendor_type = vendor_type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getGst() {
		return gst;
	}

	public void setGst(String gst) {
		this.gst = gst;
	}

	public double getApplicable_tds() {
		return applicable_tds;
	}

	public void setApplicable_tds(double applicable_tds) {
		this.applicable_tds = applicable_tds;
	}

	public String getPayment_terms() {
		return payment_terms;
	}

	public void setPayment_terms(String payment_terms) {
		this.payment_terms = payment_terms;
	}

	public String getBank_account() {
		return bank_account;
	}

	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public String getBank_identifier() {
		return bank_identifier;
	}

	public void setBank_identifier(String bank_identifier) {
		this.bank_identifier = bank_identifier;
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

}

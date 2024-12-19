package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "B2C_SECURITY_DEPOSIT")
public class B2C_SecurityDeposit implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "Amount")
	private String amount;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "PAID_DATE")
	private Date paid_date;
	
	@Column(name = "PAYMENT_ID")
	private String payment_id;
	
	@Column(name = "PAYMENT_REQUEST_ID")
	private String payment_request_id;
	
	@Column(name = "PAYMENT_METHOD")
	private String payment_method;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "GENERATED_DATE")
	private Date generated_date;

	public B2C_SecurityDeposit() {
		setGenerated_date(OzaiUtil.getCurrentDate());
	}
	
	
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(targetEntity = B2C_Details.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
	
	private B2C_Details details;
	public B2C_Details getDetails() {
		return details;
	}

	public void setDetails(B2C_Details details) {
		this.details = details;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getPayment_request_id() {
		return payment_request_id;
	}

	public void setPayment_request_id(String payment_request_id) {
		this.payment_request_id = payment_request_id;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public Date getGenerated_date() {
		return generated_date;
	}

	public void setGenerated_date(Date generated_date) {
		this.generated_date = generated_date;
	}

	
}

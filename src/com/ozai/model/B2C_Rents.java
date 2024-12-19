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

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "B2C_RENTS")
public class B2C_Rents implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "SERVICE_MONTH")
	private String service_month;

	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "AMOUNT")
	private double amount;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "RAISED_DATE")
	private Date raised_date;
	
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
	
	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	public B2C_Rents() {
		setAdmin_id(0);
		setClient_code(0);
		setRaised_date(OzaiUtil.getCurrentDate());
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
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@NotFound(action = NotFoundAction.IGNORE)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getService_month() {
		return service_month;
	}

	public void setService_month(String service_month) {
		this.service_month = service_month;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}

	public Date getRaised_date() {
		return raised_date;
	}

	public void setRaised_date(Date raised_date) {
		this.raised_date = raised_date;
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

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

}

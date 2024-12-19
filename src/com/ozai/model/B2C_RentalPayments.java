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
@Table(name = "B2C_RENT_PAYMENTS")
public class B2C_RentalPayments implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "PAYMENT_ID")
	private int paymentId;
	
	@Column(name = "RENT_AMOUNT")
	private double rent_amount;

	@Column(name = "PAYMENT_DATE")
	private Date payemnt_date;
	
	@Column(name = "MONTH")
	private String month;
	
	@Column(name = "SCREEN_SHOT")
	private String screen_shot;
	
	@Column(name = "PAYMENT_METHOD")
	private String payment_method;
	
	@Column(name = "PAYMENT_REQUEST_ID")
	private String payment_request_id;
	
	@Column(name= "GENERATED_DATE")
	private Date generated_date;
	
	@Column(name = "STATUS")
	private String status;
	
	public B2C_RentalPayments() {
		setPayemnt_date(OzaiUtil.getCurrentDate());
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public double getRent_amount() {
		return rent_amount;
	}

	public void setRent_amount(double rent_amount) {
		this.rent_amount = rent_amount;
	}

	public Date getPayemnt_date() {
		return payemnt_date;
	}

	public void setPayemnt_date(Date payemnt_date) {
		this.payemnt_date = payemnt_date;
	}

	public String getScreen_shot() {
		return screen_shot;
	}

	public void setScreen_shot(String screen_shot) {
		this.screen_shot = screen_shot;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getPayment_request_id() {
		return payment_request_id;
	}

	public void setPayment_request_id(String payment_request_id) {
		this.payment_request_id = payment_request_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getGenerated_date() {
		return generated_date;
	}

	public void setGenerated_date(Date generated_date) {
		this.generated_date = generated_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}

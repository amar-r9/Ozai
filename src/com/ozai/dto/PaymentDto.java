package com.ozai.dto;

public class PaymentDto {
	private String id;
	private String phone;
	private String email;
	private String buyer_name;
	private String amount;
	private String purpose;
	private String expires_at;
	private String status;
	private boolean send_sms;
	private boolean send_email;
	private String sms_status;
	private String email_status;
	private String shorturl;
	private String longurl;
	private String redirect_url;
	private String webhook;
	private boolean allow_repeated_payments;
	private String created_at;
	private String modified_at;

	// Getter Methods

	public String getId() {
		return id;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public String getAmount() {
		return amount;
	}

	public String getPurpose() {
		return purpose;
	}

	public String getExpires_at() {
		return expires_at;
	}

	public String getStatus() {
		return status;
	}

	public boolean getSend_sms() {
		return send_sms;
	}

	public boolean getSend_email() {
		return send_email;
	}

	public String getSms_status() {
		return sms_status;
	}

	public String getEmail_status() {
		return email_status;
	}

	public String getShorturl() {
		return shorturl;
	}

	public String getLongurl() {
		return longurl;
	}

	public String getRedirect_url() {
		return redirect_url;
	}

	public String getWebhook() {
		return webhook;
	}

	public boolean getAllow_repeated_payments() {
		return allow_repeated_payments;
	}

	public String getCreated_at() {
		return created_at;
	}

	public String getModified_at() {
		return modified_at;
	}

	// Setter Methods

	public void setId(String id) {
		this.id = id;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public void setExpires_at(String expires_at) {
		this.expires_at = expires_at;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSend_sms(boolean send_sms) {
		this.send_sms = send_sms;
	}

	public void setSend_email(boolean send_email) {
		this.send_email = send_email;
	}

	public void setSms_status(String sms_status) {
		this.sms_status = sms_status;
	}

	public void setEmail_status(String email_status) {
		this.email_status = email_status;
	}

	public void setShorturl(String shorturl) {
		this.shorturl = shorturl;
	}

	public void setLongurl(String longurl) {
		this.longurl = longurl;
	}

	public void setRedirect_url(String redirect_url) {
		this.redirect_url = redirect_url;
	}

	public void setWebhook(String webhook) {
		this.webhook = webhook;
	}

	public void setAllow_repeated_payments(boolean allow_repeated_payments) {
		this.allow_repeated_payments = allow_repeated_payments;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public void setModified_at(String modified_at) {
		this.modified_at = modified_at;
	}
}
package com.ozai.dto;

public class CreatePaymentResponse {
	
	public boolean success;
	
	public PaymentDto payment_request;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public PaymentDto getPayment_request() {
		return payment_request;
	}

	public void setPayment_request(PaymentDto payment_request) {
		this.payment_request = payment_request;
	}
	
	

}

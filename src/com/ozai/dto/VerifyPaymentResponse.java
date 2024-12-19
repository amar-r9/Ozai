package com.ozai.dto;

public class VerifyPaymentResponse {
	private boolean success;
	private PaymentDto payment_request;

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

	public boolean isValid() {
		return this.success && this.payment_request != null
				&& "Completed".equalsIgnoreCase(this.payment_request.getStatus());
	}
}

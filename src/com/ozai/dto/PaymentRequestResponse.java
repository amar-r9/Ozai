package com.ozai.dto;

import java.util.ArrayList;
import java.util.List;

public class PaymentRequestResponse {
	private boolean success;
	List<PaymentDto> payment_requests = new ArrayList<>();

	// Getter Methods

	public boolean isSuccess() {
		return success;
	}

	// Setter Methods

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public List<PaymentDto> getPayment_requests() {
		return payment_requests;
	}

	public void setPayment_requests(List<PaymentDto> payment_requests) {
		this.payment_requests = payment_requests;
	}

}
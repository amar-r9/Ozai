package com.ozai.service;

import com.ozai.dto.CreatePaymentResponse;
import com.ozai.dto.VerifyPaymentResponse;
import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.User;

public interface PaymentService {
	
	void getPayments();

	CreatePaymentResponse sendUserData(B2C_Rents rent) throws Exception;
	
	String pullLongUrl(String id);
	
	VerifyPaymentResponse verifyPayment(String id, String paymentId);
	
	CreatePaymentResponse sendElectricityBillData(B2C_ElectricityBill bill) throws Exception;

	CreatePaymentResponse sendBookingPaymentData(B2C_BOOKINGS booking) throws Exception;

	CreatePaymentResponse sendSecurityDepositData(B2C_SecurityDeposit bill) throws Exception;
	
}

/**
 * 
 */
package com.ozai.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ozai.dto.CreatePaymentResponse;
import com.ozai.dto.PaymentDto;
import com.ozai.dto.PaymentRequestResponse;
import com.ozai.dto.VerifyPaymentResponse;
import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.User;

/**
 * @author Amar R
 *
 */
@Service
public class PaymentServiceImpl implements PaymentService {

	@Override
	public void getPayments() {
		HttpsURLConnection connection = null;
		try {
			URL url = new URL("https://www.instamojo.com/api/1.1/payment-requests/");
			connection = (HttpsURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
			connection.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
			connection.setUseCaches(false);
			connection.setDoOutput(true);

			// Get Response
			InputStream is = connection.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is));
			StringBuilder response = new StringBuilder(); // or StringBuffer if Java version 5+
			String line;
			while ((line = rd.readLine()) != null) {
				response.append(line);
			}
			rd.close();
			String res = response.toString();

			Gson json = new Gson();
			PaymentRequestResponse prr = json.fromJson(res, PaymentRequestResponse.class);

			List<PaymentDto> l = prr.getPayment_requests();
			System.out.println("getSuccess():" + prr.isSuccess());
			if (prr.isSuccess()) {
				l.stream().filter(dto -> null != dto && dto.getLongurl() != null)
						.forEach(dto -> System.out.println(dto.getLongurl()));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return;
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}

	}

	@Override
	public CreatePaymentResponse sendUserData(B2C_Rents rent) throws Exception {

		URL url = new URL("https://www.instamojo.com/api/1.1/payment-requests/");
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("allow_repeated_payments", false);
		params.put("amount", rent.getAmount());
		params.put("buyer_name", rent.getUser().getName());
		params.put("purpose", "Rent");
		params.put("redirect_url", "https://www.ozailiving.com/mobile/user/payment-success/"+rent.getId()+"");
		params.put("phone", rent.getUser().getMobile());
		//params.put("send_email", true);
		params.put("webhook", "https://www.tikaana.com/mobile/webhook/");
		params.put("send_sms", true);
		//params.put("email", userData.getEmail());

		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
		conn.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes);

		Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		StringBuilder res = new StringBuilder();

		for (int c; (c = in.read()) >= 0;)
			res.append((char) c);

		Gson gson = new Gson();
		return gson.fromJson(res.toString(), CreatePaymentResponse.class);

	}

	@Override
	public String pullLongUrl(String id) {
		return "https://www.instamojo.com/@tikaana/" + id;
	}

	@Override
	public VerifyPaymentResponse verifyPayment(String id, String paymentId) {
		HttpsURLConnection connection = null;
		try {

			StringBuilder urlStr = new StringBuilder("https://www.instamojo.com/api/1.1/payment-requests/");
			urlStr.append(id);
			urlStr.append("/");
			urlStr.append(paymentId);
			urlStr.append("/");

			URL url = new URL(urlStr.toString());
			connection = (HttpsURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
			connection.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
			connection.setUseCaches(false);
			connection.setDoOutput(true);

			// Get Response
			InputStream is = connection.getInputStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is));
			StringBuilder response = new StringBuilder(); // or StringBuffer if Java version 5+
			String line;
			while ((line = rd.readLine()) != null) {
				response.append(line);
			}
			rd.close();
			return new Gson().fromJson(response.toString(), VerifyPaymentResponse.class);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return null;
	}
	
	@Override
	public CreatePaymentResponse sendElectricityBillData(B2C_ElectricityBill bill) throws Exception {

		URL url = new URL("https://www.instamojo.com/api/1.1/payment-requests/");
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("allow_repeated_payments", false);
		params.put("amount", bill.getAmount());
		params.put("buyer_name", bill.getUser().getName());
		params.put("purpose", "Electricity");
		params.put("redirect_url", "https://www.ozailiving.com/mobile/user/electricity-payment/success/"+bill.getId()+"");
		params.put("phone", bill.getUser().getMobile());
		//params.put("send_email", true);
		params.put("webhook", "https://www.ozailiving.com/mobile/webhook/");
		params.put("send_sms", true);
		//params.put("email", userData.getEmail());

		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
		conn.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes);

		Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		StringBuilder res = new StringBuilder();

		for (int c; (c = in.read()) >= 0;)
			res.append((char) c);

		Gson gson = new Gson();
		return gson.fromJson(res.toString(), CreatePaymentResponse.class);

	}
	
	@Override
	public CreatePaymentResponse sendSecurityDepositData(B2C_SecurityDeposit bill) throws Exception {

		URL url = new URL("https://www.instamojo.com/api/1.1/payment-requests/");
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("allow_repeated_payments", false);
		params.put("amount", bill.getAmount());
		params.put("buyer_name", bill.getUser().getName());
		params.put("purpose", "SD");
		params.put("redirect_url", "https://www.ozailiving.com/mobile/user/sd-payment/success/"+bill.getId()+"");
		params.put("phone", bill.getUser().getMobile());
		//params.put("send_email", true);
		params.put("webhook", "https://www.ozailiving.com/mobile/webhook/");
		params.put("send_sms", true);
		//params.put("email", userData.getEmail());

		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
		conn.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes);

		Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		StringBuilder res = new StringBuilder();

		for (int c; (c = in.read()) >= 0;)
			res.append((char) c);

		Gson gson = new Gson();
		return gson.fromJson(res.toString(), CreatePaymentResponse.class);

	}
	
	@Override
	public CreatePaymentResponse sendBookingPaymentData(B2C_BOOKINGS booking) throws Exception {

		URL url = new URL("https://www.instamojo.com/api/1.1/payment-requests/");
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("allow_repeated_payments", false);
		params.put("amount", booking.getBooking_amount());
		params.put("buyer_name", booking.getWalkin().getName());
		params.put("purpose", "Booking");
		params.put("redirect_url", "https://www.ozailiving.com/booking-payment/success/"+booking.getWalkin_id()+"");
		params.put("phone", booking.getWalkin().getMobile());
		//params.put("send_email", true);
		params.put("webhook", "https://www.ozailiving.com/mobile/webhook/");
		params.put("send_sms", true);
		//params.put("email", userData.getEmail());

		StringBuilder postData = new StringBuilder();
		for (Map.Entry<String, Object> param : params.entrySet()) {
			if (postData.length() != 0)
				postData.append('&');
			postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
			postData.append('=');
			postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		}
		byte[] postDataBytes = postData.toString().getBytes("UTF-8");

		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("X-Api-Key", "c0edd1fc2768dc45edde1409f578876d");
		conn.setRequestProperty("X-Auth-Token", "b00742621f937a3bdcd0c576fe52a092");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
		conn.setDoOutput(true);
		conn.getOutputStream().write(postDataBytes);

		Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

		StringBuilder res = new StringBuilder();

		for (int c; (c = in.read()) >= 0;)
			res.append((char) c);

		Gson gson = new Gson();
		return gson.fromJson(res.toString(), CreatePaymentResponse.class);

	}

}

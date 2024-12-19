package com.ozai.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.dto.CreatePaymentResponse;
import com.ozai.dto.VerifyPaymentResponse;
import com.ozai.model.B2C_ElectricityBill;
import com.ozai.model.B2C_Rents;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.User;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.PaymentService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;

@Controller
public class PaymentController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	B2CService b2cService;

	public boolean sendSMS(String name, String mobile, String password) {

		System.out.println("In sms 1");
		try {
			String message = "Dear "+name+ ", your username is " + mobile + " and password is " + password 
					+ " Please login to the app using the above credentials! From " + 
					"Team Tikaana";
					
					
					
			String requestUrl = "https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?" + "APIKEY=" + "zkpwwwufKbl"
					+ "&MobileNo=" + mobile + "&SenderID=" + "TKNAPG" + "&Message="
					+ URLEncoder.encode(message, "UTF-8") + "&ServiceName=" + "TEMPLATE_BASED";
			System.out.println("In sms 2");
			URL url = new URL(requestUrl);
			HttpsURLConnection httpsCon = (HttpsURLConnection) url.openConnection();
			httpsCon.setRequestMethod("GET");
			httpsCon.setConnectTimeout(10000);
			int intresult = httpsCon.getResponseCode();
			String strresult = httpsCon.getResponseMessage();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpsCon.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);

				System.out.println("inputLine" + strresult);
			}
			System.out.println("Sent" + response);
			in.close();
			httpsCon.disconnect();
			return true;

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("error");
			return false;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}
  	
  	@RequestMapping(value = "/mobile/user/make-payment/{id}", method = RequestMethod.GET)
	public ModelAndView makeUserPayment(HttpSession session, 
			@PathVariable int id) {
		
  		ModelAndView modelAndView=new ModelAndView();
		B2C_Rents rent =  b2cService.getB2CRentDetails(id);
		
		try {
			CreatePaymentResponse cpr = paymentService.sendUserData(rent);
			if (cpr.isSuccess()) {
				String paymentUrl = paymentService.pullLongUrl(cpr.getPayment_request().getId());
				modelAndView.setViewName("redirect:" + paymentUrl);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//modelAndView.setViewName("/mobile/talent/entry");
		return modelAndView;
		
	}
  	
  	@RequestMapping(value = "/mobile/user/payment-success/{id}", method = RequestMethod.GET)
	public ModelAndView paymentUserSuccess(@RequestParam String payment_id, @RequestParam String payment_status,
			@RequestParam String payment_request_id, HttpSession session, @PathVariable int id, HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		final VerifyPaymentResponse verifiedPayment = paymentService.verifyPayment(payment_request_id, payment_id);
		if (verifiedPayment.isValid()) {
			modelAndView.addObject("success", true);
			B2C_Rents payment = b2cService.getB2CRentDetails(id);
			payment.setPaid_date(OzaiUtil.getCurrentDate());
			payment.setStatus("PAID");
			payment.setPayment_id(payment_id);
			payment.setPayment_request_id(payment_request_id);
			b2cService.updateRentPayment(payment);
			modelAndView.setViewName("/mobile/payment-success");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/payment-success");
		}
		return modelAndView;
		
		
	}
  	
  	private void uploadFile(String filename, MultipartFile image, String type) {
		File image_path = new File(servletContext.getRealPath("/") + "uploaded_files/DOC/" + type + "/" + filename);
		image_path.getParentFile().mkdirs();
		try {
			FileUtils.writeByteArrayToFile(image_path, image.getBytes());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
  	
  	@RequestMapping(value = "/mobile/user/electricity-payment/{id}", method = RequestMethod.GET)
	public ModelAndView makeElectricityPayment(HttpSession session, 
			@PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		B2C_ElectricityBill bill = b2cService.getB2CElectricityBill(id);
		
		try {
			CreatePaymentResponse cpr = paymentService.sendElectricityBillData(bill);
			if (cpr.isSuccess()) {
				String paymentUrl = paymentService.pullLongUrl(cpr.getPayment_request().getId());
				modelAndView.setViewName("redirect:" + paymentUrl);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//modelAndView.setViewName("/mobile/talent/entry");
		return modelAndView;
		
	}
  	
  	@RequestMapping(value = "/mobile/user/electricity-payment/success/{id}", method = RequestMethod.GET)
	public ModelAndView paymentElectricitySuccess(@RequestParam String payment_id, @RequestParam String payment_status,
			@RequestParam String payment_request_id, HttpSession session, @PathVariable int id, HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		final VerifyPaymentResponse verifiedPayment = paymentService.verifyPayment(payment_request_id, payment_id);
		if (verifiedPayment.isValid()) {
			modelAndView.addObject("success", true);
			User userData = (User) session.getAttribute("User");
			B2C_ElectricityBill bill = b2cService.getB2CElectricityBill(id);
			
			bill.setPaid_date(OzaiUtil.getCurrentDate());
			bill.setStatus("PAID");
			bill.setPayment_id(payment_id);
			bill.setPayment_request_id(payment_request_id);
			b2cService.updateElectricityPayment(bill);
			modelAndView.setViewName("/mobile/payment-success");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/payment-success");
		}
		return modelAndView;
		
		
	}
  	
  	@RequestMapping(value = "/mobile/user/sd-payment/{id}", method = RequestMethod.GET)
	public ModelAndView makeSDPayment(HttpSession session, 
			@PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		B2C_SecurityDeposit bill = b2cService.getB2CSecurityDeposit(id);
		
		try {
			CreatePaymentResponse cpr = paymentService.sendSecurityDepositData(bill);
			if (cpr.isSuccess()) {
				String paymentUrl = paymentService.pullLongUrl(cpr.getPayment_request().getId());
				modelAndView.setViewName("redirect:" + paymentUrl);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//modelAndView.setViewName("/mobile/talent/entry");
		return modelAndView;
		
	}
  	
  	@RequestMapping(value = "/mobile/user/sd-payment/success/{id}", method = RequestMethod.GET)
	public ModelAndView paymentSecurityDepositSuccess(@RequestParam String payment_id, @RequestParam String payment_status,
			@RequestParam String payment_request_id, HttpSession session, @PathVariable int id, HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		final VerifyPaymentResponse verifiedPayment = paymentService.verifyPayment(payment_request_id, payment_id);
		if (verifiedPayment.isValid()) {
			modelAndView.addObject("success", true);
			User userData = (User) session.getAttribute("User");
			B2C_SecurityDeposit bill = b2cService.getB2CSecurityDeposit(id);
			
			bill.setPaid_date(OzaiUtil.getCurrentDate());
			bill.setStatus("PAID");
			bill.setPayment_id(payment_id);
			bill.setPayment_request_id(payment_request_id);
			b2cService.updateSDPayment(bill);
			modelAndView.setViewName("/mobile/payment-success");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/payment-success");
		}
		return modelAndView;
		
		
	}
	
}

package com.ozai.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Beds;
import com.ozai.model.PG;
import com.ozai.model.User;
import com.ozai.model.VACATENOTICE;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.PropertyService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
import com.ozai.dto.CreatePaymentResponse;
import com.ozai.dto.VerifyPaymentResponse;
import com.ozai.model.B2C_BOOKINGS;
import com.ozai.model.Walkins;
import com.ozai.service.PaymentService;

@Controller
public class BookingController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private B2CService b2cService;

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	UserService userService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin/bookings/add-walkin", method = RequestMethod.GET)
	public ModelAndView walkinAdd(ModelMap map, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/bookings/add-walkin");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/bookings/save-walkin", method = RequestMethod.POST)
	public ModelAndView saveBedsBooking(@ModelAttribute("walkin") Walkins walkin, 
			HttpSession session) throws IOException {
		Admin admin = (Admin) session.getAttribute("AdminUser");

		ModelAndView modelAndView = new ModelAndView();
		walkin.setStatus("Enquired");
		
		boolean id = b2cService.saveWalkin(walkin);

		if (id) {
			//sendSMS(bookings.getName(), bookings.getMobile(), bookings.getRefid(), bookings.getNo_of_beds());
			modelAndView.addObject("success", true);
			//List<Walkins> walkins = b2cService.getAllWalkinsByAdmin(admin.getClient_code());
			//modelAndView.addObject("walkins", walkins);
			modelAndView.setViewName("redirect:/admin/bookings/walkins-list");
		} else {
			return new ModelAndView("redirect:/admin/bookings/add-walkin");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/bookings/walkins-list", method = RequestMethod.GET)
	public ModelAndView allWalkins(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<Walkins> walkins = b2cService.getAllWalkinsByAdmin(admin.getClient_code());

		modelAndView.addObject("walkins", walkins);

		modelAndView.setViewName("/admin/bookings/walkins-list");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/bookings/walkin/{id}", method = RequestMethod.GET)
	public ModelAndView walkinDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Walkins walkin = b2cService.getWalkinDetails(id);

		modelAndView.addObject("walkin", walkin);

		modelAndView.setViewName("/admin/bookings/walkin");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/bookings/confirm-booking/{id}", method = RequestMethod.GET)
	public ModelAndView confirmBooking(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Walkins walkin = b2cService.getWalkinDetails(id);
		modelAndView.addObject("walkin", walkin);
		List<Beds> beds = propertyService.getBedsByPropertyAndSharing(walkin.getProperty_id(), walkin.getSharing());
		modelAndView.addObject("beds", beds);

		modelAndView.setViewName("/admin/bookings/confirm-booking");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/confirmB2CBooking", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView saveBooking(@ModelAttribute("booking") B2C_BOOKINGS booking, 
		HttpSession session) throws IOException {

		ModelAndView modelAndView = new ModelAndView();
		booking.setStatus("Confirmed");
		System.out.println("Booking:" +booking);
		boolean id = b2cService.saveB2CBooking(booking);
		String paymentUrl = "https://ozailiving.com/booking-payment/"+booking.getWalkin_id()+"";
		
		if (id) {
			//sendSMS(booking, paymentUrl);
			System.out.println("Link: "+paymentUrl);
			modelAndView.addObject("saved", true);
			modelAndView.setViewName("redirect:/admin/bookings/bookings-list");
		} else {
			return new ModelAndView("redirect:/admin/bookings/add-walkin");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/booking-payment/{id}", method = RequestMethod.GET)
	public ModelAndView makeBookingPayment(HttpSession session, 
			@PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		B2C_BOOKINGS booking = b2cService.getBookingDetails(id);
		String paymentUrl = null;
		
		try {
			CreatePaymentResponse cpr = paymentService.sendBookingPaymentData(booking);
			if (cpr.isSuccess()) {
				paymentUrl = paymentService.pullLongUrl(cpr.getPayment_request().getId());
				//modelAndView.setViewName("redirect:" + paymentUrl);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("paymentUrl", paymentUrl);
		modelAndView.addObject("booking", booking);
		modelAndView.setViewName("/admin/bookings/booking-payment");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/booking-payment/success/{id}", method = RequestMethod.GET)
	public ModelAndView paymentElectricitySuccess(@RequestParam String payment_id, @RequestParam String payment_status,
			@RequestParam String payment_request_id, HttpSession session, @PathVariable int id, HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		final VerifyPaymentResponse verifiedPayment = paymentService.verifyPayment(payment_request_id, payment_id);
		if (verifiedPayment.isValid()) {
			modelAndView.addObject("success", true);
			User userData = (User) session.getAttribute("User");
			B2C_BOOKINGS bill = b2cService.getBookingDetails(id);
			bill.setPaid_date(OzaiUtil.getCurrentDate());
			bill.setStatus("PAID");
			bill.setPayment_id(payment_id);
			b2cService.updateBookingPayment(bill);
			b2cService.updateBookingDetails(bill);
			modelAndView.setViewName("/mobile/payment-success");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/payment-success");
		}
		return modelAndView;
		
		
	}
	
	public boolean sendSMS(B2C_BOOKINGS booking, String link) {

		System.out.println("In sms 1");
		try {
			String message = "Dear "+booking.getWalkin().getName()+", This is to confirm your booking at Tikaana. Please make the payment of "+booking.getBooking_amount()+" using this link to confirm your booking. Payment link - https://tikaana.com/booking-payment/"+booking.getId()+"   --Tikaana";
					
			String requestUrl = "https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?" + "APIKEY=" + "zkpwwwufKbl"
					+ "&MobileNo=" + booking.getWalkin().getMobile() + "&SenderID=" + "TKNAPG" + "&Message="
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
	
	@RequestMapping(value = "/admin/bookings/bookings-list", method = RequestMethod.GET)
	public ModelAndView allBookings(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<B2C_BOOKINGS> bookings = b2cService.getAllBookingsByAdmin(admin.getClient_code());

		modelAndView.addObject("bookings", bookings);

		modelAndView.setViewName("/admin/bookings/bookings-list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/bookings/confirm-bookings/{id}", method = RequestMethod.GET)
	public ModelAndView confirmThisBooking(HttpSession session, @PathVariable int id) {
		
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		B2C_BOOKINGS booking = b2cService.getBookingDetails(id);
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("booking", booking);
		modelAndView.addObject("pgs", pgs);

		modelAndView.setViewName("/admin/bookings/booking");
		return modelAndView;

	}

}

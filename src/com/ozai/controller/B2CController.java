package com.ozai.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.ozai.model.ClientUser;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.PG;
import com.ozai.model.User;
import com.ozai.model.VACATENOTICE;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.PropertyService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
//import com.ozai.service.TikaanaPaymentService;
import com.ozai.service.OzaiService;

@Controller
public class B2CController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private B2CService b2cService;

	@Autowired
	private OzaiService ozaiService;
	
	@Autowired
	UserService userService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin/residents/pending-rents", method = RequestMethod.GET)
	public ModelAndView pendingRents(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsList(admin.getClient_code(), "Due", 0);
		modelAndView.addObject("rents", rents);
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/month/pending-rents", method = RequestMethod.POST)
	public ModelAndView pendingRentsByMonth(HttpSession session, @RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsListByMonth(admin.getClient_code(), "Due", month, 0);
		modelAndView.addObject("rents", rents);
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/property/pending-rents", method = RequestMethod.POST)
	public ModelAndView pendingRentsByProperty(HttpSession session, @RequestParam int property) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsListByProperty(admin.getClient_code(), "Due", property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		modelAndView.addObject("pg", pg.getName());
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/update-rent-payment/{id}", method = RequestMethod.GET)
	public ModelAndView addSDELec(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Admin userData = (Admin) session.getAttribute("AdminUser");
		B2C_Rents rent = b2cService.getB2CRentDetails(id);
		modelAndView.addObject("rent", rent);
		modelAndView.setViewName("/admin/residents/update-rent-payment");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/updatePayment", method = RequestMethod.POST)
	public ModelAndView paymentUserSuccess(@ModelAttribute B2C_Rents payment, HttpSession session, @RequestParam String on_time) {
		
		ModelAndView modelAndView=new ModelAndView();
		B2C_Rents rent = b2cService.getB2CRentDetails(payment.getId());
		rent.setPayment_id(payment.getPayment_id());
		rent.setPayment_method(payment.getPayment_method());
		rent.setPaid_date(payment.getPaid_date());
		rent.setStatus("Paid");
		
		boolean save = b2cService.updateRentPayment(rent);
		if(save) {
			System.out.println("On time : " +on_time);
			if(on_time.equalsIgnoreCase("YES")) {
				userService.updateUserRentalCreditScore(rent.getUser_id(), 10, 1);
			} else {
				userService.updateUserRentalCreditScore(rent.getUser_id(), 5, 0);
			}
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/admin/residents/pending-rents");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/admin/residents/pending-rents");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/paid-rents", method = RequestMethod.GET)
	public ModelAndView paidRents(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsList(admin.getClient_code(), "Paid", 10);
		modelAndView.addObject("rents", rents);
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/month/paid-rents", method = RequestMethod.POST)
	public ModelAndView paidRentsByMonth(HttpSession session, @RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsListByMonth(admin.getClient_code(), "Paid", month, 0);
		modelAndView.addObject("rents", rents);
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/property/paid-rents", method = RequestMethod.POST)
	public ModelAndView paidRentsByProperty(HttpSession session, @RequestParam int property) {
		
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Rents> rents = b2cService.getB2CRentsListByProperty(admin.getClient_code(), "Paid", property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		modelAndView.addObject("pg", pg.getName());
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/pending-payments", method = RequestMethod.GET)
	public ModelAndView userPaymentHistory(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("User");
		List<B2C_Rents> rents = b2cService.getB2CUserRents(user.getId(), "Due");
		modelAndView.addObject("rents", rents);
		modelAndView.setViewName("/mobile/pending-payments");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/sendVacateNotice", method = RequestMethod.POST)
	public String editUSerP(@ModelAttribute VACATENOTICE notice,
			HttpSession session) {
			
		B2C_Details details = adminService.getB2CResidentDetails(notice.getUser_id());
		notice.setAdmin_id(details.getAdmin_id());
		if(notice.getVacate_date().after(OzaiUtil.getVacateNoticeDt(14))) {
			boolean save = b2cService.saveUserVacateNotice(notice);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		} else {
			return "invalid";
		}
		
			
		//return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/generateRent/{month}", method = RequestMethod.GET)
	public String tenantMovedOut(@PathVariable String month, HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<B2C_Details> details = adminService.getActiveB2CResidents(admin.getClient_code());
		System.out.println("In controller"+month);
		int status = 0;
		for (B2C_Details tenant : details) {
			B2C_Rents rent = new B2C_Rents();
			rent.setRaised_date(OzaiUtil.getCurrentDate());
			rent.setAdmin_id(admin.getClient_code());
			rent.setAmount(tenant.getRent());
			rent.setProperty_id(tenant.getProperty_id());
			rent.setService_month(month);
			rent.setUser_id(tenant.getUser_id());
			rent.setStatus("Due");
			
			if(b2cService.isRentGenerated(rent.getUser_id(), rent.getService_month())) {
				
			} else {
				boolean save = b2cService.generateResidentRent(rent);				
				if (save) {
					status++;					
				}
			}
		}
		if(status!=0) {
			return "<h5 class=\"alert alert-success fw-bold text-center\">Rent generated for "+status+" residents.</h5>";
		} else {
			return "<h5 class=\"alert alert-danger fw-bold text-center\">Rents already generated.</h5>";
		}
	}

}

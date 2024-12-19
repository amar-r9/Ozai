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
import java.sql.Time;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.time.Instant;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ozai.model.UserLikeValidation;
import com.ozai.beans.Residents;
import com.ozai.beans.ResidentsData;
import com.ozai.dto.VerifyPaymentResponse;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Badminton_league;
import com.ozai.model.Event;
import com.ozai.model.Groceries;
import com.ozai.model.Grocery_Booking;
import com.ozai.model.Inventory;
import com.ozai.model.Loan;
import com.ozai.model.Notice;
import com.ozai.model.PG;
import com.ozai.model.Talent;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.model.User_Ratings;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.ClientService;
import com.ozai.service.CoreService;
import com.ozai.service.MiscService;
import com.ozai.service.PropertyService;
import com.ozai.service.OzaiService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;

@Controller
public class SmartLifeController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private AdminService adminService;

	@Autowired
	private OzaiService ozaiService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private B2CService b2cService;
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private MiscService miscService;

	@RequestMapping(value = "/smartlifelogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {

		Admin userData = (Admin) session.getAttribute("SmartAdmin");
		if (userData != null) {
			return new ModelAndView("/smartlife");
		} else
			return new ModelAndView("/smartlife/login", "smart", new Admin());
	}

	@RequestMapping(value = "/smartlife", method = RequestMethod.GET)
	public ModelAndView tikaanaAdmin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		List<Talent> entries = ozaiService.getAllTalentEntries();
		modelAndView.addObject("entries", entries);
		List<String> organizations = ozaiService.getOrganizationsList();
		modelAndView.addObject("organizations", organizations);
		
		modelAndView.setViewName("/smartlife/index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/smartlife/registrations/list", method = RequestMethod.GET)
	public ModelAndView registrations(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		List<User> users = ozaiService.getSmartIdolRegistrations();
		modelAndView.addObject("users", users);
		modelAndView.setViewName("/smartlife/list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/smartlife/entry/{id}", method = RequestMethod.GET)
	public ModelAndView talentEntry(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		Talent talent = ozaiService.getTalentEntry(id);
		
		modelAndView.addObject("talent", talent);
		
		modelAndView.setViewName("/smartlife/entry");
		return modelAndView;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/validate-user-like", method = RequestMethod.POST)
	public String validateUserLike(
			@ModelAttribute UserLikeValidation userLikeValidation, HttpSession session) {
		User userData = (User) session.getAttribute("User");
		
		if (userData != null) {
			userLikeValidation.setLiked_user(userData.getId());
			if (ozaiService.isUserLiked(userLikeValidation)) {
				return "already-liked";
			} else {
				userLikeValidation.setLikeDate(OzaiUtil.getCurrentDate());
				if (ozaiService.saveUserLike(userLikeValidation)) {
					ozaiService.updateEntryPoints(userLikeValidation.getEntry_id(), 1);
					return "liked";
				}
			}

		} else 
			return "nouser";
		return null;

	}
	
	@RequestMapping(value = "/smartlife/entries/{option}", method = RequestMethod.GET)
	public ModelAndView entries(@PathVariable String option) {
		ModelAndView modelAndView = new ModelAndView();
		List<Talent> entries = miscService.getEntriesByOption(option);
		List<String> organizations = ozaiService.getOrganizationsList();
		modelAndView.addObject("organizations", organizations);
		modelAndView.addObject("entries", entries);
		modelAndView.addObject("choice", option);
		modelAndView.setViewName("/smartlife/entries");
		return modelAndView;
	}
	
	@RequestMapping(value = "/smartlife/entriesbycamp/{camp}", method = RequestMethod.GET)
	public ModelAndView entriesByCamp(@PathVariable String camp) {
		ModelAndView modelAndView = new ModelAndView();
		List<Talent> entries = ozaiService.getAllTalentEntriesByClient(camp);
		modelAndView.addObject("entries", entries);
		modelAndView.addObject("camp", camp);
		modelAndView.setViewName("/smartlife/camp-entries");
		return modelAndView;
	}
	
	@RequestMapping(value = "/smartlife/selectEntryWithComment/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String selectEntryWithComment(@PathVariable("id") int id, @RequestParam("comment") String comment,
			 HttpSession session) {
		Admin admin = (Admin) session.getAttribute("SmartAdmin");
		if (miscService.selectEntry(id, comment, admin.getUsername())) {
			return "Success";
		} else {
			return "Filed";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/smartlife/rejectEntry/{id}", method = RequestMethod.GET)
	public String rejectEntry(@PathVariable int id, HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("SmartAdmin");
		if (miscService.rejectEntry(id, admin.getUsername())) {
			return "Success";
		} else {
			return "Filed";
		}

	}

	@RequestMapping(value = "/smartlife/index", method = RequestMethod.GET)
	public ModelAndView tikaanaAdminIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/smartlife/index");
		return modelAndView;
	}

	@RequestMapping(value = "/validateSmartLogin", method = RequestMethod.GET)
	public ModelAndView validateLogin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Admin userData = (Admin) session.getAttribute("SmartAdmin");
		if (userData != null) {
			modelAndView.setViewName("redirect:/smartlife");
			//return new ModelAndView("/admin/index");
		} else
			modelAndView.setViewName("redirect:/smartlife");
			//return new ModelAndView("/adminlogin", "admin", new Admin());
		return modelAndView;
	}

	@RequestMapping(value = "/validateSmartLogin", method = RequestMethod.POST)
	public ModelAndView validate(@ModelAttribute("admin") Admin user, BindingResult result,
			RedirectAttributes redirectAttributes, HttpSession session,
			@RequestParam(value = "next", required = false) String next) {

		if (user.getUsername() != null && !user.getUsername().isEmpty() && user.getPassword() != null
				&& !user.getPassword().isEmpty()) {
			ModelAndView modelAndView = new ModelAndView();
			String username = user.getUsername();
			String password = user.getPassword();
			System.out.println("in submit:"+username+"password:"+password);
			Admin userData = adminService.validateUser(username, password);

			if (userData != null) {

				session.setAttribute("SmartAdmin", userData);
				if (next != null && !next.isEmpty()) {
					modelAndView.setViewName("redirect:" + next);
				} else {
					modelAndView.setViewName("redirect:/smartlife");
				}
				return modelAndView;

			} else {
				modelAndView.getModel().put("AuthError", "Invalid UserName / Password");
				modelAndView.setViewName("/smartlife/login");
				return modelAndView;
			}
		} else {
			return new ModelAndView("/smartlife/login");
		}

	}

	@RequestMapping(value = "/smartlogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("SmartAdmin");
		session.removeAttribute("SmartAdmin");
		session.invalidate();
		return new ModelAndView("/smartlife/login", "admin", new Admin());
	}

}

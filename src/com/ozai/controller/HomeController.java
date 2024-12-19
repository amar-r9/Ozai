package com.ozai.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.ozai.model.B2C_Rents;
import com.ozai.model.BlogArticle;
import com.ozai.model.ClientUser;
import com.ozai.model.Contact;
import com.ozai.model.DailyUpdates;
import com.ozai.model.Delivery;
import com.ozai.model.Enquiry;
import com.ozai.model.FIND_BED;
import com.ozai.model.INVITE_FRIEND;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Referral;
import com.ozai.model.Rooms;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.User;
import com.ozai.service.ArticleService;
import com.ozai.service.PropertyService;
import com.ozai.service.OzaiService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
import com.ozai.model.TRYITFIRST;


@Controller
public class HomeController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OzaiService ozaiService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	PropertyService propertyService;

	@RequestMapping(value = "/landing", method = RequestMethod.GET)
	public String home(ModelMap map) {
		return "/landing";
	}

	@RequestMapping(value = "/landing/{type}", method = RequestMethod.GET)
	public ModelAndView loading(ModelMap map, @PathVariable String type) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("type", type);
		modelAndView.setViewName("/landing");
		return modelAndView;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap map) {
		return "/jsp/index";
	}
	
	@RequestMapping(value = "/support", method = RequestMethod.GET)
	public String support(ModelMap map) {
		return "/support";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(ModelMap map) {
		return "/about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(ModelMap map) {
		return "/contact";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save-contact", method = RequestMethod.POST)
	public String saveContact(@ModelAttribute Contact contact,
			HttpSession session) {
			
		boolean save = ozaiService.saveContact(contact);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		//return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/save-enquiry", method = RequestMethod.POST)
	public String saveEmail(@ModelAttribute Enquiry enquiry,
			HttpSession session) {
			
		boolean save = ozaiService.saveEnquiry(enquiry);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		//return null;
	}
	
	@RequestMapping(value = "/services/vendor-register", method = RequestMethod.GET)
	public String vendorRegister(ModelMap map) {
		return "/admin/services/vendor-register";
	}
	
	@RequestMapping(value = "/privacy-policy", method = RequestMethod.GET)
	public String privacyPolicy(ModelMap map) {
		return "/privacy-policy";
	}
	
	@RequestMapping(value = "/mobile/user/shop", method = RequestMethod.GET)
	public String shop(ModelMap map) {
		//String time= null;
		return "/mobile/shop";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/addUserInterest", method = RequestMethod.POST)
	public String addUserInterest(HttpSession session) {
		User user = (User) session.getAttribute("User");
		TRYITFIRST tryitfirst = new TRYITFIRST();
		tryitfirst.setMobile(user.getMobile());
		tryitfirst.setName(user.getName());
		tryitfirst.setDate(OzaiUtil.getCurrentDate());
		boolean save = ozaiService.addMobileInterest(tryitfirst);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/checkAlreadyAddedInterest", method = RequestMethod.GET)
	public String checkAlreadyAddedInterest(HttpSession session) {
		User user = (User) session.getAttribute("User");
		boolean save = ozaiService.isUserInterestedInTryItFirst(user.getMobile());
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/mobile/user/refer-friend", method = RequestMethod.GET)
	public ModelAndView referFriend(ModelMap map, HttpSession session) {
		//User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/mobile/refer-friend");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/referAFriend", method = RequestMethod.POST)
	public String referAFriend(@ModelAttribute Referral refer,
			HttpSession session) {
		User user = (User) session.getAttribute("User");
		refer.setReferred_user(user.getId());
		boolean save = ozaiService.saveReferral(refer);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@RequestMapping(value = "/admin/invite-friend", method = RequestMethod.GET)
	public ModelAndView inviteFriend(ModelMap map, HttpSession session) {
		//User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/admin/invite-friend");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inviteAFriend", method = RequestMethod.POST)
	public String referAFriend(@ModelAttribute INVITE_FRIEND refer,
			HttpSession session) {
		User user = (User) session.getAttribute("User");
		refer.setReferred_user(user.getId());
		boolean save = ozaiService.saveInvitation(refer);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@RequestMapping(value = "/mobile/findabed", method = RequestMethod.GET)
	public ModelAndView findABed(ModelMap map, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/mobile/find-bed");
		return modelAndView;
	}
	
	@RequestMapping(value = "/blue-collar-form", method = RequestMethod.GET)
	public ModelAndView blueCollarForm(ModelMap map, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/blue-collar-form");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveBedRequirment", method = RequestMethod.POST)
	public String saveBedRequirement(@ModelAttribute FIND_BED find,
			HttpSession session) {
		User user = (User) session.getAttribute("User");
		boolean save = ozaiService.saveBedRequest(find);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@RequestMapping(value = "/mobile/user/service-request", method = RequestMethod.GET)
	public ModelAndView serviceRequest(ModelMap map, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/mobile/service-request");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/saveServiceRequest", method = RequestMethod.POST)
	public ModelAndView saveServiceRequest(
			@ModelAttribute("request") Service_Request request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		boolean id = userService.saveServiceRequest(request);
		if (id) {
			modelAndView.addObject("success", true);
			modelAndView.setViewName("/mobile/service-request");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/service-request");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/badminton/rules", method = RequestMethod.GET)
	public ModelAndView badmintonRules(ModelMap map, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/mobile/badminton-rules");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/addDelivery", method = RequestMethod.POST)
	public String saveDelivery(@ModelAttribute Delivery delivery, HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		//delivery.setClient_code(admin.getClient_code());
		boolean save = ozaiService.addDeliveryUpdate(delivery);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}

}

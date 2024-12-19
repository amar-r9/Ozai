package com.ozai.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.List;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.model.B2B_Details;
import com.ozai.model.ClientUser;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.PG;
import com.ozai.model.Staff;
import com.ozai.model.User;
import com.ozai.service.ClientService;
import com.ozai.service.MiscService;
import com.ozai.service.PropertyService;

@RestController
public class MiscController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private MiscService miscService;
	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private ClientService clientService;
	
	@RequestMapping(value = "/lct/chat/gynic-list", method = RequestMethod.GET)
	public ModelAndView gynic(HttpSession session){
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("type", "Gynaecologist");
		List<ConsultDoctor> messages = miscService.getGynicMessages("Gynaecologist", 0, 0);
		modelAndView.addObject("messages", messages);
		
		modelAndView.setViewName("/lct/chat/list");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/chat/psychic-list", method = RequestMethod.GET)
	public ModelAndView psycic(HttpSession session){
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("type", "Psychiatrist");
		List<ConsultDoctor> messages = miscService.getPsychicMessages("Psychiatrist", 0, 0);
		modelAndView.addObject("messages", messages);
		modelAndView.setViewName("/lct/chat/list");
		
		return modelAndView;
	}
    
    @RequestMapping(value = "/lct/chat/messages/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView messageP(@PathVariable String type, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("type", type);
		modelAndView.addObject("id", id);
		List<ConsultDoctor> messages = miscService.getUserMessages(type, id);
		modelAndView.addObject("messages", messages);
		modelAndView.setViewName("/lct/chat/message");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/doctor/{type}", method = RequestMethod.GET)
	public ModelAndView messageG(@PathVariable String type, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("User");
		List<ConsultDoctor> messages = miscService.getUserMessages(type, user.getId());
		modelAndView.addObject("messages", messages);
		modelAndView.addObject("type", type);
		modelAndView.setViewName("/mobile/doctor/message");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chat/{type}/getMessages/{id}", method = RequestMethod.GET)
	public String getAllUserPaints(@PathVariable String type, @PathVariable int id, HttpSession session) {
		
		List<ConsultDoctor> entry = miscService .getRecentMessages(id, type, 0, 0);
		StringBuffer paintsString = new StringBuffer();
		if (entry.isEmpty()) return
				" "; 
		else {
			for (ConsultDoctor mst : entry) {
				if ("User".equalsIgnoreCase(mst.getSent_by())) {
					Timestamp stamp2 = mst.getMessage_time();
					Date date2 = new Date(stamp2.getTime());
					Time time2 = new Time(stamp2.getTime());
					DateFormat f2 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t2 = new SimpleDateFormat("hh:mm a");
					String d2 = f2.format(date2);
					String tm2 = t2.format(time2);
					paintsString
					.append("<li class=\"odd mt-1\">" + 
							"<div class=\"chat-content ps-3 d-inline-block text-end\">" + 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							" message fw-normal fs-3 bg-light-inverse\">"
							+mst.getMessage()+"</div>" + 
							"<br />" + 
							"</div>" + 
							"<div class=\"chat-time d-inline-block " + 
							" text-end fs-2 font-weight-medium\">" 
							+tm2+"</div>" + 
							"</li>");
				} else {
					Timestamp stamp1 = mst.getMessage_time();
					Date date1 = new Date(stamp1.getTime());
					Time time1 = new Time(stamp1.getTime());
					DateFormat f1 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t1 = new SimpleDateFormat("hh:mm a");
					String d1 = f1.format(date1);
					String tm1 = t1.format(time1);
					paintsString
					.append("<li class=\"mt-1\">" + 
							"<div class=\"chat-img d-inline-block align-top\" style=\"width: 0px;\">" + 
							"</div>" + 
							"<div class=\"chat-content ps-3 d-inline-block\">" + 
							"<h5 class=\"text-muted fs-3 font-weight-medium\">"+type+"</h5>"+ 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							" message fw-normal fs-3 bg-light-info\">"
							+mst.getMessage()+"</div>"+ 
							"</div>" + 
							"<div class=\"chat-time d-inline-block text-end " + 
							" fs-2 font-weight-medium\">"
							+tm1+"</div>" + 
							"</li>"); 
				}
			}
			return paintsString.toString(); 
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/chat/{type}/getMessages/{id}", method = RequestMethod.GET)
	public String getChat(@PathVariable String type, @PathVariable int id, HttpSession session) {
		
		List<ConsultDoctor> entry = miscService .getRecentMessages(id, type, 0, 0);
		StringBuffer paintsString = new StringBuffer();
		if (entry.isEmpty()) return
				" "; 
		else {
			for (ConsultDoctor mst : entry) {
				if ("User".equalsIgnoreCase(mst.getSent_by())) {
					Timestamp stamp2 = mst.getMessage_time();
					Date date2 = new Date(stamp2.getTime());
					Time time2 = new Time(stamp2.getTime());
					DateFormat f2 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t2 = new SimpleDateFormat("hh:mm a");
					String d2 = f2.format(date2);
					String tm2 = t2.format(time2);
					paintsString
					.append("<li class=\"mt-1\">" + 
							"<div class=\"chat-img d-inline-block align-top\">" + 
							"<img src=\"https://www.ozailiving.com/profile-user/image/"+mst.getDetails().getUser_id()+"\"" + 
							" onerror=\"this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'\"" + 
							" alt=\"user\" class=\"rounded-circle\" />" + 
							"</div>" + 
							"<div class=\"chat-content ps-3 d-inline-block\">" + 
							"<h5 class=\"text-muted fs-3 font-weight-medium\">"+mst.getDetails().getUser().getName()+"</h5>" + 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							" message fw-normal fs-3 bg-light-info\">"
							+mst.getMessage()+"</div>" + 
							"</div>" + 
							"<div class=\"chat-time d-inline-block text-end " + 
							" fs-2 font-weight-medium\">"
							+tm2+"</div>" + 
							"</li>");
				} else {
					Timestamp stamp1 = mst.getMessage_time();
					Date date1 = new Date(stamp1.getTime());
					Time time1 = new Time(stamp1.getTime());
					DateFormat f1 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t1 = new SimpleDateFormat("hh:mm a");
					String d1 = f1.format(date1);
					String tm1 = t1.format(time1);
					paintsString
					.append("<li class=\"odd mt-1\">" + 
							"<div class=\"chat-content ps-3 d-inline-block text-end\">" + 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							" message fw-normal fs-3 bg-light-inverse\">"
							+mst.getMessage()+"</div>" + 
							"<br />" + 
							"</div>" + 
							"<div class=\"chat-time d-inline-block " + 
							" text-end fs-2 font-weight-medium\">"
							+tm1+"</div>" + 
							"</li>"); 
				}
			}
			return paintsString.toString(); 
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/chat/{type}/getLatestMessage/{id}", method = RequestMethod.GET)
	public String getLAtestMessage(@PathVariable String type, @PathVariable int id, HttpSession session) {
		
		String entry = miscService.getRecentMessage(type, id);
		
		return entry.toString(); 
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/{type}/send-message", method = {RequestMethod.GET, RequestMethod.POST})
	public String saveUserPost(@ModelAttribute ConsultDoctor message, @PathVariable String type,
			HttpSession session) {

		Timestamp time = Timestamp.from(Instant.now());
		message.setMessage_time(time);
		message.setSent_by(type);
		boolean save = miscService.saveMessage(message);
		return save ? "success" : "error";
	}
	
	@ResponseBody
    @RequestMapping(value = "/mobile/send-message", method = {RequestMethod.GET, RequestMethod.POST})
    public String saveUserMessage(@ModelAttribute ConsultDoctor consult,
        HttpSession session) {
        System.out.println("Controller: "+consult.getMessage());
        Timestamp time = Timestamp.from(Instant.now());
        consult.setMessage_time(time);
        consult.setSent_by("User");
        boolean save = miscService.saveMessage(consult);
        return save ? "success" : "error";
    }
	
	@RequestMapping(value = "/mobile/user/residents/list", method = RequestMethod.GET)
	public ModelAndView allB2BResidentsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		if (details != null) {
			List<PG> properties = propertyService.getClientPropertiesList(details.getClient_code());
			List<B2B_Details> tenants = clientService.getActiveResidentsByClient(details.getClient_code());
			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("properties", properties);			
			modelAndView.setViewName("/mobile/residents/list");
		} else {
			modelAndView.setViewName("redirect:/mobile");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/mobile/residents/by-property", method = RequestMethod.POST)
	public ModelAndView allB2BResidentsList(@RequestParam int property_id, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		if (details != null) {
			List<PG> properties = propertyService.getClientPropertiesList(details.getClient_code());
			List<B2B_Details> tenants = clientService.getActiveResidentsByProperty(property_id);
			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("properties", properties);
			modelAndView.setViewName("/mobile/residents/list");
		} else {
			modelAndView.setViewName("/redirect:/mobile");
		}
		return modelAndView;

	}
	
	@RequestMapping(value = "/mobile/user/staff/list", method = RequestMethod.GET)
	public ModelAndView staff(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		if (details != null) {
			List<PG> properties = propertyService.getClientPropertiesList(details.getClient_code());
			List<Staff> staff = clientService.getStaffListByClient(details.getClient_code());
			modelAndView.addObject("staff", staff);
			modelAndView.addObject("properties", properties);			
			modelAndView.setViewName("/mobile/residents/staff-list");
		} else {
			modelAndView.setViewName("redirect:/mobile");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/mobile/staff/by-property", method = RequestMethod.POST)
	public ModelAndView staffByProperty(@RequestParam int property_id, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		if (details != null) {
			List<PG> properties = propertyService.getClientPropertiesList(details.getClient_code());
			List<Staff> staff = clientService.getStaffListByProperty(property_id);
			modelAndView.addObject("staff", staff);
			modelAndView.addObject("properties", properties);
			modelAndView.setViewName("/mobile/residents/staff-list");
		} else {
			modelAndView.setViewName("/redirect:/mobile");
		}
		return modelAndView;

	}
	
	
	@RequestMapping(value = "/lct/staff/add", method = RequestMethod.GET)
	public ModelAndView addClientUserRoleToClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(adminData.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/staff/add");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/addStaff", method = {RequestMethod.GET, RequestMethod.POST})
	public String addStaff(@ModelAttribute("staff") Staff staff, HttpSession session) {

		if(clientService.addStaff(staff)) {
			return "success";
		} else {
			return "failed";
		}
	}
	
	@RequestMapping(value = "/lct/staff/list", method = RequestMethod.GET)
	public ModelAndView allB2BClientUserListForClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");

		if (adminData != null) {

			List<Staff> staff = clientService.getStaffListByClient(adminData.getClient_code());

			modelAndView.addObject("staff", staff);

			modelAndView.setViewName("/lct/staff/list");

		} else {
			modelAndView.setViewName("/lct/login");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/sos", method = RequestMethod.GET)
	public ModelAndView sosCall(HttpSession session) {
		User user = (User) session.getAttribute("User");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		sendSMS(user.getName(), "9032144941,7680075651,9701320902", "SOS");
		modelAndView.setViewName("/mobile/sos");
		return modelAndView;
	}
	
	public boolean sendSMS(String name, String mobile, String password) {

		System.out.println("In sms 1");
		try {
			String message = "Dear "+name+", Thanks for registering on MySuperBrain. "+password+" is your otp to verify your account. App link: "+password+"  Thanks - Team MSB";
			String requestUrl = "https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?" + "APIKEY=" + "ekp4CG4fkeu"
					+ "&MobileNo=" + mobile + "&SenderID=" + "MSBRAN" + "&Message="
					+ URLEncoder.encode(message, "UTF-8") + "&ServiceName=" + "TEMPLATE_BASED&DLTTemplateID=1107166254068375675";		
	
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
}

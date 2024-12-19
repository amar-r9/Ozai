package com.ozai.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Badges;
import com.ozai.model.Badminton_league;
import com.ozai.model.BlogArticle;
import com.ozai.model.ClientUser;
import com.ozai.model.Enquiry;
import com.ozai.model.Event;
import com.ozai.model.Insurance;
import com.ozai.model.PG;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.User;
import com.ozai.model.UserEmotion;
import com.ozai.model.VehicleInsurance;
import com.ozai.model.VirtualDoctor;
import com.ozai.service.AdminService;
import com.ozai.service.ArticleService;
import com.ozai.service.B2BService;
import com.ozai.service.B2CService;
import com.ozai.service.ClientService;
import com.ozai.service.FCMService;
import com.ozai.service.MailService;
import com.ozai.service.PropertyService;
import com.ozai.service.OzaiService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
import com.restfb.types.Hours;
import com.ozai.model.Loan;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.Notice;
import com.ozai.model.Talent;
import com.ozai.model.Ticket;
import com.ozai.model.Transport;
import com.ozai.model.FlightTickets;
import com.ozai.model.GateRequests;
import com.ozai.beans.Notification;
import com.ozai.beans.FCMMessageBean;


@Controller
public class UserController {
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	UserService userService;
	
	@Autowired
	OzaiService ozaiService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ClientService clientService;
	
	@Autowired
	PropertyService propertyService;
	
	@Autowired
	FCMService fcmService;
	
	@Autowired
	B2CService b2cService;
	
	@Autowired
	MailService mailService;
	
	@ResponseBody
	@RequestMapping(value = "/restoreUserSession/{user}", method = {RequestMethod.GET, RequestMethod.POST})
	public String restoreSession(@RequestParam String next, @PathVariable String user,
			HttpSession session) {

		User userD = userService.getUserDetails(user);
		if(userD!=null) {
			session.setAttribute("User", userD);
			return "success";
		} else {
			return "failed";
		}
		
	}
	
	@RequestMapping(value = "/mobile/user/delete-account", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteUser(HttpSession session)
			throws IOException {

		User userData = (User) session.getAttribute("User");
		userData.setActive(0);
		if (userService.updateUser(userData)) {
			session.removeAttribute("User");
			return new ModelAndView("redirect:/mobile/signin");
		} else {
			return new ModelAndView("redirect:/mobile/signin");
		}

	}
	

	private static final String FIREBASE_SERVER_KEY = "AAAAON8Y7xs:APA91bFPLUwPv9a_PdrYlZhnMT9yyAd44YhTBVQjf5uRMW02eoQVSi7pJ3KXhaGqbQxYrb3_Y7jOCkCi5W0RFBqB32VTlXNgk9AhyBzCAFvPyrEhj810bs7AAb7n009O0M-NjpTtPPZO";
	
//	private void uploadFile(String filename, MultipartFile image,
//			String type) {
//		File image_path = new File(servletContext.getRealPath("/")
//				+ "uploaded_files/DOC/" + type + "/" + filename);
//		image_path.getParentFile().mkdirs();
//		try {
//			FileUtils.writeByteArrayToFile(image_path, image.getBytes());
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
	
	private void uploadFile(String filename, MultipartFile file, String type) {
	    File fileDirectory = new File(servletContext.getRealPath("/") + "uploaded_files/DOC/" + type);
	    fileDirectory.mkdirs(); // Ensure directory exists

	    File filePath = new File(fileDirectory.getAbsolutePath() + "/" + filename);

	    try {
	        // Write the bytes of the file to the specified file path
	        FileUtils.writeByteArrayToFile(filePath, file.getBytes());
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

	
	@RequestMapping(value = "/profile-user/image/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
	@ResponseBody
	public byte[] getUserProfileImage(@PathVariable int id) {

		return userService.getUserDetailsById(id).getImage();

	}
	
	public boolean sendSMS(String name, String mobile, String password) {

		System.out.println("In sms 1");
		try {
			String message = "Dear "+name+", Thanks for registering on Ozai App. Your password is "+password+". Please don't share your login credentials with anyone else." + 
					"- Ozai";
			String requestUrl = "https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?" + "APIKEY=" + "zkpwwwufKbl"
					+ "&MobileNo=" + mobile + "&SenderID=" + "OZAIPL" + "&Message="
					+ URLEncoder.encode(message, "UTF-8") + "&ServiceName=" + "TEMPLATE_BASED&DLTTemplateID=1207168310814512421";		
	
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
	
	/* Visitor/Non Resident User controller Starts */
	
	@RequestMapping(value = "/mobile", method = RequestMethod.GET)
	public ModelAndView mobileIndex(ModelMap map, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		
		User userData = (User) session.getAttribute("User");
		modelAndView.addObject("userData", userData);

		if(userData!=null) {
			if(userData.getResident_type().equalsIgnoreCase("B2B")) {
				B2B_Details details = clientService.getResidentDetails(userData.getId());
				List<Notice> notifications = clientService.getNoticeByClient(details.getClient_code(), 2);
				modelAndView.addObject("notifications", notifications);
				//List<GateRequests> requests = clientService.getUserGateRequests(userData.getId(), "Pending", 0);
				//modelAndView.addObject("requests", requests);
				
			} else if(userData.getResident_type().equalsIgnoreCase("B2C")) {
				B2C_Details details = adminService.getB2CResidentDetails(userData.getId());
				List<Notice> notifications = adminService.getNoticeByAdmin(details.getAdmin_id(), 2);
				List<PG> pgs = propertyService.getActivePropertyListOfAdmin(details.getAdmin_id(), 2);
				modelAndView.addObject("pgs", pgs);
				modelAndView.addObject("notifications", notifications);
			}
			modelAndView.setViewName("/mobile/index");
		} else {
			modelAndView.setViewName("/mobile/signin");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/signup", method = RequestMethod.GET)
	public String register(ModelMap map) {
		return "/mobile/signup";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/CheckUserMobile", method = RequestMethod.POST)
	public String checkUserMobile(@RequestParam String mobile,
			HttpSession session) {
		System.out.println("Mobile : "+mobile);
		if(userService.isMobileExist(mobile)){
			System.out.println("Exist");
			return "success";
		}else{
			return "fail";
		}
	}

	@RequestMapping(value = "/doUserRegister", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user, BindingResult result,
			HttpSession session) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		//Random rand = new Random();	
		//int otp = rand.nextInt(900000) + 100000;
		//String password = String.valueOf(otp);
		//System.out.println("Password" +password);
		user.setUsername(user.getMobile());
		user.setActive(1);
		//user.setPassword(password);
			
		if(userService.isMobileExist(user.getMobile())) {
				modelAndView.addObject("exist", true);
				modelAndView.setViewName("/mobile/signin");
			} else {
				
				Integer isStudentSaved = userService.saveUser(user);
				System.out.println("student saved");
				if (isStudentSaved!=0) {
					String subject = "Email Verification";
					String body = OzaiUtil.buildOTPMail(user.getName(), user.getEmail(), user.getPassword());
					mailService.sendMail(subject, body, user.getEmail(), false, "Ozai Living");
					sendSMS(user.getName(), user.getMobile(), user.getPassword());
					//modelAndView.addObject("mobile", user.getMobile());
					//modelAndView.addObject("otp", otp);
					modelAndView.addObject("success", true);
					modelAndView.setViewName("/mobile/signin");
					//modelAndView.setViewName("/mobile/welcome");
					// else
					// return new ModelAndView(
					// "redirect:/others/register-landing?success=false");
				} else {
					modelAndView.setViewName("/mobile/signup");
				}
			} 	
			return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/update-password", method = RequestMethod.POST)
	public ModelAndView validateUserOTP(HttpSession session, @RequestParam("password") String password,
			@RequestParam("mobile") String mobile) {
		
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserDetails(mobile);
		user.setPassword(password);
		boolean save = userService.updateUser(user);
		if(save) {
			modelAndView.addObject("success", true);
			modelAndView.setViewName("/mobile/signin");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/signin");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/signin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("userData", userData);
		
		if (userData != null)
			modelAndView.setViewName("redirect:/mobile");
		else
			modelAndView.setViewName("/mobile/signin");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/validateUserLogin", method = RequestMethod.GET)
	public ModelAndView validateLogin(HttpSession session) {

		User userData = (User) session.getAttribute("User");
		if (userData != null) {
			//boolean save = tikaanaService.increaseLoginCount(userData.getUsername());
			return new ModelAndView("redirect:/mobile");
		} else
			return new ModelAndView("/mobile/signin", "user", new User());

	}

	@RequestMapping(value = "/validateUserLogin", method = RequestMethod.POST)
	public ModelAndView validate(@ModelAttribute("user") User user,
			BindingResult result, RedirectAttributes redirectAttributes,
			HttpSession session,
			@RequestParam(value = "next", required = false) String next) {
		// userValidator.validate(user, result);

		if (user.getUsername() != null && !user.getUsername().isEmpty()
				&& user.getPassword() != null && !user.getPassword().isEmpty()) {
			ModelAndView modelAndView = new ModelAndView();
			String username = user.getUsername();
			String password = user.getPassword();
			System.out.println("in submit" + username +"password "+password);
			User userData = userService.validateUserDetails(username, password);

			if (userData != null) {
					modelAndView.addObject("sessionUser", userData.getUsername());
					session.setAttribute("User", userData);
					//boolean save = tikaanaService.increaseLoginCount(userData.getUsername());
					if (next != null && !next.isEmpty()) {
							modelAndView.setViewName("redirect:" + next);
					} else {
							modelAndView.setViewName("redirect:/mobile");
					}
						return modelAndView;
				
			} else {
				modelAndView.getModel().put("AuthError",
						"Invalid UserName / Password");
				modelAndView.setViewName("/mobile/signin");
				return modelAndView;
			}
		} else {
			return new ModelAndView("/mobile/signin");
		}

	}
	
	@RequestMapping(value = "/mobile/forgot", method = RequestMethod.GET)
	public String forgot(ModelMap map) {
		return "/mobile/forgot";
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/send-password", method = RequestMethod.POST)
	public ModelAndView sendUserPassword(HttpSession session,
			@RequestParam("phone") String phone) {
		
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserDetails(phone);
		//user.setPassword(password);
		if(user!=null) {
			sendSMS(user.getName(), user.getMobile(), user.getPassword());
				modelAndView.addObject("phone", user.getMobile());
				modelAndView.addObject("otp", user.getPassword());
				//modelAndView.addObject("success", true);
				modelAndView.setViewName("/mobile/signin");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/mobile/signin");
			
		}
	
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/profile",method=RequestMethod.GET)
	public ModelAndView showTicket(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		if(userData.getResident_type().equalsIgnoreCase("B2B")) {
			B2B_Details details = clientService.getResidentDetails(userData.getId());
			modelAndView.addObject("details", details);
		} else if(userData.getResident_type().equalsIgnoreCase("B2C")) {
			B2C_Details details = adminService.getB2CResidentDetails(userData.getId());
			modelAndView.addObject("details", details);
		}
		
		if(b2cService.isUserUnderNoticePeriod(userData.getId())) {
			modelAndView.addObject("underNotice", true);
		}
		List<Badges> badges = userService.getUserBadges(userData.getId(), 3);
		modelAndView.addObject("badges", badges);
		
		Date vacateDate = OzaiUtil.getVacateNoticeDt(15);
		System.out.println("After 15 days:"+vacateDate);
		modelAndView.addObject("vacateDate", vacateDate);
		
		modelAndView.setViewName("/mobile/details");
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/details",method=RequestMethod.GET)
	public ModelAndView details(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User user = (User) session.getAttribute("User");
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/mobile/stay");
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/stay",method=RequestMethod.GET)
	public ModelAndView profile(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		User user = userService.getUserDetailsById(userData.getId());
		if(userData.getResident_type().equalsIgnoreCase("B2B")) {
			B2B_Details details = clientService.getResidentDetails(userData.getId());
			modelAndView.addObject("details", details);
		} else if(userData.getResident_type().equalsIgnoreCase("B2C")) {
			B2C_Details details = adminService.getB2CResidentDetails(userData.getId());
			modelAndView.addObject("details", details);
		}
		List<Badges> badges = userService.getUserBadges(user.getId(), 3);
		modelAndView.addObject("badges", badges);
		
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/mobile/profile");
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/badges",method=RequestMethod.GET)
	public ModelAndView badges(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		User user = userService.getUserDetailsById(userData.getId());
		
		List<Badges> badges = userService.getUserBadges(user.getId(), 3);
		modelAndView.addObject("badges", badges);
		
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/mobile/badges");
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/edit",method=RequestMethod.GET)
	public ModelAndView editUser(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		User user = userService.getUserDetailsById(userData.getId());
		modelAndView.addObject("user", user);
		
		modelAndView.setViewName("/mobile/edit");
		return modelAndView;
	}

	
	@RequestMapping(value = "/mobile/user/update-profile-picture", method = RequestMethod.POST)
	public ModelAndView updateProfile(
			@RequestParam(value = "photo", required = false) MultipartFile photo,
			HttpSession session) throws IOException {
		User userData = (User) session.getAttribute("User");
		User user = userService.getUserDetailsById(userData.getId());
		byte[] image = IOUtils.toByteArray(photo.getInputStream());
		user.setImage(image);
		if (userService.updateUser(user)) {
			System.out.println("Pass 1 img");
			return new ModelAndView("redirect:/mobile/user/edit?success=true");
		} else {
			System.out.println("Pass 2 img");
			return new ModelAndView("redirect:/mobile/user/edit?success=false");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/mobile/update-user", method = RequestMethod.POST)
	public String editUSerP(@ModelAttribute User user,
			HttpSession session) {
			
		boolean save = userService.updateUser(user);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		//return null;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		
		User user = (User) session.getAttribute("User");
		//ozaiService.deleteToken(user.getUsername(), "User");
		session.removeAttribute("User");
		session.invalidate();
		//modelAndView.addObject("session", false);
		modelAndView.setViewName("/mobile/signin");
		return modelAndView;
	}
	
	/* Visitor/Non Resident User controller Starts */

	@RequestMapping(value = "/mobile/schedule-visit/{id}", method = RequestMethod.GET)
	public ModelAndView scheduleVisit(@PathVariable int id, HttpSession session) {

		ModelAndView modelAndView=new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		modelAndView.addObject("propertyDetails", propertyDetails);
			
		modelAndView.setViewName("/mobile/schedule-visit");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/scheduleVisit", method = RequestMethod.POST)
	public String applyLoanNow(@ModelAttribute ScheduleVisit visit,
			HttpSession session) {
		
		String visitTime = visit.getSchedule_time().toString();
		visit.setSchedule_time(visitTime);
				
		if(userService.isUserScheduledVisit(visit.getUser_id())) {
			return "exist";
		} else {
		boolean save = userService.scheduleVisit(visit);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		}
	}
	
	@RequestMapping(value = "/mobile/user/visits-list", method = RequestMethod.GET)
	public ModelAndView visits(ModelMap map, HttpSession session) {
		
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		Integer user_id = userData.getId();
		String userId = user_id.toString();
		List<ScheduleVisit> visits = userService.getVisitsList(userId);
		
		modelAndView.addObject("visits", visits);
		modelAndView.setViewName("/mobile/visits-list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/properties", method = RequestMethod.GET)
	public ModelAndView about(ModelMap map) {
		ModelAndView modelAndView=new ModelAndView();
		List<PG> pGs = propertyService.getPropertiesList();
		
		modelAndView.addObject("properties", pGs);
		modelAndView.setViewName("/mobile/properties");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/property/{id}", method = RequestMethod.GET)
	public ModelAndView about(ModelMap map, @PathVariable int id) {
		
		ModelAndView modelAndView=new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/mobile/property");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getLocations/{state}", method = RequestMethod.GET)
	public String getAllLocationsByState(@PathVariable String state, HttpSession session) {

		List<String> locations = propertyService.getLocationsByState(state);
		StringBuffer poemsString = new StringBuffer();
		poemsString.append("<option value=\"\">Location</option>");
		if (locations.isEmpty())
			return "No Locations Found";
		else {
			for (String poem : locations) {
				poemsString
						.append("<option value=\""+poem+"\">"+poem+"</option>");
			}
			return poemsString.toString();
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/getPropertiesByLocation/{location}", method = RequestMethod.GET)
	public String getAllPropertiesByLocation(@PathVariable String location, HttpSession session) {

		User user = (User) session.getAttribute("User");
		List<PG> properties =propertyService.getPropertiesByLocation(location);
		StringBuffer poemsString = new StringBuffer();
		if (properties.isEmpty())
			return "No Properties Found";
		else {
			for (PG poem : properties) {
				poemsString
						.append("<div class=\"card\">" + 
								"<div class=\"card-body\">" + 
								"<img class=\"card-img-top\"" + 
								"src=\"https://ozailiving.com/assets/img/"+poem.getId()+"/1.jpg\"" + 
								"onerror=\"this.onerror=null; this.src='https://tikaana.com/assets/img/alt-image.png'\"" + 
								"alt=\"Card image cap\">" + 
								"<div class=\"card-body\">" + 
								"<h5 class=\"card-title\">" + 
								"Tikaana "+poem.getName()+"");
								if(poem.getGender().equalsIgnoreCase("Male")) {
									poemsString.append("<span class=\"pull-right\"> <a" + 
											"class=\"btn btn-sm btn-danger\"" + 
											"style=\"border-radius: 50px; color: #FFF;\">"+poem.getGender()+"</a></span>");
								} else {
									poemsString.append("<span class=\"pull-right\"> <a" + 
											"class=\"btn btn-sm btn-warning\"" + 
											"style=\"border-radius: 50px;\">"+poem.getGender()+"</a></span>");
								}
								poemsString.append("</h5>" + 
								"<p class=\"card-text\">"+poem.getLocation()+","+poem.getCity()+"&nbsp;</p>" + 
								"<hr>" + 
								"<p class=\"pull-right\">");
								if(poem.getClient_type().equalsIgnoreCase("B2B")) {
									poemsString.append("<a href=\"#\" class=\"btn btn-info btn-sm\">View Property</a>");
								} else {
									poemsString.append("<a href=\"https://ozailiving.com/mobile/property/"+poem.getId()+"\"" + 
											"class=\"btn btn-info btn-sm\">View Property</a>");
								}
								poemsString.append("</p>" + 
								"</div>" + 
								"</div>" + 
								"</div>");
			}
			return poemsString.toString();
		}

	}
	
	@RequestMapping(value = "/mobile/user/apply-loan", method = RequestMethod.GET)
	public ModelAndView applyLoan(ModelMap map, HttpSession session) {
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		Integer userId = userData.getId();
		if(ozaiService.isUserAppliedForLoan(userId.toString())) {
			modelAndView.addObject("exist", true);
		}
		modelAndView.setViewName("/mobile/apply-loan");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/apply-loan", method = RequestMethod.POST)
	public String applyLoanNow(@ModelAttribute Loan loan,
			HttpSession session) {
		
		if(ozaiService.isUserAppliedForLoan(loan.getUser_id())) {
			return "exist";
		} else {
		boolean save = ozaiService.applyLoan(loan);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		}
	}
	
	@RequestMapping(value = "/mobile/user/tickets", method = RequestMethod.GET)
	public String ticket(ModelMap map) {
		return "/mobile/tickets";
	}
	
	@RequestMapping(value = "/mobile/user/tickets/create", method = RequestMethod.GET)
	public ModelAndView createTicket(HttpSession session) {
		System.out.println("1-create");
		User user = (User) session.getAttribute("User");
		ModelAndView modelAndView = new ModelAndView();
		if(user.getResident_type().equalsIgnoreCase("B2C")) {
			B2C_Details details = adminService.getB2CResidentDetails(user.getId());
			modelAndView.addObject("details", details);
		} else if(user.getResident_type().equalsIgnoreCase("B2B")) {
			B2B_Details details = clientService.getResidentDetails(user.getId());
			modelAndView.addObject("details", details);
		}
		System.out.println("2-create");
		modelAndView.setViewName("/mobile/tickets/create");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/add-ticket", method = RequestMethod.POST)
	public String saveTicket(@ModelAttribute Ticket ticket,
			HttpSession session) {
			
		boolean save = ozaiService.addTicket(ticket);
			if (save) {
				
				return "success";
			} else {
				return "error";
			}
		//return null;
	}
	
	
//	@RequestMapping(value = "/mobile/save-ticket", method = RequestMethod.POST)
//	public ModelAndView submitTicket(
//	        @ModelAttribute("ticket") Ticket ticket,
//	        HttpSession session,
//	        @RequestParam(value = "ticket_audio_file", required = false) MultipartFile ticket_audio_file,
//	        @RequestParam(value = "ticket_image_file", required = false) MultipartFile ticket_image_file,
//	        @RequestParam(value = "ticket_video_file", required = false) MultipartFile ticket_video_file) 
//	{
//		
//		
//
//	    User userData = (User) session.getAttribute("User");
//	    System.out.println("UserData: "+userData);
//	    ModelAndView modelAndView = new ModelAndView();
//
//	    // Check user resident type
//	    if(userData.getResident_type().equalsIgnoreCase("B2B")) {
//	        // If B2B, set admin_id to 0 and populate client details
//	        B2B_Details details = clientService.getResidentDetails(ticket.getUser_id());
//	        ticket.setAdmin_id(0);
//	        ticket.setClient_code(details.getClient_code());
//	        // Notify all client users about the ticket creation
//	        List<ClientUser> clients = clientService.getAllClientUsersByClientId(details.getClient_code());
//	        for (ClientUser clnt : clients) {
//	            fcmService.buildNotificationForClient(clnt.getUsername(), "Ticket Created", 
//	                    ""+userData.getName()+" has raised a ticket.", "https://ozailiving.com/lct/tickets/list");
//	        }
//	    } else if(userData.getResident_type().equalsIgnoreCase("B2C")) {
//	        // If B2C, set admin_id and client_code based on admin service
//	        B2C_Details details = adminService.getB2CResidentDetails(ticket.getAdmin_id());
//	        ticket.setAdmin_id(details.getAdmin_id());    
//	        ticket.setClient_code(details.getClient_code());
//	    }
//
//	    // Get the maximum ticket ID and generate a new code
//	    Integer maxId = ozaiService.getTicketMaxId();
//	    System.out.println("Max: "+maxId);
//	    int code = maxId.intValue() + 1; // 6300000
//
//	    
//	    MultipartFile ticket_file = null;
//	    // Check if ticket_audio_file is not null and contains a file
//	    if (ticket_audio_file != null && !ticket_audio_file.isEmpty()) 
//	    {
//	        ticket_file = ticket_audio_file;
//	    }
//	    // Check if ticket_image_file is not null and contains a file
//	    else if (ticket_image_file != null && !ticket_image_file.isEmpty()) 
//	    {
//	        ticket_file = ticket_image_file;
//	    }
//	    // Check if ticket_video_file is not null and contains a file
//	    else if (ticket_video_file != null && !ticket_video_file.isEmpty()) 
//	    {
//	        ticket_file = ticket_video_file;
//	    }
//	    
//	    // Check if the ticket file is not empty
//	    if(!ticket_file.isEmpty()) {
//	        // Generate a filename based on the ticket code and file extension
//	        String filename = code + "." + ticket_file.getOriginalFilename().split("\\.")[1];
//	        ticket.setFilename(filename);
//	        // Upload the file to the server
//	        uploadFile(filename, ticket_file, "TICKET");
//	    }
//
//	    // Save the ticket and retrieve the updated list of tickets
//	    boolean save = ozaiService.addTicket(ticket);
//	    List<Ticket> tickets = ozaiService.getUserTicketsList(ticket.getUser_id());
//	    modelAndView.addObject("tickets", tickets);
//
//	    // Set success flag and redirect accordingly
//	    if (save) {                
//	        modelAndView.addObject("success", true);
//	        modelAndView.setViewName("redirect:/mobile/user/tickets/list");
//	    } else {
//	        modelAndView.addObject("error", false);
//	        modelAndView.setViewName("redirect:/mobile/user/tickets/list");
//	    }
//	    System.out.println("2");
//	    return modelAndView;
//	}

	
	@RequestMapping(value = "/mobile/save-ticket", method = RequestMethod.POST)
	public ModelAndView submitTicket(
	        @ModelAttribute("ticket") Ticket ticket,
	        HttpSession session,
	        @RequestParam(value = "ticket_audio_file", required = false) MultipartFile ticket_audio_file,
	        @RequestParam(value = "ticket_image_file", required = false) MultipartFile ticket_image_file,
	        @RequestParam(value = "ticket_video_file", required = false) MultipartFile ticket_video_file) {

	    // Get user data from session
	    User userData = (User) session.getAttribute("User");
	    ModelAndView modelAndView = new ModelAndView();

	 // Set the user in the ticket object
	    ticket.setUser(userData);
	    
	    System.out.println("UserTicket: "+userData);
	    // Check user resident type
	    if(userData.getResident_type().equalsIgnoreCase("B2B")) {
	        // If B2B, set admin_id to 0 and populate client details
	        B2B_Details details = clientService.getResidentDetails(ticket.getUser_id());
	        ticket.setAdmin_id(0);
	        ticket.setClient_code(details.getClient_code());
	        
	    } else if(userData.getResident_type().equalsIgnoreCase("B2C")) {
	        // If B2C, set admin_id and client_code based on admin service
	        B2C_Details details = adminService.getB2CResidentDetails(ticket.getAdmin_id());
	        ticket.setAdmin_id(details.getAdmin_id());    
	        ticket.setClient_code(details.getClient_code());
	    }

	    // Get the maximum ticket ID and generate a new code
	    Integer maxId = ozaiService.getTicketMaxId();
	    System.out.println("Max: "+maxId);
	    int code = maxId.intValue() + 1; // 6300000

	    if(!ticket_audio_file.isEmpty() || !ticket_image_file.isEmpty() || !ticket_video_file.isEmpty() ) {
	    MultipartFile ticket_file = null;
	    // Check if ticket_audio_file is not null and contains a file
	    if (ticket_audio_file != null && !ticket_audio_file.isEmpty()) 
	    {
	        ticket_file = ticket_audio_file;
	    }
	    // Check if ticket_image_file is not null and contains a file
	    else if (ticket_image_file != null && !ticket_image_file.isEmpty()) 
	    {
	        ticket_file = ticket_image_file;
	    }
	    // Check if ticket_video_file is not null and contains a file
	    else if (ticket_video_file != null && !ticket_video_file.isEmpty()) 
	    {
	        ticket_file = ticket_video_file;
	    }
	    
	    // Check if the ticket file is not empty
	    if(!ticket_file.isEmpty()) {
	        String filename = code + "." + ticket_file.getOriginalFilename().split("\\.")[1];
	        ticket.setFilename(filename);
	        // Upload the file to the server
	        uploadFile(filename, ticket_file, "TICKET");
	    }
	}
	    // Save the ticket and retrieve the updated list of tickets
	    boolean save = ozaiService.addTicket(ticket);

	    if (save) {
		    List<String> usernames = ozaiService.getUsernamesByClientCode(ticket.getClient_code());
	    	for (String mst : usernames) {
	    		if(!mst.isEmpty() && mst != null) {
					fcmService.buildNotificationForResident(mst, "New Ticket Created", 
		                    "1 new ticket by " + ticket.getUser().getName() + ".", "https://www.ozailiving.com/lct/tickets/list", "LCT");
				}
	    	}
	    	/*
			 * for (String mst : tokens) { if(!mst.isEmpty() && mst != null) { RestTemplate
			 * restTemplate = new RestTemplate(); Gson gson = new Gson();
			 * 
			 * // Create the FCM message FCMMessageBean fcmMessageBean = new
			 * FCMMessageBean(); fcmMessageBean.setCollapse_key("type_a");
			 * 
			 * Notification notification = new Notification();
			 * notification.setTitle("New Ticket Created");
			 * notification.setBody("1 new ticket by " + ticket.getUser().getName() + ".");
			 * 
			 * fcmMessageBean.setNotification(notification); fcmMessageBean.setTo(mst);
			 * 
			 * // Create the data payload Map<String, String> data = new HashMap<>();
			 * data.put("key1", "value1"); data.put("key2", "value2"); data.put("link",
			 * "https://ozailiving.com/lct/tickets/list");
			 * 
			 * fcmMessageBean.setData(data);
			 * 
			 * // Convert the message to JSON String requestBody =
			 * gson.toJson(fcmMessageBean);
			 * 
			 * // Set the HTTP headers HttpHeaders httpHeaders = new HttpHeaders();
			 * httpHeaders.set("Authorization", "key=" + FIREBASE_SERVER_KEY);
			 * httpHeaders.set("Content-Type", "application/json");
			 * 
			 * // Send the POST request HttpEntity<String> entity = new
			 * HttpEntity<>(requestBody, httpHeaders); String endpoint =
			 * "https://fcm.googleapis.com/fcm/send";
			 * 
			 * ResponseEntity<String> response = restTemplate.postForEntity(endpoint,
			 * entity, String.class); System.out.println("Response: " + response.getBody());
			 * } }
			 */
	        modelAndView.addObject("success", true);
	        modelAndView.setViewName("redirect:/mobile/user/tickets/list");
	    } else {
	        modelAndView.addObject("success", false);
	        modelAndView.setViewName("redirect:/mobile/user/tickets/list");
	    }

	    return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/tickets/list",method=RequestMethod.GET)
	public ModelAndView showTickets(HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		User userData = (User) session.getAttribute("User");
		System.out.println("userData:"+userData);
		if(userData!=null) {
			List<Ticket> tickets=ozaiService.getUserTicketsList(userData.getId());
			modelAndView.addObject("tickets", tickets);
			modelAndView.setViewName("/mobile/tickets/list");
		} else {
			modelAndView.setViewName("/mobile/tickets/list");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/tickets/view/{id}",method=RequestMethod.GET)
	public ModelAndView showTicket(@PathVariable int id, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		Ticket ticket=ozaiService.getTicketDetails(id);
		modelAndView.addObject("ticket", ticket);
		
		if(ticket.getStatus().equalsIgnoreCase("Closed")) {
			String timeTaken =	OzaiUtil.getTimeTaken(ticket.getRaised_date(), ticket.getClosed_on());
			modelAndView.addObject("timeTaken", timeTaken);
		}
		
		modelAndView.setViewName("/mobile/tickets/view");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/support", method = RequestMethod.GET)
	public String support(ModelMap map) {
		return "/mobile/support";
	}
	
	/* Tickets controller ends */
	
	/* talents controller starts */
	
	@RequestMapping(value = "/mobile/user/talent/showcase", method = RequestMethod.GET)
	public String showcase(ModelMap map) {
		return "/mobile/talent/showcase";
	}
	
	@RequestMapping(value = "/mobile/user/talent/upload", method = RequestMethod.GET)
	public String schoolHOF(ModelMap map) {
		return "/mobile/talent/upload";
	}
	
	@RequestMapping(value = "/mobile/user/talent/saved", method = RequestMethod.GET)
	public String talentSaved(ModelMap map) {
		return "/mobile/talent/saved";
	}
	
	@RequestMapping(value = "/mobile/user/submit-talent", method = RequestMethod.POST)
	public ModelAndView submitEntry(
			@ModelAttribute("talent") Talent talent,
			HttpSession session,
			@RequestParam(value = "talent_file", required = true) MultipartFile talent_file)
			throws IOException {
		
			ModelAndView modelAndView = new ModelAndView();
			//String specific = "";
			//if(invoice.getSpecific()!=null) {
				//specific = invoice.getSpecific();
			//}
			String filename = talent.getName() + "_"
					+ talent.getMobile() + "."
					+ talent_file.getOriginalFilename().split("\\.")[1];
			talent.setSubmission_file_name(filename);
			Integer id = ozaiService.saveTalent(talent);

			if (id != 0) {
				uploadFile(filename, talent_file, "TALENT");
				modelAndView.addObject("success", true);
				modelAndView.setViewName("/mobile/talent/saved");
			} else {
				modelAndView.addObject("success", false);
				modelAndView.setViewName("/mobile/talent/upload");
			}
			return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/talent/entries", method = RequestMethod.GET)
	public ModelAndView allEntries(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<Talent> talents = ozaiService.getAllTalentEntries();
			
		modelAndView.addObject("talents", talents);
		
		modelAndView.setViewName("/mobile/talent/entries");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/mobile/user/talent/entry/{id}", method = RequestMethod.GET)
	public ModelAndView textZoneEntries(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		Talent talent = ozaiService.getTalentEntry(id);
		
		modelAndView.addObject("talent", talent);
		
		modelAndView.setViewName("/mobile/talent/entry");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/mobile/user/payment-history", method = RequestMethod.GET)
	public ModelAndView userPaymentHistory(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("User");
		List<B2C_Rents> rents = b2cService.getB2CUserRents(user.getId(), "Paid");
		modelAndView.addObject("rents", rents);
		modelAndView.setViewName("/mobile/payment-history");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/services", method = RequestMethod.GET)
	public ModelAndView residentServices() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/mobile/services");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/community", method = RequestMethod.GET)
	public ModelAndView community() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/mobile/community");
		return modelAndView;
	}

	@RequestMapping(value = "/mobile/user/events/list", method = RequestMethod.GET)
	public ModelAndView events(HttpSession session) {
		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		ModelAndView modelAndView = new ModelAndView();
		List<Event> events = ozaiService.getEventsByClient(details.getClient_code());
		modelAndView.addObject("events", events);
		Date currentDate = OzaiUtil.getCurrentDate();
		modelAndView.addObject("currentDate", currentDate);
		modelAndView.setViewName("/mobile/events/list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/badminton-league", method = RequestMethod.GET)
	public ModelAndView badmintonLeague(ModelMap map, HttpSession session) {
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		if(ozaiService.isUserRegisteredForBadminton("Resident", userData.getId())) {
			modelAndView.addObject("exist", true);
		}
		modelAndView.setViewName("/mobile/badminton-league");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/badminton-register", method = RequestMethod.POST)
	public String badmintonRegister(@ModelAttribute Badminton_league league,
			HttpSession session) {
		
		if(ozaiService.isUserRegisteredForBadminton(league.getUser_type(), league.getUser_id())) {
			return "exist";
		} else {
		boolean save = ozaiService.registerForBadminton(league);
			if (save) {
				return "success";
			} else {
				return "error";
			}
		}
	}
	
	@RequestMapping(value = "/mobile/user/trips-list", method = RequestMethod.GET)
	public ModelAndView trips(HttpSession session) {
		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		ModelAndView modelAndView = new ModelAndView();
		List<Transport> trips = clientService.getClientTripsList(details.getClient_code());
		modelAndView.addObject("trips", trips);
		modelAndView.setViewName("/mobile/events/trip-list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/trip/{id}", method = RequestMethod.GET)
	public ModelAndView trip(@PathVariable int id, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Transport trip = clientService.getTripDetails(id);
		modelAndView.addObject("trip", trip);
		modelAndView.setViewName("/mobile/events/trip");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/book-trip/{tripId}", method = RequestMethod.GET)
	public String bookTrip(@PathVariable int tripId,
			HttpSession session) {
		TRIP_BOOKINGS trip = new TRIP_BOOKINGS();
		User user = (User) session.getAttribute("User");
		B2B_Details details = clientService.getResidentDetails(user.getId());
		trip.setUser_id(user.getId());
		trip.setClient_code(details.getClient_code());
		trip.setStatus("Booked");
		trip.setTrip_id(tripId);
		if(ozaiService.isUserBookedThisTrip(tripId, trip.getUser_id())) {
			return "exist";
		} else {
		boolean save = ozaiService.bookThisTrip(trip);
			if (save) {
				ozaiService.updateAvailableSeats(tripId);
				return "success";
			} else {
				return "error";
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkWetherBooked/{tripId}/{userId}", method = RequestMethod.GET)
	public String applyLoanNow(@PathVariable int tripId, @PathVariable int userId,
			HttpSession session) {
				
		if(ozaiService.isUserBookedThisTrip(tripId, userId)) {
			return "yes";
		} else {
			return "no";
		}
	}
	
	@RequestMapping(value = "/mobile/user/notifications/list", method = RequestMethod.GET)
	public ModelAndView notifications(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("User");
		
		if(user.getResident_type().equalsIgnoreCase("B2B")) {
			B2B_Details details = clientService.getResidentDetails(user.getId());
			if (details != null) {
				List<Notice> notification = clientService.getNoticeByClient(details.getClient_code(), 0);
				modelAndView.addObject("notification", notification);
			}
		} else if(user.getResident_type().equalsIgnoreCase("B2C")) {
			B2C_Details details = adminService.getB2CResidentDetails(user.getId());
			if (details != null) {
				List<Notice> notification = adminService.getNoticeByAdmin(details.getAdmin_id(), 0);
				modelAndView.addObject("notification", notification);
			}
		}
		
		modelAndView.setViewName("/mobile/notifications/list");
		return modelAndView;
	}
	
	@RequestMapping(value="/mobile/user/notifications/view/{id}",method=RequestMethod.GET)
	public ModelAndView showNotifications(@PathVariable int id, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		//Notice notification=ozaiService.getNotice(id);
		//modelAndView.addObject("notification", notification);
		
		modelAndView.setViewName("/lct/notifications/view");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/virtual-doctor", method = RequestMethod.GET)
	public ModelAndView vDoctor(HttpSession session) {
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		
		modelAndView.setViewName("/mobile/events/virtual-doctor");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitForVirtualDoctor", method = RequestMethod.POST)
	public String submitForVirtualDoctor(@ModelAttribute VirtualDoctor doctor,
			HttpSession session) {
		boolean save = ozaiService.submitForVirtualDoctor(doctor);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@RequestMapping(value = "/mobile/user/insurance", method = RequestMethod.GET)
	public ModelAndView insurance(HttpSession session) {
		User userData = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		
		modelAndView.setViewName("/mobile/events/insurance");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/savePersonalInsurance", method = RequestMethod.POST)
	public String savePersonalInsurance(@ModelAttribute Insurance insurance,
			HttpSession session) {
		boolean save = ozaiService.savePersonalInsurance(insurance);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/saveVehicleInsurance", method = RequestMethod.POST)
	public String saveVehicleInsurance(@ModelAttribute VehicleInsurance insurance,
			HttpSession session) {
		boolean save = ozaiService.saveVehicleInsurance(insurance);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}

	// Book flight tickets - 1
	@RequestMapping(value = "/mobile/user/flightTickets", method = RequestMethod.GET)
	public ModelAndView flightTicketsPage(HttpSession session) {
	    ModelAndView modelAndView = new ModelAndView();

	    // Retrieve user data from session
	    User userData = (User) session.getAttribute("User");

	    System.out.println("User Data ID :" + userData.getId());
	    System.out.println("User Data City :" + userData.getCity());
	    System.out.println("User Data Resident Type :" + userData.getResident_type());

	    // Create a new FlightTickets object
	    FlightTickets flightTickets = new FlightTickets();

	    // Add the FlightTickets object to the Model
	    modelAndView.addObject("flight_tickets", flightTickets);

	    // If user data is available, perform necessary operations
	    // For example, you can pass user data to the view
	    modelAndView.addObject("user", userData);

	    System.out.println("test-1");
	    modelAndView.setViewName("/mobile/flightTickets");
	    System.out.println("test-2");

	    return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/book-flight-ticket", method = RequestMethod.POST)
	@ResponseBody
	public String submitFlightTicket(@ModelAttribute("flight_tickets") FlightTickets flightTickets, BindingResult result, HttpSession session, @RequestParam("number_of_tickets") int numberOfTickets) {

	    System.out.println("Flight Tickets Object: " + flightTickets);
	    System.out.println("Date: " + flightTickets.getDate());

	    Date date = flightTickets.getDate();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String format = formatter.format(date);
	    flightTickets.setDate(date);

	    System.out.println(date);

	    // Get user data from session
	    User userData = (User) session.getAttribute("User");
	    System.out.println("userData: "+userData);

	    // Check if user data exists in session
	    if (userData == null) {
	        // Handle case when user is not logged in
	        // Redirect user to login page or handle appropriately
	        return "error";
	    }

	    // Set user ID from user data
	    flightTickets.setUserId(userData.getId());
	    flightTickets.setNumberOfTickets(numberOfTickets);
	    System.out.println("Flight tickets: " + numberOfTickets);

	    // Fetch client code based on user's resident type
	    String residentType = userData.getResident_type();
	    if ("B2B".equalsIgnoreCase(residentType)) {
	        // If B2B, set admin_id to 0 and populate client details
	        B2B_Details details = clientService.getResidentDetails(userData.getId());
	        flightTickets.setClientCode(details.getClient_code());
	    } else if ("B2C".equalsIgnoreCase(residentType)) {
	        // If B2C, set admin_id and client_code based on admin service
	        B2C_Details details = adminService.getB2CResidentDetails(userData.getId());
	        flightTickets.setClientCode(details.getClient_code());
	    }

	    System.out.println("Saving...");

	    // Save the flight ticket using your service or repository
	    boolean saved = ozaiService.saveFlightTickets(flightTickets);
	    System.out.println("saved:" + saved);

	    // Return "success" or "error" based on the save operation
	    if (saved) {
	        return "success";
	    } else {
	        return "error";
	    }
	}
	
	// FOR USER_EMOTION
    @RequestMapping(value = "/mobile/selectEmotion", method = RequestMethod.POST)	
    public String selectEmotion(@ModelAttribute("user_emotion") UserEmotion userEmotion, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) 
    {
        // Assuming userId is obtained from session or authentication
    	User userData = (User) session.getAttribute("User"); 
    	
        if(userData == null) 
        {  
        	System.out.println("User ID not found in session.");
            // Add a flash attribute indicating that the user needs to login
            redirectAttributes.addFlashAttribute("loginRequired", true);
            return "redirect:/mobile"; // Redirect to the login page
        }
        
        System.out.println("User ID: "+userData.getId());
        
     // We are using java.util.date so for that we are setting time to zero we only need date
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0); // Set hour to midnight
        calendar.set(Calendar.MINUTE, 0);       // Set minute to 0
        calendar.set(Calendar.SECOND, 0);       // Set second to 0
        calendar.set(Calendar.MILLISECOND, 0);  // Set millisecond to 0
        Date today = calendar.getTime();
        System.out.println("Date: "+today);
        
     // Check if the user has already selected an emotion for today
        boolean emotionSelectedToday = ozaiService.isUserEmotionSelectedForDate(userData.getId(), today);
        if(emotionSelectedToday) 
        {
            System.out.println("User has already selected an emotion for today.");
            redirectAttributes.addFlashAttribute("emotionAlreadySelected", "You have already selected an emotion for today."); // Flag to indicate emotion is already selected
            return "redirect:/mobile"; // Redirect to the page where the user selects emotion
        }
        
        userEmotion.setUserId(userData.getId());
        userEmotion.setEmotion(userEmotion.getEmotion());
        userEmotion.setDate(userEmotion.getDate());
	    // Fetch client code based on user's resident type
	    String residentType = userData.getResident_type();
	    if 
	    ("B2B".equalsIgnoreCase(residentType)) 
	    {
	        // If B2B, set admin_id to 0 and populate client details
	        B2B_Details details = clientService.getResidentDetails(userData.getId());
	        userEmotion.setClientCode(details.getClient_code());
	    }else if("B2C".equalsIgnoreCase(residentType)) 
	    {
	        // If B2C, set admin_id and client_code based on admin service
	        B2C_Details details = adminService.getB2CResidentDetails(userData.getId());
	        userEmotion.setClientCode(details.getClient_code());
	    }
	    
        boolean save = ozaiService.saveUserEmotion(userEmotion);
        
        if(save) {
            System.out.println("success");
            redirectAttributes.addFlashAttribute("successMessage", "Emotion saved successfully!"); // Add a success flash attribute
        } else {
            System.out.println("error");
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to save emotion. Please try again."); // Add an error flash attribute
        }
        return "redirect:/mobile";
    }
    
    @RequestMapping(value = "/mobile/user/gaterequests/list", method = RequestMethod.GET)
	public ModelAndView societyApprovals(HttpSession session) {
		User user = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		List<GateRequests> requests = clientService.getUserGateRequests(user.getId(), "All", 0);
		modelAndView.addObject("requests", requests);
		
		modelAndView.setViewName("/mobile/gaterequests/list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/gaterequests/view/{id}", method = RequestMethod.GET)
	public ModelAndView getResidentRequestView(@PathVariable int id, HttpSession session) {
	    ModelAndView modelAndView = new ModelAndView();
	    GateRequests request = clientService.getGateRequestDetails(id);
	    
	    User user = (User) session.getAttribute("User"); // Replace with your actual logic to get role

	    modelAndView.addObject("req", request); // Add user role to the model
	    modelAndView.setViewName("/mobile/gaterequests/view");
	    return modelAndView;
	}	
	
	@ResponseBody
	@RequestMapping(value = "/mobile/approveGateRequest/{requestId}", method = {RequestMethod.GET, RequestMethod.POST})
	public String approveGateRequest(@PathVariable("requestId") int requestId, HttpSession session) {
	    User user = (User) session.getAttribute("User");
	    B2B_Details details = clientService.getResidentDetails(user.getId());
	    List<String> usernames = ozaiService.getUsernamesByClientCode(details.getClient_code());

	    if (clientService.approveGateRequest(requestId)) {
	        //String message = new JSONObject()
	          //      .put("id", requestId)
	            //    .put("status", "Approved")
	              //  .toString();
	        //webSocketHandler.sendUpdate(message);
	        for (String username : usernames) {
	            fcmService.buildNotificationForResident(username, "New Notification", 
	                    "Request approved.", "https://ozailiving.com/lct/gaterequests/view/"+requestId+"", "LCT");
	        }
	        return "Success";
	    } else {
	        return "Failed";
	    }
	}

}

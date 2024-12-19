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
public class AdminController {

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
	
	@ResponseBody
	@RequestMapping(value = "/admin/residents-count", method = RequestMethod.GET)
	public String totalResidents(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		Integer strength = ozaiService.getResidentsCountByAdmin(admin.getClient_code());
		NumberFormat format = NumberFormat.getNumberInstance();
	    String formattedPending = format.format(strength);
		
	    if (strength > 0) {
			return formattedPending;
		} else
			return "0";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/properties-count", method = RequestMethod.GET)
	public String totalProperties(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		Integer strength = ozaiService.getPropertiesCountByAdmin(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/tickets-count", method = RequestMethod.GET)
	public String totalTickets(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		Integer strength = ozaiService.getTicketsCountByAdmin(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/notifications-count", method = RequestMethod.GET)
	public String totalNotifications(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		Integer strength = ozaiService.getNotificationsCountByAdmin(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/expenses-count", method = RequestMethod.GET)
	public String totalExpenses(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		String thisDay = OzaiUtil.getCurrentDate().toString();
		String thisMonth = thisDay.substring(0, 7);
		double strength = ozaiService.getExpensesCountByAdmin(admin.getClient_code(), thisMonth);
		
		NumberFormat format = NumberFormat.getNumberInstance();
	    String formattedPending = format.format(strength);
		
		if (strength > 0) {
			return formattedPending;
		} else {
			return "0";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/admin/payments-sum", method = RequestMethod.GET)
	public String totalPayments(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		double strength = ozaiService.getTotalRevenueByAdmin(admin.getClient_code());
		//Integer sum = (Integer) strength;
		if (strength > 0) {
			return String.valueOf(strength);
		} else
			return "N/A";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/collected-sum", method = RequestMethod.GET)
	public String collectedSum(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		String thisDay = OzaiUtil.getCurrentDate().toString();
		String thisMonth = thisDay.substring(0, 7);
		double strength = ozaiService.getTotalMonthCollectedByAdmin(admin.getClient_code(), thisMonth);
		//Integer sum = (Integer) strength;
		if (strength > 0) {
			return String.valueOf(strength);
		} else
			return "0";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/pending-sum", method = RequestMethod.GET)
	public String pendingRent(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		String thisDay = OzaiUtil.getCurrentDate().toString();
		String thisMonth = thisDay.substring(0, 7);
		
		double pending = ozaiService.getTotalMonthPendingByAdmin(admin.getClient_code(), thisMonth);
		double collected = ozaiService.getTotalMonthCollectedByAdmin(admin.getClient_code(), thisMonth);
		double total = pending+collected;
		double perc = Math.round((collected/total)*100);
		double per = Math.round(perc*100)/100;
		
		NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
	    String formattedPending = format.format(pending);
	    String formattedCollected = format.format(collected);
		
		
		StringBuffer poemsString = new StringBuffer();
		
		if (total > 0) {
			poemsString.append("<div class=\"card-body bg-extra-light text-center\">"
					+ "<div class=\"progress bg-danger\" style=\"height: 25px\">"
					+"<div class=\"progress-bar bg-success\" style=\"width: "+per+"%\" role=\"progressbar\">"
					+perc+"%" + 
					"</div></div></div>" + 
					"<div class=\"card-body text-center\">" + 
					"<h6 style=\"font-weight: 600;\">Collected : "+formattedCollected+"/-</h6>" + 
					"<h6 style=\"font-weight: 600;\">Pending : "+formattedPending+"/-</h6>" + 
					"</div>");
			return poemsString.toString();
		} else {
			poemsString.append("<div class=\"card-body bg-extra-light text-center\">"
					+"<div class=\"progress bg-danger\" style=\"height: 25px\">"
					+"<div class=\"progress-bar bg-success\" style=\"width: \"0%\" role=\"progressbar\">"
					+"0%" 
					+"</div></div></div>" 
					+"<div class=\"card-body text-center\">" 
					+"<h6 style=\"font-weight: 600;\">Collected : 0</h6>" 
					+"<h6 style=\"font-weight: 600;\">Pending : 0</h6>" 
					+"</div>");
			return poemsString.toString();
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/collected-sum/{month}", method = RequestMethod.GET)
	public String collectedMonthSum(@PathVariable String month, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		double strength = ozaiService.getTotalMonthCollectedByAdmin(admin.getClient_code(), month);
		//Integer sum = (Integer) strength;
		System.out.println("Collected:" +strength);
		if (String.valueOf(strength) != null) {
			return String.valueOf(strength);
		} else
			return "0";
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/pending-sum/{month}", method = RequestMethod.GET)
	public String pendingMonthRent(@PathVariable String month, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		double pending = ozaiService.getTotalMonthPendingByAdmin(admin.getClient_code(), month);
		double collected = ozaiService.getTotalMonthCollectedByAdmin(admin.getClient_code(), month);
		double total = pending+collected;
		double perc = Math.round((collected/total)*100);
		double per = Math.round(perc*100)/100;
		
		NumberFormat format = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
	    String formattedPending = format.format(pending);
	    String formattedCollected = format.format(collected);
	    
		StringBuffer poemsString = new StringBuffer();
		
		
		if (total > 0) {
			poemsString.append("<div class=\"card-body bg-extra-light text-center\">"
					+ "<div class=\"progress bg-danger\" style=\"height: 25px\">"
					+"<div class=\"progress-bar bg-success\" style=\"width: "+per+"%\" role=\"progressbar\">"
					+perc+"%" + 
					"</div></div></div>" + 
					"<div class=\"card-body text-center\">" + 
					"<h6 style=\"font-weight: 600;\">Collected : "+formattedCollected+"/-</h6>" + 
					"<h6 style=\"font-weight: 600;\">Pending : "+formattedPending+"/-</h6>" + 
					"</div>");
			return poemsString.toString();
		} else {
			poemsString.append("<div class=\"card-body bg-extra-light text-center\">"
					+"<div class=\"progress bg-danger\" style=\"height: 25px\">"
					+"<div class=\"progress-bar bg-success\" style=\"width: \"0%\" role=\"progressbar\">"
					+"0%" 
					+"</div></div></div>" 
					+"<div class=\"card-body text-center\">" 
					+"<h6 style=\"font-weight: 600;\">Collected : 0</h6>" 
					+"<h6 style=\"font-weight: 600;\">Pending : 0</h6>" 
					+"</div>");
			return poemsString.toString();
		}
	}

	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {

		Admin userData = (Admin) session.getAttribute("AdminUser");
		if (userData != null) {
			return new ModelAndView("/admin");
		} else
			return new ModelAndView("/admin/login", "admin", new Admin());
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView tikaanaAdmin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Admin adminData = (Admin) session.getAttribute("AdminUser");
		//List<ResidentsData> residentsData = adminService.getPropertyWiseResidentsDataByAdmin(adminData.getClient_code());
		//String residentsChartData = OzaiUtil.buildResidentsDataForChart(residentsData);
		//modelAndView.addObject("residentsChartData", residentsChartData);
		
		//List<Ticket> tickets = adminService.getRecentTickets(adminData.getClient_code(), 3);
		//modelAndView.addObject("tickets", tickets);
		List<Groceries> groceries = adminService.getGroceryList();
		modelAndView.addObject("groceries", groceries);
		
		modelAndView.setViewName("/admin/index");
		return modelAndView;
	}
	
	@ResponseBody	
	@RequestMapping(value = "/saveBooking", method = RequestMethod.GET)
	public String registerAdmin(@ModelAttribute("booking") Grocery_Booking booking, HttpSession session) throws IOException {

		boolean save = adminService.saveBooking(booking);
		if (save) {
			return "success";
		} else {
			return "failed";
		}
	}
	
	@RequestMapping(value = "/admin-register", method = RequestMethod.GET)
	public ModelAndView register(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Admin userData = (Admin) session.getAttribute("AdminUser");
		if(userData!=null) {
			modelAndView.setViewName("redirect:/admin");
		} else {
			modelAndView.setViewName("/admin/register");
		}
		
		return modelAndView;
	}
	
	@ResponseBody	
	@RequestMapping(value = "/registerAdmin", method = RequestMethod.GET)
	public String registerAdmin(@ModelAttribute("admin") Admin admin, HttpSession session) throws IOException {

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		System.out.println("Password" + password);

		//admin.setPassword(password);
		admin.setUsername(admin.getMobile());
		Integer client_code = adminService.getMaxClientCode();
		admin.setClient_code(client_code+1);
		if(adminService.isAdminExist(admin.getMobile())) {
			return "exist";
		} else {
			Integer id = adminService.addAdmin(admin);
			if (id != 0) {
				return "success";
			} else {
				return "fail";
			}
		}
	}

	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView tikaanaAdminIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/services", method = RequestMethod.GET)
	public ModelAndView adminServices() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/services");
		return modelAndView;
	}

	@RequestMapping(value = "/validateAdminLogin", method = RequestMethod.GET)
	public ModelAndView validateLogin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Admin userData = (Admin) session.getAttribute("AdminUser");
		if (userData != null) {
			modelAndView.setViewName("redirect:/admin");
			//return new ModelAndView("/admin/index");
		} else
			modelAndView.setViewName("redirect:/admin");
			//return new ModelAndView("/adminlogin", "admin", new Admin());
		return modelAndView;
	}

	@RequestMapping(value = "/validateAdminLogin", method = RequestMethod.POST)
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

				session.setAttribute("AdminUser", userData);
				if (next != null && !next.isEmpty()) {
					modelAndView.setViewName("redirect:" + next);
				} else {
					modelAndView.setViewName("redirect:/admin");
				}
				return modelAndView;

			} else {
				modelAndView.getModel().put("AuthError", "Invalid UserName / Password");
				modelAndView.setViewName("/admin/login");
				return modelAndView;
			}
		} else {
			return new ModelAndView("/admin/login");
		}

	}

	@RequestMapping(value = "/adminlogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		ozaiService.deleteToken(admin.getUsername(), "Admin");
		session.removeAttribute("AdminUser");
		session.invalidate();
		return new ModelAndView("/admin/login", "admin", new Admin());
	}

	private void uploadFile(String filename, MultipartFile image, String type) {
		File image_path = new File(servletContext.getRealPath("/") + "uploaded_files/DOC/" + type + "/" + filename);
		image_path.getParentFile().mkdirs();
		try {
			FileUtils.writeByteArrayToFile(image_path, image.getBytes());

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/profile-admin/image/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
	@ResponseBody
	public byte[] getAdminProfileImage(@PathVariable int id) {

		return adminService.getAdminRoleById(id).getImage();

	}
	
	/* Admin roles controller starts */
	
	@RequestMapping(value = "/admin/roles/add", method = RequestMethod.GET)
	public ModelAndView addAdminRoleToClient() {
		ModelAndView modelAndView = new ModelAndView();
		List<PG> pgs = propertyService.getB2BPropertiesList();
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/roles/add");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/registerAdminRoleAction", method = RequestMethod.POST)
	public ModelAndView submitB2BAdminToClient(@ModelAttribute("admin") Admin admin, HttpSession session) throws IOException {

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		System.out.println("Password" + password);

		admin.setPassword(password);
		String filename = null;
		ModelAndView modelAndView = new ModelAndView();
		admin.setUsername(admin.getUsername());

		Integer id = adminService.addAdmin(admin);

		if (id != 0) {
			//sendSMS(user.getName(), user.getMobile(), password);
			//uploadFile(filename, id_file, "USER");
			modelAndView.addObject("success", true);
			modelAndView.addObject("username", admin.getUsername());
			modelAndView.addObject("password", admin.getPassword());
			

			modelAndView.setViewName("/admin/roles/add");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/admin/roles/add");
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/checkAdminUserNameAction", method = RequestMethod.POST)
	public String CheckAdminUserName(@RequestParam String username, HttpSession session) {
		
		if(username.isEmpty() || username.length()!=10) {
			return "empty";
		} else {
			if (adminService.isAdminExist(username)) {
				System.out.println("Exist");
				return "success";
			} else {
				return "fail";
			}
		}
	}
	
	@RequestMapping(value = "/admin/roles/list", method = RequestMethod.GET)
	public ModelAndView allB2BAdminListForClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");

		if (adminData != null) {

			List<Admin> tenants = adminService.getAllAdminsByEntity(adminData.getClient_code());

			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("organization", adminData.getClient());

			modelAndView.setViewName("/admin/roles/list");

		} else {
			modelAndView.setViewName("/admin/roles/list" + "?client=no" + "");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/roles/edit/{id}", method = RequestMethod.GET)
	public ModelAndView getTenatDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");

		Admin admin = adminService.getAdminRoleById(id);

		modelAndView.addObject("admin", admin);

		modelAndView.setViewName("/admin/roles/edit");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/roles/update-role", method = RequestMethod.GET)
	public String getUpdateAdminRole(@ModelAttribute("admin") Admin admin, HttpSession session) {
		
		if (adminService.updateAdminRole(admin)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	/* ----------------------Admin roles controller Ends------------------------ */
	
	/* -------------------Residents Controller Starts----------------- */
	
	
	@RequestMapping(value = "/admin/residents/add", method = RequestMethod.GET)
	public ModelAndView addB2BTenanttoClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/residents/add");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addResidentAction", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("residents") Residents residents, BindingResult result,
			HttpSession session) throws IOException {
		//registerValidator.validate(user, result);
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		Random rand = new Random();	
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		
		User user = new User();
		B2C_Details details = new B2C_Details();
		System.out.println("Password" +password);
		user.setUsername(residents.getMobile());
		user.setPassword(password);
		user.setName(residents.getName());
		user.setEmail(residents.getEmail());
		user.setReg_date(OzaiUtil.getCurrentDate());
		user.setMobile(residents.getMobile());
		user.setResident_type("B2C");
		user.setIs_resident("YES");
			
		if(userService.isMobileExist(user.getMobile())) {
			User userD = userService.getUserDetails(residents.getMobile());
			modelAndView.addObject("userD", userD);
			List<PG> pgs = propertyService.getB2CPropertiesList();
			modelAndView.addObject("pgs", pgs);
			modelAndView.setViewName("/admin/residents/details");
		} else {
				
			Integer isStudentSaved = userService.saveUser(user);
			System.out.println("student saved");
			if (isStudentSaved!=0) {
				
				details.setJoining_date(residents.getJoining_date());
				details.setProperty_id(residents.getProperty_id());
				details.setRent(residents.getRent());
				details.setRoom_id(residents.getRoom_id());
				details.setBed_id(residents.getBed_id());
				details.setSharing(residents.getSharing());
				details.setUser_id(isStudentSaved);
				details.setAdmin_id(admin.getClient_code());
				
				B2C_Rents rent = new B2C_Rents();
				String thisDay = details.getJoining_date().toString();
				String thisMonth = thisDay.substring(0, 7);
				String theDate = thisDay.substring(Math.max(thisDay.length() - 2, 0));
				int daysLeft = Integer.parseInt(theDate);
				//Calendar calendar = Calendar.getInstance();
			    //int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			    //int currentDay = calendar.get(Calendar.DAY_OF_MONTH);
			    //int daysLeft = lastDay - currentDay;
			    System.out.println("Monthly Rent:"+details.getRent()+"Days Left"+daysLeft);
				rent.setAmount((details.getRent()/30)*daysLeft);
				rent.setUser_id(user.getId());
				rent.setAdmin_id(admin.getClient_code());
				rent.setService_month(thisMonth);
				rent.setStatus("Due");
				rent.setProperty_id(details.getProperty_id());
				rent.setRaised_date(OzaiUtil.getCurrentDate());
				
				b2cService.addUserAsResident(details);
				b2cService.generateResidentRent(rent);
				userService.updateUserRentalCreditScore(isStudentSaved, 300, 1);
				propertyService.updateBedStatus(residents.getBed_id(), "Occupied");
				sendSMS(user.getName(), user.getMobile(), password);
				modelAndView.setViewName("redirect:/admin/residents/list");
			} else {
				modelAndView.setViewName("/admin/residents/add");
			}
		} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addUserAsResidentAction", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("details") B2C_Details details, BindingResult result,
			HttpSession session) throws IOException {
		
			Admin admin = (Admin) session.getAttribute("AdminUser");
			ModelAndView modelAndView = new ModelAndView();			
	
			details.setAdmin_id(admin.getClient_code());
			User user = userService.getUserDetailsById(details.getUser_id());
			user.setIs_resident("YES");
			user.setResident_type("B2C");
			userService.updateUser(user);
			
			
			B2C_Rents rent = new B2C_Rents();
			String thisDay = details.getJoining_date().toString();
			String thisMonth = thisDay.substring(0, 7);
			String theDate = thisDay.substring(Math.max(thisDay.length() - 2, 0));
			int daysLeft = Integer.parseInt(theDate);
			
		    System.out.println("Monthly Rent:"+details.getRent()+"Days Left"+daysLeft);
			rent.setAmount((details.getRent()/30)*daysLeft);
			rent.setUser_id(user.getId());
			rent.setAdmin_id(admin.getClient_code());
			rent.setService_month(thisMonth);
			rent.setStatus("Due");
			rent.setProperty_id(details.getProperty_id());
			rent.setRaised_date(OzaiUtil.getCurrentDate());
			
			
			if(b2cService.addUserAsResident(details)) {
				b2cService.generateResidentRent(rent);
				userService.updateUserRentalCreditScore(user.getId(), 300, 1);
				propertyService.updateBedStatus(details.getBed_id(), "Occupied");
				sendSMS(user.getName(), user.getMobile(), user.getPassword());
				modelAndView.setViewName("redirect:/admin/residents/list");
			} else {
				modelAndView.setViewName("/admin/residents/add");
			} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/list", method = RequestMethod.GET)
	public ModelAndView allB2BResidentsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");

		if (adminData != null) {

			List<B2C_Details> tenants = adminService.getActiveB2CResidents(adminData.getClient_code());

			modelAndView.addObject("tenants", tenants);

			modelAndView.setViewName("/admin/residents/list");

		} else {
			modelAndView.setViewName("/admin/residents/list" + "?client=no" + "");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/getUserRating/{user_id}", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String getResidentRating(@PathVariable int user_id, HttpSession session) {
		int rating = userService.getUserRating(user_id);
		System.out.println("Rating :" +rating);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0.0";
		}
	}
	
	@RequestMapping(value = "/admin/residents/edit/{id}", method = RequestMethod.GET)
	public ModelAndView residentEditDetails(HttpSession session, @PathVariable int id) {
		
		ModelAndView modelAndView = new ModelAndView();

		B2C_Details details = adminService.getB2CResidentDetails(id);
		
		modelAndView.addObject("details", details);

		modelAndView.setViewName("/admin/residents/edit");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/residents/generate-rent/{id}", method = RequestMethod.GET)
	public ModelAndView generateRental(HttpSession session, @PathVariable int id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Date currentDate = OzaiUtil.getCurrentDate();
		String cDate = currentDate.toString();
		String month = cDate.substring(0, 7);
		B2C_Details details = adminService.getB2CResidentDetails(id);
		
		B2C_Rents rents = new B2C_Rents();
		rents.setService_month(month);
		rents.setAmount(details.getRent());
		rents.setUser_id(id);
		rents.setStatus("Due");
		rents.setProperty_id(details.getProperty_id());
		rents.setAdmin_id(details.getAdmin_id());
		if(b2cService.isRentGenerated(id, month)) {
			modelAndView.setViewName("redirect:/admin/residents/list?success=exist");
		} else {
			boolean status = b2cService.generateResidentRent(rents);
			if(status) {
				modelAndView.setViewName("redirect:/admin/residents/list?success=yes");
			} else {
				modelAndView.setViewName("redirect:/admin/residents/list?success=no");
			}
		}
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/residents/move-out", method = RequestMethod.GET)
	public String tenantMovedOut(@RequestParam int id, @RequestParam Date moveout,
			HttpSession session) {

		//SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
		//Date moveOut = TikaanaUtil.convertStringToSqlDate(moveout);
		System.out.println("Controller"+id+ "\n Date" +moveout);
		B2C_Details details = adminService.getB2CResidentDetails(id);
		boolean save = adminService.updateResidentStatus(id, moveout);
		if (save) {
			propertyService.updateBedStatus(details.getBed_id(), "Available");
			return "success";
		} else {
			return "error";
		}
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/admin/residents/update-resident", method = RequestMethod.GET)
	public String getTenantRentStatus(@ModelAttribute("user") User user, HttpSession session) {
		
		//Admin adminData = (Admin) session.getAttribute("AdminUser");
		if (userService.updateUser(user)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
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
	
	/* Residents Payments Controller Starts */

	@RequestMapping(value = "/admin/residents/details", method = RequestMethod.GET)
	public String tenantDetails(ModelMap map) {
		return "/admin/residents/details";
	}
	
	/* Residents Payments Controller Ends */
	
	/* -----------------------------           Residents Controller Ends       ----------------------------- */
	
	/* Tikcets Controller Starts */
	
	@RequestMapping(value = "/admin/tickets/list", method = RequestMethod.GET)
	public ModelAndView showTickets(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Admin admin = (Admin) session.getAttribute("AdminUser");
		if (admin != null) {
			List<Ticket> tickets = adminService.getTicketsList(admin.getClient_code());
			modelAndView.addObject("tickets", tickets);
			modelAndView.setViewName("/admin/tickets/list");
		} else {
			modelAndView.setViewName("/admin/tickets/list");
		}

		return modelAndView;
	}
	
	@RequestMapping(value="/admin/tickets/view/{id}",method=RequestMethod.GET)
	public ModelAndView showTicket(@PathVariable int id, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		Ticket ticket=ozaiService.getTicketDetails(id);
		modelAndView.addObject("ticket", ticket);
		
		if(ticket.getStatus().equalsIgnoreCase("Closed")) {
			String timeTaken =	OzaiUtil.getTimeTaken(ticket.getRaised_date(), ticket.getClosed_on());
			modelAndView.addObject("timeTaken", timeTaken);
		}
		
		modelAndView.setViewName("/admin/tickets/view");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/tickets/update-status/{id}/{status}", method = RequestMethod.GET)
	public String getTenantRentStatus(@PathVariable int id, @PathVariable String status, HttpSession session) {

		Admin adminData = (Admin) session.getAttribute("AdminUser");
		if (adminService.updateTicketStatus(id, status, adminData.getName())) {
			return "Paid";
		} else {
			return "Due";
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/tickets/add-comments", method = RequestMethod.GET)
	public String getTenantRentStatus(@RequestParam String comments, @RequestParam int id, HttpSession session) {
		
		//Admin adminData = (Admin) session.getAttribute("AdminUser");
		if (adminService.addCommentsToTicket(comments, id)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	/* Tikcets Controller Ends */
	
	@RequestMapping(value = "/admin/apply-loan", method = RequestMethod.GET)
	public ModelAndView adminApplyLoan(ModelMap map, HttpSession session) {
		Admin userData = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView=new ModelAndView();
		Integer userId = userData.getId();
		if(ozaiService.isUserAppliedForLoan(userId.toString())) {
			modelAndView.addObject("exist", true);
		}
		modelAndView.setViewName("/admin/apply-loan");
		return modelAndView;
	}
	
	/* User Ratings & Property Ratings */
	
	@RequestMapping(value = "/admin/badminton-league", method = RequestMethod.GET)
	public ModelAndView badmintonLeague(ModelMap map, HttpSession session) {
		Admin userData = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView=new ModelAndView();
		if(ozaiService.isUserRegisteredForBadminton("Admin", userData.getId())) {
			modelAndView.addObject("exist", true);
		}
		modelAndView.setViewName("/admin/badminton-league");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/badminton-register", method = RequestMethod.POST)
	public String badmintonRegister(@ModelAttribute Badminton_league league,
			HttpSession session) {
		
		if(ozaiService.isUserRegisteredForBadminton(league.getUser_type(), league.getAdmin_id())) {
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
	
	@RequestMapping(value = "/admin/properties/add-inventory/{id}", method = RequestMethod.GET)
	public ModelAndView propertyInventory(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		
		PG pg = propertyService.getPropertyDetails(id);
		modelAndView.addObject("pg", pg);
		
		List<Inventory> ins = propertyService.getInventoryOfProperty(id);
		modelAndView.addObject("ins", ins);

		modelAndView.setViewName("/admin/properties/add-inventory");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/addInventory", method = RequestMethod.POST)
	public String userReport(@ModelAttribute Inventory inventory,
			HttpSession session) {
		
		String items = inventory.getItem();
		String[] itemsList = items.split(",");
		
		String quantities = inventory.getQuantity();
		String[] quantitiesList = quantities.split(",");
		
		for(int i=0; i<itemsList.length; i++){
		    inventory.setItem(itemsList [i]);
		    inventory.setQuantity(quantitiesList [i]);
		    propertyService.saveInventory(inventory);
		}
		
		//boolean save = propertyService.saveInventory(inventory);
		
		//if (save) {
		return "success";
		//} else {
			//return "error";
		//}
	}
	
	@RequestMapping(value = "/admin/getUser", method = RequestMethod.POST)
	public ModelAndView getUser(@RequestParam String checkMobile, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		User userD = userService.getUserDetails(checkMobile);
		modelAndView.addObject("userD", userD);
		List<PG> pgs = propertyService.getB2CPropertiesList();
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/residents/details");
		return modelAndView;
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/admin/saveNotice", method = {RequestMethod.POST, RequestMethod.GET})
	public String saveNotice(@ModelAttribute("notice") Notice notice, HttpSession session) {
		Timestamp time = Timestamp.from(Instant.now());
		notice.setPost_time(time);
		if (clientService.saveNotice(notice)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	@RequestMapping(value = "/admin/events/add", method = RequestMethod.GET)
	public ModelAndView addEvent(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/events/add");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/events/list", method = RequestMethod.GET)
	public ModelAndView eventsList(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<Event> events = ozaiService.getEventsByAdmin(admin.getClient_code());
		modelAndView.addObject("events", events);
		System.out.println("Admin:"+admin.getClient_code());
		System.out.println("Events:"+events);
		modelAndView.setViewName("/admin/events/list");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/saveEvent", method = {RequestMethod.POST, RequestMethod.GET})
	public String saveNotice(@ModelAttribute("event") Event event, HttpSession session) {
		event.setStatus("Open");
		if (ozaiService.saveEvent(event)) {
			return "success";
		} else {
			return "failed";
		}

	}

}

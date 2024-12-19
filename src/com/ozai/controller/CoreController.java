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
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
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

import com.ozai.model.Admin;
import com.ozai.model.BlogArticle;
import com.ozai.model.ClientUser;
import com.ozai.model.Contact;
import com.ozai.model.CoreUser;
import com.ozai.model.Delivery;
import com.ozai.model.Enquiry;
import com.ozai.model.Expenses;
import com.ozai.model.FIND_BED;
import com.ozai.model.INVITE_FRIEND;
import com.ozai.model.Order_Items;
import com.ozai.model.OrdersList;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Referral;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.User;
import com.ozai.model.Vendor;
import com.ozai.service.AdminService;
import com.ozai.service.ArticleService;
import com.ozai.service.CoreService;
import com.ozai.service.ExpenseService;
import com.ozai.service.OrderService;
import com.ozai.service.PropertyService;
import com.ozai.service.OzaiService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
import com.ozai.model.TRYITFIRST;
import com.ozai.model.Ticket;


@Controller
public class CoreController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CoreService coreService;
	
	@Autowired
	PropertyService propertyService;
	
	@Autowired
	ExpenseService expenseService;
	
	@RequestMapping(value = "/corelogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {

		CoreUser userData = (CoreUser) session.getAttribute("CoreUser");
		if (userData != null) {
			return new ModelAndView("/core");
		} else
			return new ModelAndView("/core/login", "admin", new CoreUser());
	}

	@RequestMapping(value = "/core", method = RequestMethod.GET)
	public ModelAndView tikaanaAdmin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/core/index");
		return modelAndView;

	}
	
	@RequestMapping(value = "/validateCoreUserLogin", method = RequestMethod.GET)
	public ModelAndView validateLogin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		CoreUser userData = (CoreUser) session.getAttribute("CoreUser");
		if (userData != null) {
			modelAndView.setViewName("redirect:/core");
			//return new ModelAndView("/admin/index");
		} else
			modelAndView.setViewName("redirect:/core");
			//return new ModelAndView("/adminlogin", "admin", new Admin());
		return modelAndView;
	}

	@RequestMapping(value = "/validateCoreUserLogin", method = RequestMethod.POST)
	public ModelAndView validate(@ModelAttribute("admin") CoreUser user, BindingResult result,
			RedirectAttributes redirectAttributes, HttpSession session,
			@RequestParam(value = "next", required = false) String next) {
		// userValidator.validate(user, result);

		if (user.getUsername() != null && !user.getUsername().isEmpty() && user.getPassword() != null
				&& !user.getPassword().isEmpty()) {
			ModelAndView modelAndView = new ModelAndView();
			String username = user.getUsername();
			String password = user.getPassword();
			System.out.println("in submit" + username + "password " + password);
			CoreUser userData = coreService.validateUser(username, password);

			if (userData != null) {

				session.setAttribute("CoreUser", userData);
				if (next != null && !next.isEmpty()) {
					modelAndView.setViewName("redirect:" + next);
				} else {
					modelAndView.setViewName("redirect:/core");
				}
				return modelAndView;

			} else {
				modelAndView.getModel().put("AuthError", "Invalid UserName / Password");
				modelAndView.setViewName("/core/login");
				return modelAndView;
			}
		} else {
			return new ModelAndView("/core/login");
		}

	}

	@RequestMapping(value = "/corelogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		session.removeAttribute("CoreUser");
		session.invalidate();
		return new ModelAndView("/core/login", "admin", new CoreUser());
	}
	
	@RequestMapping(value = "/core/orders/add", method = RequestMethod.GET)
	public ModelAndView orderForOperator(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/core/orders/add");
		return modelAndView;

	}
	
	@RequestMapping(value = "/core/orders/create/{category}", method = RequestMethod.GET)
	public ModelAndView orderForm(@PathVariable String category,
			HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		Integer maxId = orderService.getOrderMaxId();
		List<Admin> operators = coreService.getOperators();
		modelAndView.addObject("operators", operators);
		modelAndView.addObject("maxId", maxId);
		modelAndView.addObject("category", category);
		modelAndView.setViewName("/core/orders/create");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/core/saveOrder", method = RequestMethod.POST)
	public String userReport(@ModelAttribute Order_Items items,
			HttpSession session) {
		
		
		String itemS = items.getItem();
		String[] itemsList = itemS.split(",");
		
		String quantities = items.getQuantity();
		String[] quantitiesList = quantities.split(",");
		
		OrdersList orderList = new OrdersList();
		orderList.setId(items.getOrder_id()); 
		orderList.setAdmin_id(items.getAdmin_id());
		orderList.setCategory(items.getCategory());
		boolean id = orderService.saveOrder(orderList);
		
		for(int i=0; i<itemsList.length; i++){
			items.setItem(itemsList [i]);
			items.setQuantity(quantitiesList [i]);
			orderService.saveOrderItems(items);
		}
		return "success";
	}
	
	@RequestMapping(value = "/core/orders/list", method = RequestMethod.GET)
	public ModelAndView ordersList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<OrdersList> orders = orderService.getAllActiveOrders();
			
		modelAndView.addObject("orders", orders);
		
		modelAndView.setViewName("/core/orders/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/orders/all-list", method = RequestMethod.GET)
	public ModelAndView allOrdersList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<OrdersList> orders = orderService.getAllOrders();
			
		modelAndView.addObject("orders", orders);
		
		modelAndView.setViewName("/core/orders/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/orders/details/{id}", method = RequestMethod.GET)
	public ModelAndView ordersList(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		List<Order_Items> orders = orderService.getOrderItemsById(id);
			
		modelAndView.addObject("orders", orders);
		
		modelAndView.setViewName("/core/orders/details");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/operators/add", method = RequestMethod.GET)
	public ModelAndView addOperator(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/core/operators/add");
		return modelAndView;

	}
	
	@RequestMapping(value = "/core/operators/list", method = RequestMethod.GET)
	public ModelAndView operatorsList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<Admin> operators = coreService.getAllOperators();
			
		modelAndView.addObject("operators", operators);
		
		modelAndView.setViewName("/core/operators/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/operators/edit/{id}", method = RequestMethod.GET)
	public ModelAndView getTenatDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Admin admin = adminService.getAdminRoleById(id);

		modelAndView.addObject("admin", admin);

		modelAndView.setViewName("/core/operators/edit");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/core/updateAdmin", method = RequestMethod.GET)
	public String getUpdateAdminRole(@ModelAttribute("admin") Admin admin, HttpSession session) {
		
		if (adminService.updateAdminRole(admin)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/core/makeAdmin/{id}", method = RequestMethod.GET)
	public String getUpdateAdminRole(@PathVariable int id, HttpSession session) {
		
		if (coreService.makeUserAsAdmin(id)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	@RequestMapping(value = "/core/lct/list", method = RequestMethod.GET)
	public ModelAndView lctList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<ClientUser> operators = coreService.getAllLCTUsers();
			
		modelAndView.addObject("operators", operators);
		modelAndView.setViewName("/core/lct/list");
		return modelAndView;
		
	}
	
	
	/* Delivery controller starts */
	
	@RequestMapping(value = "/core/delivery/add", method = RequestMethod.GET)
	public ModelAndView deliveryAdd(HttpSession session) {
		
		CoreUser admin = (CoreUser) session.getAttribute("CoreUser");
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		List<PG> properties = propertyService.getPropertiesList();

		modelAndView.addObject("services", services);
		modelAndView.addObject("properties", properties);

		modelAndView.setViewName("/core/delivery/add");
		return modelAndView;

	}
	
	@RequestMapping(value = "/core/delivery/list/{type}", method = RequestMethod.GET)
	public ModelAndView deliveryList(@PathVariable String type, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<Delivery> dels = coreService.getDeliveryList(type);	
		modelAndView.addObject("dels", dels);
		
		List<Products> services = expenseService.getProductsList();
		modelAndView.addObject("services", services);
		
		modelAndView.setViewName("/core/delivery/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/delivery/list-category/{category}", method = RequestMethod.GET)
	public ModelAndView deliveryListByCategory(@PathVariable String category, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<Delivery> dels = coreService.getDeliveryListByCategory(category);	
		modelAndView.addObject("dels", dels);
		modelAndView.addObject("category", category);
		
		List<Products> services = expenseService.getProductsList();
		modelAndView.addObject("services", services);
		
		modelAndView.setViewName("/core/delivery/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/core/delivery/view/{id}", method = RequestMethod.GET)
	public ModelAndView deliveryDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Delivery del = coreService.getDeliveryDetails(id);

		modelAndView.addObject("del", del);

		modelAndView.setViewName("/core/delivery/view");
		return modelAndView;

	}
	
	@RequestMapping(value = "/core/saveDeliveryDetails", method = RequestMethod.POST)
	public ModelAndView submitPurchase(
			@RequestParam(value = "input_file", required = true) MultipartFile input_file,
			@ModelAttribute("delivery") Delivery delivery, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Integer maxId = coreService.getDeliveryMaxId();
		Integer code = 0;
		if(maxId==1) {
			code = maxId;
		} else {
			code = maxId+1;
		}
		String filename = null;
		if (!input_file.isEmpty()) {
			filename = code + input_file.getOriginalFilename().substring(input_file.getOriginalFilename().lastIndexOf('.'));
		}
		delivery.setFilename(filename);
		Integer id = coreService.saveDeliveryDetails(delivery);
		if (id!=0) {
			uploadFile(filename, input_file, "DELIVERY");
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/core/delivery/add");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/core/delivery/add");
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
	
	/* Properties controller starts */
	
	@RequestMapping(value = "/core/properties/list", method = RequestMethod.GET)
	public ModelAndView propertiesList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<PG> properties = propertyService.getPropertiesList();
			
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/core/properties/list");
		return modelAndView;
		
	}
	
	
	

}

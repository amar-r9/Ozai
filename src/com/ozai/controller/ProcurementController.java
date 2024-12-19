package com.ozai.controller;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.beans.MessageBean;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.Expenses;
import com.ozai.model.Inventory;
import com.ozai.model.ConsultDoctor;
import com.ozai.model.Order_Items;
import com.ozai.model.OrdersList;
import com.ozai.model.PG;
import com.ozai.model.User;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.MessageService;
import com.ozai.service.OrderService;
import com.ozai.service.UserService;


@Controller
public class ProcurementController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/admin/orders/create/{category}", method = RequestMethod.GET)
	public ModelAndView orderForm(@PathVariable String category,
			HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		Integer maxId = orderService.getOrderMaxId();
		modelAndView.addObject("maxId", maxId);
		modelAndView.addObject("category", category);
		modelAndView.setViewName("/admin/orders/create");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/saveOrder", method = RequestMethod.POST)
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
		
		//boolean save = propertyService.saveInventory(inventory);
		
		//if (save) {
		return "success";
		//} else {
			//return "error";
		//}
	}
	
	/*
	 * @RequestMapping(value = "/admin/saveOrder", method = RequestMethod.POST)
	 * public ModelAndView submitPurchase(@RequestParam int order_id,
	 * 
	 * @RequestParam int admin_id,
	 * 
	 * @RequestParam String item1, @RequestParam String quantity1,
	 * 
	 * @RequestParam (required = false) String item2, @RequestParam (required =
	 * false) String quantity2,
	 * 
	 * @RequestParam (required = false) String item3, @RequestParam (required =
	 * false) String quantity3,
	 * 
	 * @RequestParam (required = false) String item4, @RequestParam (required =
	 * false) String quantity4,
	 * 
	 * @RequestParam (required = false) String item5, @RequestParam (required =
	 * false) String quantity5, HttpSession session) {
	 * 
	 * ModelAndView modelAndView = new ModelAndView(); OrdersList orderList = new
	 * OrdersList(); orderList.setId(order_id); orderList.setAdmin_id(admin_id);
	 * boolean id = orderService.saveOrder(orderList); if (id) { Order_Items order1
	 * = new Order_Items(); order1.setAdmin_id(admin_id);
	 * order1.setOrder_id(order_id); order1.setItem(item1);
	 * order1.setQuantity(quantity1); orderService.saveOrderItems(order1);
	 * if(!item2.isEmpty()) { Order_Items order2 = new Order_Items();
	 * order2.setAdmin_id(admin_id); order2.setOrder_id(order_id);
	 * order2.setItem(item2); order2.setQuantity(quantity2);
	 * orderService.saveOrderItems(order2); } if(!item3.isEmpty()) { Order_Items
	 * order3 = new Order_Items(); order3.setAdmin_id(admin_id);
	 * order3.setOrder_id(order_id); order3.setItem(item3);
	 * order3.setQuantity(quantity3); orderService.saveOrderItems(order3); }
	 * if(!item4.isEmpty()) { Order_Items order4 = new Order_Items();
	 * order4.setAdmin_id(admin_id); order4.setOrder_id(order_id);
	 * order4.setItem(item4); order4.setQuantity(quantity4);
	 * orderService.saveOrderItems(order4); } if(!item5.isEmpty()) { Order_Items
	 * order5 = new Order_Items(); order5.setAdmin_id(admin_id);
	 * order5.setOrder_id(order_id); order5.setItem(item5);
	 * order5.setQuantity(quantity5); orderService.saveOrderItems(order5); }
	 * 
	 * modelAndView.setViewName("redirect:/admin/orders/list"); } else {
	 * modelAndView.addObject("success", false);
	 * modelAndView.setViewName("/admin/orders/create"); }
	 * 
	 * return modelAndView; }
	 */
	
	@RequestMapping(value = "/admin/orders/list", method = RequestMethod.GET)
	public ModelAndView ordersList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<OrdersList> orders = orderService.getOrdersByAdmin(admin.getClient_code());
			
		modelAndView.addObject("orders", orders);
		
		modelAndView.setViewName("/admin/orders/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/orders/details/{id}", method = RequestMethod.GET)
	public ModelAndView ordersList(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<Order_Items> orders = orderService.getOrderItemsById(id);
			
		modelAndView.addObject("orders", orders);
		
		modelAndView.setViewName("/admin/orders/details");
		return modelAndView;
		
	}
	
}

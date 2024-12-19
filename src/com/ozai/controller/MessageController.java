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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.handler.ChatWebSocketHandler;
import com.ozai.beans.MessageBean;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.Messages;
import com.ozai.model.User;
import com.ozai.service.AdminService;
import com.ozai.service.B2CService;
import com.ozai.service.ClientService;
import com.ozai.service.MessageService;
import com.ozai.service.UserService;


@Controller
public class MessageController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
    private ChatWebSocketHandler webSocketHandler;
	
	@Autowired
	private ClientService clientService;
	
	@ResponseBody
	@RequestMapping(value = "/mobile/user/send-message", method = RequestMethod.POST)
	public String saveUserPost(@ModelAttribute Messages message,
			HttpSession session) {
		Timestamp time = Timestamp.from(Instant.now());
		message.setMessage_time(time);
		
		boolean save = messageService.saveMessage(message);
			if (save) {
				webSocketHandler.sendMessageToAll(message.getMessage(), message.getSender_id(), message.getReceiver_id()); // Send the message to all WebSocket sessions
				return "success";
			} else {
				return "error";
			}
	}
	
	@RequestMapping(value = "/mobile/user/chat/list", method = RequestMethod.GET)
	public ModelAndView allChats(HttpSession session){
		
		User user = (User) session.getAttribute("User");
		ModelAndView modelAndView=new ModelAndView();
		if(user.getResident_type().equalsIgnoreCase("B2C")) {
			B2C_Details details = adminService.getB2CResidentDetails(user.getId());
			List<B2C_Details> users = adminService.getActiveB2CResidents(details.getAdmin_id());
			modelAndView.addObject("users", users);
		} else if(user.getResident_type().equalsIgnoreCase("B2B")) {
			B2B_Details details = clientService.getResidentDetails(user.getId());
			List<B2B_Details> users = clientService.getActiveResidentsByClient(details.getClient_code());
			modelAndView.addObject("users", users);
		}
		
		modelAndView.setViewName("/mobile/chat/list");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/mobile/user/chat/message/{receiver_id}", method = RequestMethod.GET)
	public ModelAndView showPosts(@PathVariable int receiver_id, HttpSession session){
		User senderUser = userService.getUserDetailsById(receiver_id);
		ModelAndView modelAndView=new ModelAndView();
		//List<Messages> messages = messageService.getRecentMessages(user.getId(), receiver_id, 10, 0);
		//modelAndView.addObject("messages", messages);
		modelAndView.addObject("senderUser", senderUser);
		modelAndView.addObject("otherUser", receiver_id);
		modelAndView.setViewName("/mobile/chat/message");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/user/chat/getMessages/{receiver_id}", method = RequestMethod.GET)
	public String getAllUserPaints(@PathVariable int receiver_id, HttpSession session) {
		
		User user = (User) session.getAttribute("User");
		List<Messages> entry = messageService .getRecentMessages(user.getId(), receiver_id, 10, 0);
		StringBuffer paintsString = new StringBuffer();
		if (entry.isEmpty()) return
				" "; 
		else {
			for (Messages mst : entry) {
				if(mst.getSender_id() == user.getId()) {
					Timestamp stamp1 = mst.getMessage_time();
					Date date1 = new Date(stamp1.getTime());
					Time time1 = new Time(stamp1.getTime());
					DateFormat f1 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t1 = new SimpleDateFormat("hh:mm a");
					String d1 = f1.format(date1);
					String tm1 = t1.format(time1);
					paintsString
					.append("<li class=\"odd mt-4\">" + 
							"<div class=\"chat-content ps-3 d-inline-block text-end\">" + 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							"message fw-normal fs-3 bg-light-inverse\">" + 
							""+mst.getMessage()+ 
							"</div>" + 
							"<br />" + 
							"</div>" + 
							"<div class=\"chat-time d-inline-block text-end " + 
							"fs-2 font-weight-medium\">"+d1+" "+tm1+							 
							"</div>" + 
							"</li>"); 
				} else {
					Timestamp stamp2 = mst.getMessage_time();
					Date date2 = new Date(stamp2.getTime());
					Time time2 = new Time(stamp2.getTime());
					DateFormat f2 = new SimpleDateFormat("MMM dd, yyyy");
					DateFormat t2 = new SimpleDateFormat("hh:mm a");
					String d2 = f2.format(date2);
					String tm2 = t2.format(time2);
					paintsString
					.append("<li class=\"mt-4\">" + 
							"<div class=\"chat-img d-inline-block align-top\">" + 
							"<img src=\"https://www.ozailiving.com/profile-user/image/"+mst.getSender_id()+"\""+ 
							" onerror=\"this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'\"" + 
							" alt=\"user\" class=\"rounded-circle\" />" + 
							"</div>" + 
							"<div class=\"chat-content ps-3 d-inline-block\">" + 
							"<h5 class=\"text-muted fs-3 font-weight-medium\">" + 
							mst.getsender().getName()+ 
							"</h5>" + 
							"<div class=\"box mb-2 d-inline-block text-dark " + 
							" message fw-normal fs-3 bg-light-info\">" + 
							mst.getMessage()+
							"</div></div>" + 
							"<div class=\"chat-time d-inline-block text-end " + 
							"fs-2 font-weight-medium\">" +d2+" "+tm2+ 
							"</div>" + 
							"</li>");	
				}
			}
			return paintsString.toString(); 
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/mobile/user/chat/getLatestMessage/{receiver_id}", method = RequestMethod.GET)
	public String getLAtestMessage(@PathVariable int receiver_id, HttpSession session) {
		
		User user = (User) session.getAttribute("User");
		//String entry = messageService.getRecentMessage(user.getId(), receiver_id);
		Messages message = messageService.getLatestMessage(user.getId(), receiver_id);
		Timestamp stamp2 = message.getMessage_time();
		Date date2 = new Date(stamp2.getTime());
		Time time2 = new Time(stamp2.getTime());
		DateFormat f2 = new SimpleDateFormat("MMM dd, yyyy");
		DateFormat t2 = new SimpleDateFormat("hh:mm a");
		String d2 = f2.format(date2);
		String tm2 = t2.format(time2);
		StringBuffer paintsString = new StringBuffer();
		if(!message.equals(null)) {
			paintsString
				.append("<span class=\"fs-2 text-nowrap d-block time text-truncate " + 
						"fst-normal text-dark mt-1\">" + 
						""+message.getMessage()+"</span>" + 
						"<span class=\"row w-100 fs-2 text-nowrap d-block " + 
						"subtext text-muted\"><span class=\"text-start\">"+d2+"</span><span class=\"text-end\">"+tm2+"</span></span>");
		} else {
			paintsString
				.append("<span class=\"fs-2 text-nowrap d-block time text-truncate fst-normal text-dark mt-1\">No messages to show.</span>"+ 
						"<span class=\"fs-2 text-nowrap d-block subtext text-muted\"></span>");
		}
		
		return paintsString.toString(); 
	}
	
}

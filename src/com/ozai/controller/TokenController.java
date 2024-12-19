package com.ozai.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.firebase.internal.FirebaseService;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.gson.Gson;
import com.ozai.beans.Data;
import com.ozai.beans.FCMMessageBean;
import com.ozai.beans.Notification;
import com.ozai.dto.CreatePaymentResponse;
import com.ozai.model.B2C_SecurityDeposit;
import com.ozai.model.ClientUser;
import com.ozai.model.PG;
import com.ozai.model.Token;
import com.ozai.service.ClientService;
import com.ozai.service.FCMService;
import com.ozai.service.OzaiService;
import com.ozai.service.UserService;

@RestController
public class TokenController {
	
	private static final String FIREBASE_SERVER_KEY = "AAAAON8Y7xs:APA91bFPLUwPv9a_PdrYlZhnMT9yyAd44YhTBVQjf5uRMW02eoQVSi7pJ3KXhaGqbQxYrb3_Y7jOCkCi5W0RFBqB32VTlXNgk9AhyBzCAFvPyrEhj810bs7AAb7n009O0M-NjpTtPPZO";

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FCMService fcmService;
	
	@Autowired
	private OzaiService ozaiService;
	
	@Autowired
	private ClientService clientService;
	
	@ResponseBody
	@RequestMapping(value = "/saveToken/{sessionId}/{deviceId}", method = RequestMethod.GET)
	public String saveLCTToken(@PathVariable String sessionId, @PathVariable String deviceId,
			HttpSession session) {
		
		Token token = new Token(); 
		token.setUser_type("LCT");
		token.setSessionId(sessionId);
		token.setDeviceId(deviceId);
		
		boolean save = ozaiService.saveToken(token);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveUserToken/{sessionId}/{deviceId}", method = RequestMethod.GET)
	public String saveUserToken(@PathVariable String sessionId, @PathVariable String deviceId,
			HttpSession session) {
		
		Token token = new Token(); 
		token.setUser_type("User");
		token.setSessionId(sessionId);
		token.setDeviceId(deviceId);
		
		boolean save = ozaiService.saveToken(token);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveAdminToken/{sessionId}/{deviceId}", method = RequestMethod.GET)
	public String saveAdminToken(@PathVariable String sessionId, @PathVariable String deviceId,
			HttpSession session) {
		
		Token token = new Token(); 
		token.setUser_type("Admin");
		token.setSessionId(sessionId);
		token.setDeviceId(deviceId);
		
		boolean save = ozaiService.saveToken(token);
			if (save) {
				return "success";
			} else {
				return "error";
			}
	}
	
	@ResponseBody
	@RequestMapping(value="/send-notificationToUser", method = RequestMethod.GET)
	public String sendNotification() {
		
		List<String> tokens = ozaiService.getUserDeviceId("9032144941", "User");
		for (String mst : tokens) {
		RestTemplate restTemplate = new RestTemplate();
		Gson gson = new Gson();
		FCMMessageBean fcmMessageBean = new FCMMessageBean();
		fcmMessageBean.setCollapse_key("type_a");
		Notification notification = new Notification();
		notification.setTitle("Test title");
		notification.setBody("Test body");
		fcmMessageBean.setNotification(notification);
		//fcmMessageBean.setLink("https://ozailiving.com/lct/tickets/list");
		fcmMessageBean.setTo(mst);
		String endpoint = "https://fcm.googleapis.com/fcm/send";
		String requestBody = gson.toJson(fcmMessageBean);
		//fcmService.sendNotification(fcmMessageBean);
		HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "key=" + FIREBASE_SERVER_KEY);
        httpHeaders.set("Content-Type", "application/json");
		
		 restTemplate.postForObject(endpoint, new HttpEntity<String>(requestBody, httpHeaders), String.class);
		
		 return restTemplate.postForObject(endpoint, new HttpEntity<String>(requestBody, httpHeaders), String.class);
		}
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/send-notificationToCamp", method = RequestMethod.GET)
	public String sendNotificationToCamp() {
		
		List<String> tokens = ozaiService.getUserDeviceId("9032144941", "LCT");
		for (String mst : tokens) {
		RestTemplate restTemplate = new RestTemplate();
		Gson gson = new Gson();
		FCMMessageBean fcmMessageBean = new FCMMessageBean();
		fcmMessageBean.setCollapse_key("type_a");
		Notification notification = new Notification();
		notification.setTitle("Test title");
		notification.setBody("Test body");
		fcmMessageBean.setNotification(notification);
		//fcmMessageBean.setLink("https://ozailiving.com/lct/tickets/list");
		fcmMessageBean.setTo(mst);
		String endpoint = "https://fcm.googleapis.com/fcm/send";
		String requestBody = gson.toJson(fcmMessageBean);
		//fcmService.sendNotification(fcmMessageBean);
		HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "key=" + FIREBASE_SERVER_KEY);
        httpHeaders.set("Content-Type", "application/json");
		
		 restTemplate.postForObject(endpoint, new HttpEntity<String>(requestBody, httpHeaders), String.class);
		
		 return restTemplate.postForObject(endpoint, new HttpEntity<String>(requestBody, httpHeaders), String.class);
		}
		return null;
	}
	
}

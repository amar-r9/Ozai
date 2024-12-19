package com.ozai.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.ozai.beans.FCMMessageBean;
import com.ozai.beans.Notification;
import com.ozai.model.Admin;
import com.ozai.model.ScheduleVisit;
import com.ozai.model.Service_Request;
import com.ozai.model.User;

@Component
public class FCMService {
	
	@Autowired
	OzaiService ozaiService;

	private static final String FIREBASE_SERVER_KEY = "AAAAON8Y7xs:APA91bFPLUwPv9a_PdrYlZhnMT9yyAd44YhTBVQjf5uRMW02eoQVSi7pJ3KXhaGqbQxYrb3_Y7jOCkCi5W0RFBqB32VTlXNgk9AhyBzCAFvPyrEhj810bs7AAb7n009O0M-NjpTtPPZO";

	
	public void buildNotificationForResident(String username, String title, String body, String link, String type) {
		List<String> tokens = ozaiService.getUserDeviceId(username, type);
		for (String mst : tokens) {
			FCMMessageBean fcm = new FCMMessageBean();
			Notification note = new Notification();
			fcm.setCollapse_key("type_a");
			fcm.setTo(mst);
			//fcm.setLink(link);
			//note.setLink(link);
			note.setTitle(title);
			note.setBody(body);
			fcm.setNotification(note);
			Map<String, String> data = new HashMap<>();
	        data.put("key1", "value1");
	        data.put("key2", "value2");
	        data.put("link", ""+link+"");

	        fcm.setData(data);
			sendNotification(fcm);
		}
	}
	
	public void buildNotificationForOperator(String username, String title, String body) {
		List<String> tokens = ozaiService.getUserDeviceId(username, "Admin");
		for (String mst : tokens) {
			FCMMessageBean fcm = new FCMMessageBean();
			Notification note = new Notification();
			fcm.setCollapse_key("type_a");
			fcm.setTo(mst);
			note.setTitle(title);
			note.setBody(body);
			fcm.setNotification(note);
			sendNotification(fcm);
		}
	}
	
	public void buildNotificationForClient(String username, String title, String body, String link) {
		List<String> tokens = ozaiService.getUserDeviceId(username, "User");
		for (String mst : tokens) {
			FCMMessageBean fcm = new FCMMessageBean();
			Notification note = new Notification();
			fcm.setCollapse_key("type_a");
			fcm.setTo(mst);
			//fcm.setLink(link);
			//note.setLink(link);
			note.setTitle(title);
			note.setBody(body);
			fcm.setNotification(note);
			Map<String, String> data = new HashMap<>();
	        data.put("key1", "value1");
	        data.put("key2", "value2");
	        data.put("link", ""+link+"");

	        fcm.setData(data);
			sendNotification(fcm);
		}
	}
	
	
	public void sendNotification(FCMMessageBean fcm) {
		
		RestTemplate restTemplate = new RestTemplate();
		Gson gson = new Gson();
		
		String requestBody = gson.toJson(fcm);
		
		HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "key=" + FIREBASE_SERVER_KEY);
        httpHeaders.set("Content-Type", "application/json");
		
     // Send the POST request
        HttpEntity<String> entity = new HttpEntity<>(requestBody, httpHeaders);
        String endpoint = "https://fcm.googleapis.com/fcm/send";

        ResponseEntity<String> response = restTemplate.postForEntity(endpoint, entity, String.class);
        System.out.println("Response: " + response.getBody());
	}

	
	
//	public List<String> getUserDeviceIds(int client_code) {
//		Session session = sessionFactory.getCurrentSession();
//
//		try {
//			Criteria criteria = session
//					.createCriteria(Token.class);
//			criteria.add(Restrictions.eq("client_code", client_code));
//			criteria.setProjection(Projections.property("DEVICE_ID"));
//
//			List<String> events = criteria.list();
//			return events;
//
//		} catch (HibernateException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
}

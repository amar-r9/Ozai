package com.ozai.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.beans.Properties;
import com.ozai.beans.RoomRevenue;
import com.ozai.model.Admin;
import com.ozai.model.B2C_Details;
import com.ozai.model.Beds;
import com.ozai.model.ClientUser;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Products;
import com.ozai.model.Rooms;
import com.ozai.model.User;
import com.ozai.model.Vendor;
import com.ozai.service.AdminService;
import com.ozai.service.PropertyService;

@Controller
public class PropertyController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value = "/admin/properties/add-property", method = RequestMethod.GET)
	public ModelAndView addProperty(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("/admin/properties/add-property");
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/addProperty", method = RequestMethod.POST)
	public String addVendor(@ModelAttribute PG property, HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		property.setAdmin_id(admin.getClient_code());
		Integer save = propertyService.addProperty(property);
		if (save!=0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/admin/properties/add-room", method = RequestMethod.GET)
	public ModelAndView addRoom(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/admin/properties/add-rooms");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/properties/add-room/{pgId}", method = RequestMethod.GET)
	public ModelAndView addRoom(HttpSession session, @PathVariable int pgId) {
		ModelAndView modelAndView = new ModelAndView();
		List<Rooms> rooms = propertyService.getRoomsByProperty(pgId);
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("pgId", pgId);
		modelAndView.setViewName("/admin/properties/add-room");
		return modelAndView;
	
	}

	@ResponseBody
	@RequestMapping(value = "/addRoom", method = RequestMethod.POST)
	public String addVendor(@ModelAttribute Rooms room, HttpSession session) {

		Integer save = propertyService.addRoom(room);
			
			
		
		if (save!=0) {
			for(int i=65; i<65+room.getSharing(); i++) {
				Beds bed = new Beds();
				bed.setProperty_id(room.getProperty_id());
				bed.setSharing(room.getSharing());
				bed.setStatus("Available");
				bed.setRoom_id(save);
				bed.setBed_no(room.getRoom_no()+""+(char)i);
				propertyService.addBed(bed);
			}
			
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/admin/properties/add-bed/{pgId}", method = RequestMethod.GET)
	public ModelAndView addBed(HttpSession session, @PathVariable int pgId) {
		ModelAndView modelAndView = new ModelAndView();

		List<Rooms> rooms = propertyService.getRoomsByProperty(pgId);
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("pgId", pgId);
		modelAndView.setViewName("/admin/properties/add-bed");
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/addBed", method = RequestMethod.POST)
	public String addBed(@ModelAttribute Beds bed, HttpSession session) {

		boolean save = propertyService.addBed(bed);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/properties", method = RequestMethod.GET)
	public ModelAndView allProperties(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<PG> pGs = propertyService.getPropertiesList();
			
		modelAndView.addObject("properties", pGs);
		
		modelAndView.setViewName("/properties");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/property/{id}", method = RequestMethod.GET)
	public ModelAndView viewSession(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		
		if (propertyDetails != null) {
			modelAndView.addObject("propertyDetails", propertyDetails);
			modelAndView.setViewName("/property/details");
			return modelAndView;
		} else {
			modelAndView.addObject("propertyDetails", null);
			modelAndView.setViewName("/property/details");
			return modelAndView;
		}
	}
	
	
	@RequestMapping(value = "/admin/properties/list", method = RequestMethod.GET)
	public ModelAndView adminProperties(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
			
		modelAndView.addObject("properties", pgs);
		
		modelAndView.setViewName("/admin/properties/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/details/{id}", method = RequestMethod.GET)
	public ModelAndView viewProperty(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);
		List<Beds> beds = propertyService.getBedsByProperty(id, "All");
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("beds", beds);		
		
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/admin/properties/details");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/properties/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editProperty(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);	
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/admin/properties/edit");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/updateProperty", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("pg") PG pg, BindingResult result,
			HttpSession session) throws IOException {
		
			ModelAndView modelAndView = new ModelAndView();			
		
			if(propertyService.updatePropertyDetails(pg)) {
				modelAndView.setViewName("redirect:/admin/properties/list");
			} else {
				modelAndView.setViewName("/admin/properties/edit/"+pg.getId()+"");
			} 	
		return modelAndView;
	}
	
	/* Property rating controller starts */
	
	@ResponseBody
	@RequestMapping(value = "/mobile/rate-property/{pg_id}/{rating}", method = RequestMethod.GET)
	public String getTenantRentStatus(@PathVariable int pg_id, @PathVariable int rating, HttpSession session) {
		System.out.println("Controller"+rating);
		User user = (User) session.getAttribute("User");
		if(user!=null) {
			if (propertyService.updatePropertyRating(pg_id, rating, user.getId())) {
				return "Success";
			} else {
				return "Failed";
			}
		} else {
			return "NoUser";
		}

	}

	@RequestMapping(value = "/mobile/getPropertyRating/{pg_id}", method = RequestMethod.GET)
	@ResponseBody
	public String getResidentRating(@PathVariable int pg_id, HttpSession session) {
		double rating = propertyService.getPropertyRating(pg_id);
		System.out.println("Rating :" +rating);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0.0";
		}
	}
	
	@RequestMapping(value = "/mobile/getPropertyRatingByUser/{pg_id}", method = RequestMethod.GET)
	@ResponseBody
	public String getResidentRatingOfProperty(@PathVariable int pg_id, HttpSession session) {
		User user = (User) session.getAttribute("User");
		int rating = propertyService.getPropertyRatingByUser(pg_id, user.getId());
		System.out.println("RatingU :" +rating);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0.0";
		}
	}
	
	@RequestMapping(value = "/admin/properties/rooms-list/{id}", method = RequestMethod.GET)
	public ModelAndView roomsList(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);	
		modelAndView.addObject("rooms", rooms);
		
		modelAndView.setViewName("/admin/properties/rooms-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/edit-room/{id}", method = RequestMethod.GET)
	public ModelAndView roomsDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		
		Rooms room = propertyService.getRoomDetails(id);	
		modelAndView.addObject("room", room);
		
		modelAndView.setViewName("/admin/properties/edit-room");
		return modelAndView;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRoomsListByHomeTown/{home_town}", method = RequestMethod.GET)
	public String getRoomsByHomeTown(@PathVariable String home_town, HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Object[]> expenses = propertyService.getRoomsByHomeTown(home_town, admin.getClient_code());
		StringBuffer poemsString = new StringBuffer();
		for (Object[] expense : expenses) {
			String roomId = (String) expense[0];
			BigInteger rowCount = (BigInteger) expense[1]; // Cast to BigInteger
			//Long rowCount = (Long) expense[1]; // Assuming the count of rows is a long
			poemsString.append("<p class=\"mb-0\">Room " + roomId + " has " + rowCount + " residents from the same place</p>");
		}
			return poemsString.toString();

	}
	
	@ResponseBody
	@RequestMapping(value = "/getRoomsListByLanguage/{language}", method = RequestMethod.GET)
	public String getRoomsByLanguage(@PathVariable String language, HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Object[]> expenses = propertyService.getRoomsByLanguage(language, admin.getClient_code());
		StringBuffer poemsString = new StringBuffer();
		for (Object[] expense : expenses) {
			String roomId = (String) expense[0];
			BigInteger rowCount = (BigInteger) expense[1]; // Assuming the count of rows is a long
			poemsString.append("<p class=\"mb-0\">Room " + roomId + " has " + rowCount + " residents with the same language.</p>");
		}
		return poemsString.toString();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRoomsList/{pg}", method = RequestMethod.GET)
	public String getAllCategoryExpenses(@PathVariable int pg, HttpSession session) {

		List<Rooms> expenses = propertyService.getRoomsByPropertyWithAvailability(pg);
		StringBuffer poemsString = new StringBuffer();
		if (expenses.isEmpty())
			return "No result";
		else {
			poemsString.append("<option value=\"\">Select room</option>");
			for (Rooms poem : expenses) {
				poemsString.append("<option value=\""+poem.getId()+"\">"+poem.getRoom_no()+"</option>");
			}
			return poemsString.toString();
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/getBedsList/{room}", method = RequestMethod.GET)
	public String getBedOfRoom(@PathVariable int room, HttpSession session) {

		List<Beds> expenses = propertyService.getBedsByRoom(room, "Available");
		StringBuffer poemsString = new StringBuffer();
		if (expenses.isEmpty())
			return "No beds found";
		else {
			poemsString.append("<option value=\"\">Select bed</option>");
			for (Beds poem : expenses) {
				poemsString.append("<option value=\""+poem.getId()+"\">"+poem.getBed_no()+"</option>");
			}
			return poemsString.toString();
		}

	}
	
	@RequestMapping(value = "/admin/properties/beds-list", method = RequestMethod.GET)
	public ModelAndView bedsList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<Beds> beds = propertyService.getBedsList();
			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/admin/properties/beds-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/beds-list/{id}", method = RequestMethod.GET)
	public ModelAndView bedsListByProperty(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		List<Beds> beds = propertyService.getBedsByProperty(id, "All");			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/admin/properties/beds-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/beds-stats", method = RequestMethod.GET)
	public ModelAndView bedsStats(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<Properties> beds = propertyService.getPropertyList(admin.getClient_code());
			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/admin/properties/beds-stats");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/property-revenue", method = RequestMethod.GET)
	public ModelAndView revenueByProperties(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<RoomRevenue> revenues = propertyService.getPropertyWiseRevenue(admin.getClient_code());
			
		modelAndView.addObject("revenues", revenues);
		
		modelAndView.setViewName("/admin/properties/property-revenue");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/properties/room-revenue/{id}", method = RequestMethod.GET)
	public ModelAndView revenueByRooms(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<RoomRevenue> revenues = propertyService.getRoomWiseRevenue(admin.getClient_code(), id);
			
		modelAndView.addObject("revenues", revenues);
		
		modelAndView.setViewName("/admin/properties/room-revenue");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/mobile/user/properties/list", method = RequestMethod.GET)
	public ModelAndView userPropertiesList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		User user = (User) session.getAttribute("User");
		B2C_Details details = adminService.getB2CResidentDetails(user.getId());
		List<PG> pgs = propertyService.getActivePropertyListOfAdmin(details.getAdmin_id(), 0);
			
		modelAndView.addObject("properties", pgs);
		
		modelAndView.setViewName("/mobile/properties/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/mobile/user/properties/details/{id}", method = RequestMethod.GET)
	public ModelAndView propertyDetails(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);
		List<Beds> beds = propertyService.getBedsByProperty(id, "All");
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("beds", beds);		
		
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/mobile/properties/details");
		return modelAndView;
	}
	
	@RequestMapping(value = "/getPropertyOccupancy/{pg_id}", method = RequestMethod.GET)
	@ResponseBody
	public String getPropertyOccupancy(@PathVariable int pg_id, HttpSession session) {
		Integer rating = propertyService.getPropertyOccupancy(pg_id);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0";
		}
	}
	
	@RequestMapping(value = "/getPropertyTickets/{pg_id}", method = RequestMethod.GET)
	@ResponseBody
	public String getPropertyTickets(@PathVariable int pg_id, HttpSession session) {
		Integer rating = propertyService.getPropertyTickets(pg_id);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0";
		}
	}
	
}

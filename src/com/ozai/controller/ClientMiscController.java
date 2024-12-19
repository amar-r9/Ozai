package com.ozai.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.sql.Date;
import java.util.List;
import java.util.Map;

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

import com.ozai.model.GateRequests;
import com.ozai.beans.FCMMessageBean;
import com.ozai.beans.Notification;
import com.ozai.beans.Properties;
import com.ozai.beans.RoomRevenue;
import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Badges;
import com.ozai.model.Beds;
import com.ozai.model.ClientUser;
import com.ozai.model.ClientWorkSites;
import com.ozai.model.Cluster;
import com.ozai.model.DailyUpdates;
import com.ozai.model.Delivery;
import com.ozai.model.DeliveryUpdates;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.Inventory;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.ReportUser;
import com.ozai.model.RoomInventory;
import com.ozai.model.Rooms;
import com.ozai.model.TRIP_BOOKINGS;
import com.ozai.model.Vendor;
import com.ozai.service.PropertyService;
import com.ozai.service.UserService;
import com.ozai.service.B2CService;
import com.ozai.service.ClientExpenseService;
import com.ozai.service.ClientService;
import com.ozai.service.FCMService;
import com.ozai.service.OzaiService;
import com.ozai.util.OzaiUtil;
import com.ozai.model.UserComplaints;
import com.ozai.model.Transport;
import com.ozai.model.User;

@Controller
public class ClientMiscController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ClientService clientService;
	
	@Autowired 
	private UserService userService;
	
	@Autowired
	private OzaiService ozaiService;
	
	@Autowired
	private B2CService b2cService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	FCMService fcmService;

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
	
	private void uploadPropertyFile(String filename, MultipartFile image, int type) {
		File image_path = new File(servletContext.getRealPath("/") + "uploaded_files/DOC/" + type + "/" + filename);
		image_path.getParentFile().mkdirs();
		try {
			FileUtils.writeByteArrayToFile(image_path, image.getBytes());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/lct/properties/add-property", method = RequestMethod.GET)
	public ModelAndView addProperty(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Cluster> clusters = propertyService.getClustersByClient(admin.getClient_code());
		modelAndView.addObject("clusters", clusters);
		modelAndView.setViewName("/lct/properties/add-property");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/addProperty", method = RequestMethod.POST)
	public ModelAndView addVendor(@ModelAttribute PG property, @RequestParam("files") MultipartFile[] files, 
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		property.setClient_code(admin.getClient_code());
		int save = propertyService.addProperty(property);
		
		if (save!=0) {
			int fileCount = 1; // Counter for naming files
			// Handle file uploads
	        for (MultipartFile file : files) {
	            if (!file.isEmpty()) {
	                String originalFileName = file.getOriginalFilename();
					String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					// Construct new file name with increasing numbers
					String newFileName = fileCount + fileExtension;
					uploadPropertyFile(newFileName, file, save);
					//String filePath = "/path/to/upload/directory/" + newFileName;
					
					// Save the file to the specified location
					//file.transferTo(new File(filePath));
					
					fileCount++; // Increment counter for next file
	            }
	        }
	        modelAndView.setViewName("redirect:/lct/properties/list");
		} else {
			modelAndView.setViewName("/lct/properties/add-room");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/properties/add-room", method = RequestMethod.GET)
	public ModelAndView addRoom(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/properties/add-room");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/addRoom", method = RequestMethod.POST)
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
	
	
	@RequestMapping(value = "/lct/properties/list", method = RequestMethod.GET)
	public ModelAndView clientProperties(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
			
		modelAndView.addObject("properties", pgs);
		
		modelAndView.setViewName("/lct/properties/list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/details/{id}", method = RequestMethod.GET)
	public ModelAndView propertyDetails(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);
		List<Beds> beds = propertyService.getBedsByProperty(id, "All");
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("beds", beds);		
		
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/lct/properties/details");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/properties/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editProperty(@PathVariable("id") int id, HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		PG propertyDetails = propertyService.getPropertyDetails(id);	
		modelAndView.addObject("propertyDetails", propertyDetails);
		modelAndView.setViewName("/lct/properties/edit");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/properties/add-room/{pgId}", method = RequestMethod.GET)
	public ModelAndView addRoom(HttpSession session, @PathVariable int pgId) {
		ModelAndView modelAndView = new ModelAndView();
		List<Rooms> rooms = propertyService.getRoomsByProperty(pgId);
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("pgId", pgId);
		modelAndView.setViewName("/lct/properties/add-room");
		return modelAndView;
	
	}
	
	@RequestMapping(value = "/lct/properties/rooms-list/{id}", method = RequestMethod.GET)
	public ModelAndView roomsList(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);	
		modelAndView.addObject("rooms", rooms);
		
		modelAndView.setViewName("/lct/properties/rooms-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/edit-room/{id}", method = RequestMethod.GET)
	public ModelAndView roomsDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		
		Rooms room = propertyService.getRoomDetails(id);	
		modelAndView.addObject("room", room);
		List<RoomInventory> inventory = propertyService.getInventoryOfRoom(id);	
		modelAndView.addObject("inventory", inventory);
		List<B2C_Details> details = propertyService.getB2CResidentsOfRoom(id);	
		modelAndView.addObject("details", details);
		List<B2B_Details> bdetails = propertyService.getB2BResidentsOfRoom(id);	
		modelAndView.addObject("bdetails", bdetails);
		
		modelAndView.setViewName("/lct/properties/edit-room");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/add-bed/{pgId}", method = RequestMethod.GET)
	public ModelAndView addBed(HttpSession session, @PathVariable int pgId) {
		ModelAndView modelAndView = new ModelAndView();

		List<Rooms> rooms = propertyService.getRoomsByProperty(pgId);
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("pgId", pgId);
		modelAndView.setViewName("/lct/properties/add-bed");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/properties/beds-list", method = RequestMethod.GET)
	public ModelAndView bedsList(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		List<Beds> beds = propertyService.getBedsList();
			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/lct/properties/beds-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/beds-list/{id}", method = RequestMethod.GET)
	public ModelAndView bedsListByProperty(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();
		List<Beds> beds = propertyService.getBedsByProperty(id, "All");			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/lct/properties/beds-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/beds-stats", method = RequestMethod.GET)
	public ModelAndView bedsStats(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Properties> beds = propertyService.getClientPropertyList(admin.getClient_code());
			
		modelAndView.addObject("beds", beds);
		
		modelAndView.setViewName("/lct/properties/beds-stats");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/property-revenue", method = RequestMethod.GET)
	public ModelAndView revenueByProperties(HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<RoomRevenue> revenues = propertyService.getClientPropertyWiseRevenue(admin.getClient_code());
			
		modelAndView.addObject("revenues", revenues);
		
		modelAndView.setViewName("/lct/properties/property-revenue");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/room-revenue/{id}", method = RequestMethod.GET)
	public ModelAndView revenueByRooms(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView=new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<RoomRevenue> revenues = propertyService.getClientRoomWiseRevenue(admin.getClient_code(), id);
			
		modelAndView.addObject("revenues", revenues);
		
		modelAndView.setViewName("/lct/properties/room-revenue");
		return modelAndView;
		
	}
	
	/*
	 * @RequestMapping(value = "/lct/properties/details/{id}", method =
	 * RequestMethod.GET) public ModelAndView viewProperty(@PathVariable("id") int
	 * id, HttpSession session) {
	 * 
	 * ModelAndView modelAndView = new ModelAndView(); PG propertyDetails =
	 * propertyService.getPropertyDetails(id);
	 * 
	 * if (propertyDetails != null) { modelAndView.addObject("propertyDetails",
	 * propertyDetails); modelAndView.setViewName("/lct/properties/details"); return
	 * modelAndView; } else { modelAndView.addObject("propertyDetails", null);
	 * modelAndView.setViewName("/lct/properties/details"); return modelAndView; } }
	 */
	
	@RequestMapping(value = "/lct/updateProperty", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("pg") PG pg, BindingResult result,
			HttpSession session) throws IOException {
		
			ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
			ModelAndView modelAndView = new ModelAndView();			
		
			if(propertyService.updatePropertyDetails(pg)) {
				modelAndView.setViewName("redirect:/lct/properties/list");
			} else {
				modelAndView.setViewName("/lct/properties/details/"+pg.getId()+"");
			} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/properties/worksites", method = RequestMethod.GET)
	public ModelAndView worksites(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		
		List<ClientWorkSites> worksites = clientService.getClientWorkSites(admin.getClient_code());
		modelAndView.addObject("worksites", worksites);
		
		modelAndView.setViewName("/lct/properties/worksites");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/properties/worksites-distance", method = RequestMethod.GET)
	public ModelAndView worksitesDistance(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		
		List<ClientWorkSites> worksites = clientService.getClientWorkSites(admin.getClient_code());
		modelAndView.addObject("worksites", worksites);
		
		modelAndView.setViewName("/lct/properties/worksites-distance");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/properties/add-worksite", method = RequestMethod.GET)
	public ModelAndView addWorkSite(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("/lct/properties/add-worksite");
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/lct/addWorkSite", method = RequestMethod.POST)
	public String saveWorkSite(@ModelAttribute ClientWorkSites site, HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		site.setClient_code(admin.getClient_code());
		boolean save = clientService.addWorkSite(site);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/lct/properties/transport", method = RequestMethod.GET)
	public ModelAndView transport(HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ClientUser client = clientService.getClientUserRoleById(admin.getId());
		ModelAndView modelAndView = new ModelAndView();
		List<Transport> trips = clientService.getClientTripsList(admin.getClient_code());
		modelAndView.addObject("trips", trips);
		modelAndView.addObject("client", client);
		modelAndView.setViewName("/lct/properties/transport");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/saveRoute", method = RequestMethod.POST)
	public String saveRoute(@ModelAttribute Transport transport,
			HttpSession session) {
		
		String timeT = transport.getTime().toString();
		//notice.setPost_time(time);
		
		System.out.println("instant"+transport.getTime());
		transport.setTime(timeT);
		transport.setAvailable(transport.getSeats());
		boolean save = clientService.saveRouteForClient(transport);
		
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/lct/properties/maintenance", method = RequestMethod.GET)
	public ModelAndView maintenance(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/lct/properties/maintenance");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/properties/amenities", method = RequestMethod.GET)
	public ModelAndView amenities(HttpSession session) {
		
		ModelAndView modelAndView=new ModelAndView();
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		
		List<PG> pGs = propertyService.getClientPropertiesList(adminData.getClient_code());
			
		modelAndView.addObject("properties", pGs);
		
		modelAndView.setViewName("/lct/properties/amenities");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/residents/report-user/{id}", method = RequestMethod.GET)
	public ModelAndView residentReport(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		User details = userService.getUserDetailsById(id);
		
		modelAndView.addObject("details", details);
		
		String month = OzaiUtil.getCurrentMonth();
		modelAndView.addObject("month", month);
		
		if(clientService.checkUserReportForMonth(id, OzaiUtil.getCurrentMonth())) {
			modelAndView.addObject("exist", true);
		} else {
			modelAndView.addObject("exist", false);
		}
		
		List<ReportUser> reports = clientService.getUserReports(id);
		modelAndView.addObject("reports", reports);

		modelAndView.setViewName("/lct/residents/report-user");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/complaint-user/{id}", method = RequestMethod.GET)
	public ModelAndView residentComplaint(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		User details = userService.getUserDetailsById(id);
		
		modelAndView.addObject("details", details);
		
		List<UserComplaints> reports = clientService.getUserComplaints(id);
		modelAndView.addObject("reports", reports);

		modelAndView.setViewName("/lct/residents/complaint-user");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/complaintUser", method = RequestMethod.POST)
	public String userComplaints(@ModelAttribute UserComplaints report,
			HttpSession session) {
		
		boolean save = clientService.saveComplaintOnUser(report);
		
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/reportUser", method = RequestMethod.POST)
	public String userReport(@ModelAttribute ReportUser report,
			HttpSession session) {

		boolean save = clientService.saveUserReport(report);
		if (save) {
			if(report.getBehavior()==1 && report.getCleanliness()==1) {
				userService.updateUserRentalCreditScore(report.getUser_id(), 10, 1);
			} else if(report.getBehavior()==0 && report.getCleanliness()==0) {
				userService.updateUserRentalCreditScore(report.getUser_id(), 10, 0);
			}
			//fcmService.buildNotification(report.getUser().getdcUsername(), "Reported", "You have been reported by your admin.");
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/lct/properties/add-inventory/{id}", method = RequestMethod.GET)
	public ModelAndView propertyInventory(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ClientUser client = clientService.getClientUserRoleById(admin.getId());
		PG pg = propertyService.getPropertyDetails(id);
		modelAndView.addObject("pg", pg);
		
		List<Inventory> ins = propertyService.getInventoryOfProperty(id);
		modelAndView.addObject("ins", ins);
		modelAndView.addObject("client", client);

		modelAndView.setViewName("/lct/properties/add-inventory");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/addInventory", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/lct/properties/room-inventory/{id}", method = RequestMethod.GET)
	public ModelAndView roomInventory(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		
		Rooms room = propertyService.getRoomDetails(id);
		modelAndView.addObject("room", room);
		
		List<RoomInventory> ins = propertyService.getInventoryOfRoom(id);
		modelAndView.addObject("ins", ins);

		modelAndView.setViewName("/lct/properties/room-inventory");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/addRoomInventory", method = RequestMethod.POST)
	public String saveRoomInventory(@ModelAttribute RoomInventory inventory,
			HttpSession session) {
		
		String items = inventory.getItem();
		String[] itemsList = items.split(",");
		
		String quantities = inventory.getQuantity();
		String[] quantitiesList = quantities.split(",");
		
		for(int i=0; i<itemsList.length; i++){
		    inventory.setItem(itemsList [i]);
		    inventory.setQuantity(quantitiesList [i]);
		    propertyService.saveRoomInventory(inventory);
		}
		
		return "success";
	}
	
	@RequestMapping(value = "/lct/properties/trip-bookings", method = RequestMethod.GET)
	public ModelAndView bookings(HttpSession session) {
		
		ModelAndView modelAndView=new ModelAndView();
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		
		List<TRIP_BOOKINGS> trips = clientService.getBookingsList(adminData.getClient_code());
			
		modelAndView.addObject("trips", trips);
		
		modelAndView.setViewName("/lct/properties/trip-bookings");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/properties/trip-bookings/{trip_id}", method = RequestMethod.GET)
	public ModelAndView bookingsByTrip(HttpSession session, @PathVariable int trip_id) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		List<TRIP_BOOKINGS> trips = clientService.getBookingsListByTrip(trip_id);
			
		modelAndView.addObject("trips", trips);
		
		modelAndView.setViewName("/lct/properties/trip-bookings");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/events/delivery-updates", method = RequestMethod.GET)
	public ModelAndView deliveryUpdates(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<DeliveryUpdates> dels = propertyService.getDeliveryUpdatesByClient(admin.getClient_code());
		modelAndView.addObject("dels", dels);
		modelAndView.setViewName("/lct/events/delivery-updates");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/addDelivery", method = RequestMethod.POST)
	public String userReport(@ModelAttribute DeliveryUpdates inventory,
			HttpSession session) {
		
		
		   if(propertyService.saveDeliveryUpdate(inventory)) {
			   return "success";
		   } else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/lct/events/daily-updates", method = RequestMethod.GET)
	public ModelAndView updates(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		List<DailyUpdates> updates = propertyService.getDailyUpdatesOfClient(admin.getClient_code());
		modelAndView.addObject("updates", updates);
		modelAndView.setViewName("/lct/events/daily-updates");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/events/dailyUpdates", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView dailyUpdates(@RequestParam int property_id, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		//List<DailyUpdates> updates = ozaiService.getDailyUpdatesByClient(admin.getClient_code());
		//modelAndView.addObject("updates", updates);
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		List<Rooms> rooms = propertyService.getRoomsByProperty(property_id);
		modelAndView.addObject("rooms", rooms);
		modelAndView.addObject("property_id", property_id);
		List<DailyUpdates> updates = propertyService.getDailyUpdatesOfProperty(property_id);
		modelAndView.addObject("updates", updates);
		modelAndView.setViewName("/lct/events/daily-updates");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/events/updatesByDay", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView dayUpdates(@RequestParam Date submit_date, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		List<DailyUpdates> updates = propertyService.getDailyUpdatesOfDay(submit_date);
		modelAndView.addObject("updates", updates);
		modelAndView.setViewName("/lct/events/daily-updates");
		return modelAndView;

	}
	
	@RequestMapping(value = "/addDailyUpdate/{id}", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView saveDailyUpdate(@PathVariable int id,
			@RequestParam Map<String, String> paramsMap,
			RedirectAttributes redirectAttributes, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Rooms> rooms = propertyService.getRoomsByProperty(id);
		for(int j=0; j<rooms.size(); j++){
		
			DailyUpdates update = new DailyUpdates();
			String status = paramsMap.get("val" + (j + 1));
			update.setClient_code(admin.getClient_code());
			update.setAdmin_id(0);
			update.setEntry_by(admin.getName());
			update.setProperty_id(id);
			update.setStatus(status);
			update.setRoom_no(paramsMap.get("room" + (j + 1)));
			boolean save = ozaiService.addDailyUpdate(update);
		}
		modelAndView.addObject("saved", true);
		modelAndView.setViewName("redirect:/lct/events/daily-updates");
		return modelAndView;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/lct/getRecentPayments", method = RequestMethod.GET)
	public String getRecentPayments(HttpSession session) {

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientRecentB2CRentPayments(admin.getClient_code(), "Paid", 4);
		StringBuffer topBuffer=new StringBuffer();
		if(rents.isEmpty()){
			return "N/A";
		}else{
			//topBuffer.append("<div class=\"col-1\"></div>");
			for(B2C_Rents user:rents){
				topBuffer.append("<div class=\"col-3 text-center text-dark\">"+
						"<img class=\"img-circle\" style=\"width: 100%; border-radius: 50%;\"" + 
						"onerror=\"this.onerror=null; this.src='https://www.ozailiving.com/assets/images/profiledefault.png'\"" + 
						"src=\"https://www.ozailiving.com/profile-user/image/"+user.getUser_id()+"\"" + 
						"alt=\"User Pic\">"+
						"<p class=\"mb-0 mt-n2\"><small style=\"font-weight: 800;\">"+user.getUser().getName()+"</small></p>"+
						"<p class=\"mb-0 mt-n2\"><small style=\"font-weight: 700;\">"+user.getProperty().getName()+"</small></p>"+
						"<p class=\"mt-n2\"><small>AED "+user.getAmount()+"</small></p>"+
						"</div>");		
			}
			topBuffer.append("<div class=\"col-3 text-center\">"+
					"<a href=\"https://www.ozailiving.com/lct/residents/paid-rents\">"+
					"<img src=\"https://www.ozailiving.com/assets/images/more.png\" style=\"width: 100%;\" />"+
					"<br><p class=\"mb-0 mt-n2 text-dark fw-bold\">More</p></a></div>");
			return topBuffer.toString();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/lct/residents/assign-badge/{id}", method = RequestMethod.GET)
	public ModelAndView assignBadge(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		User details = userService.getUserDetailsById(id);
		
		modelAndView.addObject("details", details);
		
		String month = OzaiUtil.getCurrentMonth();
		modelAndView.addObject("month", month);	
		
		
		List<Badges> badges = clientService.getUserBadges(id);
		modelAndView.addObject("badges", badges);

		modelAndView.setViewName("/lct/residents/assign-badge");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/addBadgeToUser/{id}/{title}/{thismonth}", method = RequestMethod.GET)
	public ModelAndView userBadges(@PathVariable int id, @PathVariable String title, @PathVariable String thismonth,
			HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Badges badge = new Badges();
		badge.setMonth(thismonth);
		badge.setTitle(title);
		badge.setUser_id(id);
		System.out.println("Controller");
		if(clientService.checkBadgeExistForMonth(id, thismonth, title)) {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/lct/residents/assign-badge/"+badge.getUser_id()+"");
		} else {
			System.out.println("exist");
			boolean save = clientService.saveUserBadge(badge);
			if (save) {
				modelAndView.addObject("success", true);	
				modelAndView.setViewName("redirect:/lct/residents/assign-badge/"+badge.getUser_id()+"");
			}
		}
		
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/lct/gaterequests/add", method = RequestMethod.GET)
	public ModelAndView gateRequest(HttpSession session) {
		ClientUser userData = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView=new ModelAndView();
		List<B2B_Details> details = clientService.getAllResidentsByClient(userData.getClient_code());
		modelAndView.addObject("details", details);		
		modelAndView.setViewName("/lct/gaterequests/add");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value="/lct/addGateRequest", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView approveSociety(@ModelAttribute("request") GateRequests request, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		B2B_Details details = clientService.getResidentDetails(request.getUser_id());
		String message = null;
		if(request.getType().equalsIgnoreCase("Delivery")) {
    		message = "You have a delivery from "+request.getFrom()+" waiting for your approval.";
    	} else {
    		message = "Your guest "+request.getName()+" is waiting for your approval.";
    	}
		Integer save = clientService.addGateRequest(request);
		String link = "https://ozailiving.com/mobile/user/gaterequests/view/"+save+"";
		if(save!=0) {
			if(details != null && details.getUser() != null) {
				fcmService.buildNotificationForResident(details.getUser().getUsername(), "Gate Request Created", 
		                  message, link, "User");
			}
	        modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/lct/gaterequests/view/"+save+"");
		} else {
	        modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/lct");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/gaterequests/list", method = RequestMethod.GET)
	public ModelAndView societyApprovals(HttpSession session) {
		ClientUser user = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView=new ModelAndView();
		List<GateRequests> requests = clientService.getGateRequests(user.getClient_code(), "All", 0);
		modelAndView.addObject("requests", requests);
		
		modelAndView.setViewName("/lct/gaterequests/list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/gaterequests/view/{id}", method = RequestMethod.GET)
	public ModelAndView getResidentRequestView(@PathVariable int id, HttpSession session) {
	    ModelAndView modelAndView = new ModelAndView();
	    GateRequests request = clientService.getGateRequestDetails(id);
	    
	    User user = (User) session.getAttribute("User"); // Replace with your actual logic to get role

	    modelAndView.addObject("req", request); // Add user role to the model
	    modelAndView.setViewName("/lct/gaterequests/view");
	    return modelAndView;
	}

}

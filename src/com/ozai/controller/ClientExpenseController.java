package com.ozai.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ozai.beans.ExpenseList;
import com.ozai.beans.TicketsData;
import com.ozai.model.ClientUser;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;
import com.ozai.service.PropertyService;
import com.ozai.service.ClientExpenseService;
import com.ozai.service.ClientService;
import com.ozai.service.ExpenseService;
import com.ozai.service.OzaiService;
import com.ozai.util.OzaiUtil;

@Controller
public class ClientExpenseController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ClientExpenseService expenseService;
	
	@Autowired
	private ExpenseService finService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private ClientService clientService;

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
	
	@RequestMapping(value = "/lct/saveProcurementRequest", method = RequestMethod.POST)
	public ModelAndView saveProcurementRequest(
			@ModelAttribute("request") Procurement_Request request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		boolean id = expenseService.saveProcurementRequest(request);
		if (id) {
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/lct/services/requests-list");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/lct/expenses/add");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/services/requests-list", method = RequestMethod.GET)
	public ModelAndView requestsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Procurement_Request> requests = expenseService.getProcurementsRequestsByClient(admin.getClient_code());

		modelAndView.addObject("requests", requests);

		modelAndView.setViewName("/lct/services/requests-list");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/expenses", method = RequestMethod.GET)
	public String financeModuleLanding(ModelMap map) {
		return "/lct/expenses";
	}

	@RequestMapping(value = "/lct/expenses/add", method = RequestMethod.GET)
	public ModelAndView financeModule(HttpSession session) {
		
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ClientUser client = clientService.getClientUserRoleById(admin.getId());
		ModelAndView modelAndView = new ModelAndView();
		
		if(client.getAccess_level()==4 && client.getProperty()!=0) {		
			List<Products> services = expenseService.getProductsList();
			List<Vendor> vendors = expenseService.getVendorsList();
	
			modelAndView.addObject("services", services);
			modelAndView.addObject("vendors", vendors);
			modelAndView.addObject("client", client);
			modelAndView.addObject("property", client.getProperty());
			
		} else {		
			List<Products> services = expenseService.getProductsList();
			List<Vendor> vendors = expenseService.getVendorsList();
			List<PG> properties = propertyService.getClientPropertiesList(client.getClient_code());
	
			modelAndView.addObject("services", services);
			modelAndView.addObject("vendors", vendors);
			modelAndView.addObject("properties", properties);
			modelAndView.addObject("client", client);
			
		}
		modelAndView.setViewName("/lct/expenses/add");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/expenses/vendor-list", method = RequestMethod.GET)
	public ModelAndView financeModuleVendorList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Products> services = expenseService.getProductsList();
		List<Vendor> vendors = expenseService.getVendorsList();

		modelAndView.addObject("services", services);
		modelAndView.addObject("vendors", vendors);
		modelAndView.addObject("client", admin);

		modelAndView.setViewName("/lct/expenses/vendor-list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/expenses/edit-vendor/{id}", method = RequestMethod.GET)
	public ModelAndView updateVendorData(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		Vendor vendor = expenseService.getVendorDetails(id);
		
		modelAndView.addObject("services", services);
		modelAndView.addObject("vendor", vendor);

		modelAndView.setViewName("/lct/expenses/edit-vendor");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/expenses/update-vendor", method = RequestMethod.GET)
	public String getTenantRentStatus(@ModelAttribute("vendor") Vendor vendor, HttpSession session) {
		
		//OpsUser adminData = (OpsUser) session.getAttribute("OpsUser");
		if (expenseService.updateVendorDetails(vendor)) {
			return "success";
		} else {
			return "failed";
		}

	}

	@RequestMapping(value = "/lct/expenses/add-vendor", method = RequestMethod.GET)
	public ModelAndView financeModuleAllList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		List<Vendor> vendors = expenseService.getVendorsList();

		modelAndView.addObject("services", services);
		modelAndView.addObject("vendors", vendors);

		modelAndView.setViewName("/lct/expenses/add-vendor");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/expenses/list", method = RequestMethod.GET)
	public ModelAndView financeModulePaymentList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		if ("Admin".equalsIgnoreCase(admin.getRole()) && admin.getAccess_level() == 1 ) {
			List<Expenses> finances = expenseService.getPendingExpensesByClient(admin.getClient_code());
			List<ExpenseList> expenseData = expenseService.getCategoryWiseExpenseDataByClient(admin.getClient_code());
			String expenseChartData = OzaiUtil.buildExpenseDataForChart(expenseData);
			modelAndView.addObject("expenseChartData", expenseChartData);
			modelAndView.addObject("finances", finances);;
			List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("properties", properties);
		} else if ("Cluster head".equalsIgnoreCase(admin.getRole()) && admin.getAccess_level() == 2 ) {
			List<Expenses> finances = expenseService.getPendingExpensesByCluster(admin.getCluster_id());
			List<ExpenseList> expenseData = expenseService.getCategoryWiseExpenseDataByCluster(admin.getCluster_id());
			String expenseChartData = OzaiUtil.buildExpenseDataForChart(expenseData);
			modelAndView.addObject("expenseChartData", expenseChartData);
			modelAndView.addObject("finances", finances);
			List<PG> properties = propertyService.getPropertiesByCluster(admin.getCluster_id());
			modelAndView.addObject("properties", properties);
		} else {
			List<Expenses> finances = expenseService.getPendingExpensesOfMonthAndPropertyByClient(admin.getClient_code(), admin.getProperty(), "All");
			List<ExpenseList> expenseData = expenseService.getCategoryWiseExpenseDataByProperty(admin.getProperty());
			String expenseChartData = OzaiUtil.buildExpenseDataForChart(expenseData);
			modelAndView.addObject("expenseChartData", expenseChartData);
			modelAndView.addObject("finances", finances);
		}
		
		
		modelAndView.setViewName("/lct/expenses/list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/expenses/month-property/pending-list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView pendingByMonthAndProperty(HttpSession session, @RequestParam int property_id,
				@RequestParam String month) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		List<Expenses> finances = expenseService.getPendingExpensesOfMonthAndPropertyByClient(admin.getClient_code(), property_id, month);
		modelAndView.addObject("finances", finances);
		List<ExpenseList> expenseData = expenseService.getCategoryWiseExpenseDataByClientOnFilter(admin.getClient_code(), month, property_id);
		String expenseChartData = OzaiUtil.buildExpenseDataForChart(expenseData);
		modelAndView.addObject("expenseChartData", expenseChartData);
		if(property_id!=0) {
			PG property = propertyService.getPropertyDetails(property_id);
			modelAndView.addObject("pg", property.getName());
		}
		modelAndView.addObject("pg", "All");
		modelAndView.addObject("month", month);
		modelAndView.setViewName("/lct/expenses/list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/expenses/paid-list", method = RequestMethod.GET)
	public ModelAndView financeModulePaidList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		if ("Admin".equalsIgnoreCase(admin.getRole()) && admin.getAccess_level() == 1 ) {
			List<Expenses> finances = expenseService.getPaidExpensesByClient(admin.getClient_code());
			modelAndView.addObject("finances", finances);
			List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("properties", properties);
		} else if ("Cluster head".equalsIgnoreCase(admin.getRole()) && admin.getAccess_level() == 2 ) {
			List<Expenses> finances = expenseService.getPaidExpensesByCluster(admin.getCluster_id());
			modelAndView.addObject("finances", finances);
			List<PG> properties = propertyService.getPropertiesByCluster(admin.getCluster_id());
			modelAndView.addObject("properties", properties);
		} else {
			List<Expenses> finances = expenseService.getPaidExpensesOfMonthAndPropertyByClient(admin.getClient_code(), admin.getProperty(), "All");
			modelAndView.addObject("finances", finances);
		}		

		modelAndView.setViewName("/lct/expenses/paid-list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/expenses/month-property/paid-list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paidByMonthAndProperty(HttpSession session, @RequestParam int property_id,
				@RequestParam String month) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Expenses> finances = expenseService.getPaidExpensesOfMonthAndPropertyByClient(admin.getClient_code(), property_id, month);
		modelAndView.addObject("finances", finances);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/expenses/paid-list");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/expenses/approve-list", method = RequestMethod.GET)
	public ModelAndView financeModuleList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<Expenses> finances = expenseService.getPendingExpensesByClient(admin.getClient_code());

		modelAndView.addObject("finances", finances);

		modelAndView.setViewName("/lct/expenses/approve-list");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/savePurchase", method = RequestMethod.POST)
	public ModelAndView submitPurchase(
			@RequestParam(value = "expense_file") MultipartFile expense_file,
			@ModelAttribute("finance") Expenses finance, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		Integer maxId = expenseService.getExpenseMaxId();
		Integer code = 0;
		if(maxId==1) {
			code = maxId;
		} else {
			code = maxId+1;
		}
		finance.setApproved(0);
		finance.setApproved_by(null);
		finance.setStatus("Due");
		double total = (finance.getInvoice_amount() * (finance.getVat() / 100)) + finance.getInvoice_amount() + finance.getGst_amount();
		double truncatedTotal = Math.floor(total * 100) / 100;
		finance.setTotal(truncatedTotal);

		String filename = null;
		if (!expense_file.isEmpty()) {
			filename = code + expense_file.getOriginalFilename().substring(expense_file.getOriginalFilename().lastIndexOf('.'));
		}
		finance.setFilename(filename);
		boolean id = expenseService.savePurchase(finance);
		if (id) {
			uploadFile(filename, expense_file, "EXPENSES");
			modelAndView.addObject("success", true);
			modelAndView.setViewName("/lct/expenses/add");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/lct/expenses/add");
		}

		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/lct/approve-expense/{id}", method = RequestMethod.GET)
	public String getApproveExpense(@PathVariable int id, HttpSession session) {

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		if (expenseService.approveExpense(id, adminData.getUsername())) {
			return "Success";
		} else {
			return "Filed";
		}

	}
	
	@RequestMapping(value = "/lct/expenses/details/{id}", method = RequestMethod.GET)
	public ModelAndView expenseDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Expenses finance = expenseService.getExpenseDetails(id);
		List<ExpensePayments> payments = expenseService.getPaymentsForExpense(finance.getId());
		modelAndView.addObject("finance", finance);
		modelAndView.addObject("payments", payments);

		modelAndView.setViewName("/lct/expenses/details");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/expenses/update-payment/{id}", method = RequestMethod.GET)
	public ModelAndView updatePurchasePayment(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		Expenses finance = expenseService.getExpenseDetails(id);
		List<ExpensePayments> payments = expenseService.getPaymentsForExpense(finance.getId());
		modelAndView.addObject("finance", finance);
		modelAndView.addObject("payments", payments);
		Vendor vendor = new Vendor();
		double tdsAmount = 0;
		//vendor = expenseService.getVendorDetailsById(finance.getVendor_id());
		//modelAndView.addObject("vendor", vendor);
		tdsAmount = (finance.getInvoice_amount() * vendor.getApplicable_tds()) / 100;
		
		double totalAmount = Math.round(finance.getInvoice_amount() + finance.getGst_amount() - Math.round(tdsAmount));
		double totalAmountPaid = Math.round(expenseService.getTotalPaidForExpense(finance.getId()));
		double pendingAmount = Math.round(totalAmount - totalAmountPaid);
		System.out.println("Pending: " + pendingAmount);
		modelAndView.addObject("totalAmount", totalAmount);
		modelAndView.addObject("pendingAmount", pendingAmount);
		modelAndView.addObject("totalAmountPaid", totalAmountPaid);
		modelAndView.addObject("tdsAmount", tdsAmount);
		
		Date today = OzaiUtil.getCurrentDate();
		modelAndView.addObject("today", today);

		modelAndView.setViewName("/lct/expenses/update");
		return modelAndView;

	}

	@RequestMapping(value = "/lct/addPaymentDetails", method = RequestMethod.POST)
	public ModelAndView submitPaymentDetails(
			@RequestParam(value = "payment_file", required = true) MultipartFile payment_file,
			@ModelAttribute("payment") ExpensePayments payment, @RequestParam int no, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		double tds = Math.round((payment.getInvoice_amount() * payment.getApplicable_tds()) / 100);
		double total = Math.round(payment.getInvoice_amount() + payment.getGst_amount() - tds);
		payment.setTds_amount(Math.round(tds));
		payment.setAmount_tobe_paid(Math.round(total));
		payment.setAmount_cleared(Math.round(payment.getAmount_cleared() + payment.getAmount_paid()));
		payment.setPending_amount(Math.round(total - payment.getAmount_cleared()));
		Integer maxId = expenseService.getPaymentMaxId();
		int paymentId = maxId.intValue() + 1; // 9300000
		// String paymentId = "930" + payment.getTxn_ref_no().substring(0, 2);
		payment.setPaymentId(paymentId);
		String filename = null;
		if (!payment_file.isEmpty()) {
			filename = payment.getTxn_ref_no() + "." + payment_file.getOriginalFilename().split("\\.")[1];
		}
		payment.setScreen_shot(filename);
		boolean id = expenseService.savePaymentDetails(payment);
		if (id) {
			if (payment.getAmount_cleared() >= payment.getAmount_tobe_paid()) {
				boolean save = expenseService.updateExpenscePaymentStatus(payment.getExpense_id());
			}
			uploadFile(filename, payment_file, "PAYMENTS");
			modelAndView.addObject("added", true);
			return new ModelAndView("redirect:/lct/expenses/update-payment/" + no);
		} else {
			modelAndView.addObject("added", false);
			return new ModelAndView("redirect:/lct/expenses/update-payment/" + no);
		}

		// return modelAndView;
	}
	
	@RequestMapping(value = "/lct/expenses/vendor-expenses/{id}", method = RequestMethod.GET)
	public ModelAndView vendorData(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		List<Expenses> expenses = finService.getVendorExpenses(id);
		Vendor vendor = expenseService.getVendorDetails(id);
		
		modelAndView.addObject("vendor", vendor);
		modelAndView.addObject("expenses", expenses);

		modelAndView.setViewName("/lct/expenses/vendor-expenses");
		return modelAndView;

	}

}

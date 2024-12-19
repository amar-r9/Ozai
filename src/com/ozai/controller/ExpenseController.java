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

import com.ozai.model.Admin;
import com.ozai.model.ExpensePayments;
import com.ozai.model.Expenses;
import com.ozai.model.PG;
import com.ozai.model.Procurement_Request;
import com.ozai.model.Products;
import com.ozai.model.Vendor;
import com.ozai.service.PropertyService;
import com.ozai.service.ExpenseService;
import com.ozai.service.OzaiService;
import com.ozai.util.OzaiUtil;

@Controller
public class ExpenseController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ExpenseService expenseService;

	@Autowired
	private PropertyService propertyService;

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
	
	@RequestMapping(value = "/admin/saveProcurementRequest", method = RequestMethod.POST)
	public ModelAndView saveProcurementRequest(
			@ModelAttribute("request") Procurement_Request request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		boolean id = expenseService.saveProcurementRequest(request);
		if (id) {
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/admin/services/requests-list");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/admin/expenses/add");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/services/requests-list", method = RequestMethod.GET)
	public ModelAndView requestsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin admin = (Admin) session.getAttribute("AdminUser");
		List<Procurement_Request> requests = expenseService.getProcurementsRequestsByAdmin(admin.getClient_code());

		modelAndView.addObject("requests", requests);

		modelAndView.setViewName("/admin/services/requests-list");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/expenses", method = RequestMethod.GET)
	public String financeModuleLanding(ModelMap map) {
		return "/admin/expenses";
	}

	@RequestMapping(value = "/admin/expenses/add", method = RequestMethod.GET)
	public ModelAndView financeModule(HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		List<Vendor> vendors = expenseService.getVendorsList();
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);

		modelAndView.addObject("services", services);
		modelAndView.addObject("vendors", vendors);
		modelAndView.addObject("properties", properties);

		modelAndView.setViewName("/admin/expenses/add");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/expenses/vendor-list", method = RequestMethod.GET)
	public ModelAndView financeModuleVendorList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		List<Vendor> vendors = expenseService.getVendorsList();

		modelAndView.addObject("services", services);
		modelAndView.addObject("vendors", vendors);

		modelAndView.setViewName("/admin/expenses/vendor-list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/expenses/edit-vendor/{id}", method = RequestMethod.GET)
	public ModelAndView updateVendorData(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		Vendor vendor = expenseService.getVendorDetails(id);
		
		modelAndView.addObject("services", services);
		modelAndView.addObject("vendor", vendor);

		modelAndView.setViewName("/admin/expenses/edit-vendor");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/expenses/update-vendor", method = RequestMethod.GET)
	public String getTenantRentStatus(@ModelAttribute("vendor") Vendor vendor, HttpSession session) {
		
		//OpsUser adminData = (OpsUser) session.getAttribute("OpsUser");
		if (expenseService.updateVendorDetails(vendor)) {
			return "success";
		} else {
			return "failed";
		}

	}

	@RequestMapping(value = "/admin/expenses/add-vendor", method = RequestMethod.GET)
	public ModelAndView financeModuleAllList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		List<Products> services = expenseService.getProductsList();
		List<Vendor> vendors = expenseService.getVendorsList();

		modelAndView.addObject("services", services);
		modelAndView.addObject("vendors", vendors);

		modelAndView.setViewName("/admin/expenses/add-vendor");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/expenses/list", method = RequestMethod.GET)
	public ModelAndView financeModulePaymentList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");
		List<Expenses> finances = expenseService.getPendingExpensesByAdmin(adminData.getClient_code());

		modelAndView.addObject("finances", finances);

		modelAndView.setViewName("/admin/expenses/list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/expenses/paid-list", method = RequestMethod.GET)
	public ModelAndView financeModulePaidList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");
		List<Expenses> finances = expenseService.getPaidExpensesByAdmin(adminData.getClient_code());

		modelAndView.addObject("finances", finances);

		modelAndView.setViewName("/admin/expenses/paid-list");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/expenses/approve-list", method = RequestMethod.GET)
	public ModelAndView financeModuleList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		Admin adminData = (Admin) session.getAttribute("AdminUser");
		List<Expenses> finances = expenseService.getPendingExpensesByAdmin(adminData.getClient_code());

		modelAndView.addObject("finances", finances);

		modelAndView.setViewName("/admin/expenses/approve-list");
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/addVendor", method = RequestMethod.POST)
	public String addVendor(@ModelAttribute Vendor vendor, HttpSession session) {

		boolean save = expenseService.addVendor(vendor);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addVendor(@ModelAttribute Products product, HttpSession session) {

		boolean save = expenseService.addProduct(product);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/admin/savePurchase", method = {RequestMethod.GET, RequestMethod.POST})
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

		String filename = null;
		if (!expense_file.isEmpty()) {
			filename = code + expense_file.getOriginalFilename().substring(expense_file.getOriginalFilename().lastIndexOf('.'));
		}
		finance.setFilename(filename);
		boolean id = expenseService.savePurchase(finance);
		if (id) {
			uploadFile(filename, expense_file, "EXPENSES");
			modelAndView.addObject("success", true);
			modelAndView.setViewName("/admin/expenses/add");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/admin/expenses/add");
		}

		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/admin/approve-expense/{id}", method = RequestMethod.GET)
	public String getApproveExpense(@PathVariable int id, HttpSession session) {

		Admin adminData = (Admin) session.getAttribute("AdminUser");
		if (expenseService.approveExpense(id, adminData.getUsername())) {
			return "Success";
		} else {
			return "Filed";
		}

	}

	@RequestMapping(value = "/admin/expenses/update-payment/{id}", method = RequestMethod.GET)
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

		modelAndView.setViewName("/admin/expenses/update");
		return modelAndView;

	}

	@RequestMapping(value = "/admin/addPaymentDetails", method = RequestMethod.POST)
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
			return new ModelAndView("redirect:/admin/expenses/update-payment/" + no);
		} else {
			modelAndView.addObject("added", false);
			return new ModelAndView("redirect:/admin/expenses/update-payment/" + no);
		}

		// return modelAndView;
	}

}

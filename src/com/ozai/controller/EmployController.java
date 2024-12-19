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
import com.ozai.model.Employees;
import com.ozai.model.PG;
import com.ozai.model.SalaryExpense;
import com.ozai.model.SalaryPayments;
import com.ozai.service.AdminService;
import com.ozai.service.EmployService;
import com.ozai.service.PropertyService;
import com.ozai.util.OzaiUtil;

@Controller
public class EmployController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private AdminService adminService;

	@Autowired
	private EmployService employService;
	
	@Autowired
	private PropertyService propertyService;

	@RequestMapping(value = "/admin/employees/list", method = RequestMethod.GET)
	public ModelAndView employModule(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<Employees> employees = employService.getEmployeesListByAdmin(admin.getClient_code());

		modelAndView.addObject("employees", employees);

		modelAndView.setViewName("/admin/employees/list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/employees/salaries-to-be-generated/month", method = RequestMethod.GET)
	public ModelAndView salariesToBeGenerated(@RequestParam String month, HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<Employees> employees = employService.getSalariesToBeGeneratedForMonthByAdmin(month, admin.getClient_code());
		
		modelAndView.addObject("employees", employees);
		
		modelAndView.addObject("requestedMonth", month);
		
		modelAndView.setViewName("/admin/employees/pending-list");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/employees/edit/{id}", method = RequestMethod.GET)
	public ModelAndView employDetails(HttpSession session, @PathVariable int id) {
		
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		Employees employ = employService.getEmployDetails(id);
		modelAndView.addObject("employ", employ);

		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);

		modelAndView.setViewName("/admin/employees/edit");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/employees/move-out", method = RequestMethod.GET)
	public String tenantMovedOut(@RequestParam int id, @RequestParam java.sql.Date resign_date,
			HttpSession session) {

		//SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
		//Date moveOut = TikaanaUtil.convertStringToSqlDate(moveout);
		System.out.println("Controller"+id+ "\n Date" +resign_date);
		
		boolean save = employService.resignEmploy(id, resign_date);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/employees/update-employ", method = RequestMethod.GET)
	public String getTenantRentStatus(@ModelAttribute("employees") Employees employees, HttpSession session) {
		
		//Admin adminData = (Admin) session.getAttribute("AdminUser");
		if (employService.updateEmployDetails(employees)) {
			return "Paid";
		} else {
			return "Due";
		}

	}
	
	@RequestMapping(value = "/admin/update-employ", method = RequestMethod.POST)
	public ModelAndView updateEmployData(@ModelAttribute("employees") Employees employees, 
			HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		boolean update = employService.updateEmployDetails(employees);
		Employees employ = employService.getEmployDetails(employees.getId());
		if (update) {
			//uploadFile(filename, payment_file, "SALARIES");
			modelAndView.addObject("added", true);
			modelAndView.addObject("employ", employ);
			modelAndView.setViewName("/admin/employees/edit");
		} else {
			modelAndView.addObject("added", false);
			modelAndView.addObject("employ", employ);
			modelAndView.setViewName("/admin/employees/edit");
		}

		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/createSalaryExpense/{id}/{month}", method = RequestMethod.GET)
	public String getTenantRentStatus(@PathVariable int id, @PathVariable String month, HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		Employees employ = employService.getEmployDetails(id);
		SalaryExpense expense = new SalaryExpense();
		expense.setAdmin_id(admin.getClient_code());
		expense.setEmploy_id(id);
		double amounttobepaid = Math.round(employ.getSalary());
		
		expense.setPayment_due_date(OzaiUtil.getCurrentDate());
		expense.setService_month(month);
		expense.setEmploy_id(employ.getId());
		expense.setStatus("Due");
		expense.setAmount_to_be_paid(amounttobepaid);
		
		if(employService.expenseAlreadyExist(employ.getId(), month)) {
			return "Exist";
		} else {
			if (employService.createExpense(expense)) {
				return "Success";
			} else {
				return "Filed";
			}
		}
		
		

	}
	
	@RequestMapping(value = "/admin/employees/salary-list", method = RequestMethod.GET)
	public ModelAndView employModuleSalaryList(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<SalaryExpense> salaryDue = employService.getPendingSalariesByAdmin(admin.getClient_code()); 
		
		//modelAndView.addObject("rentPaid", rentPaid);
		modelAndView.addObject("salaryDue", salaryDue);
		
		modelAndView.setViewName("/admin/employees/salary-list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/employees/salary-list/month", method = RequestMethod.POST)
	public ModelAndView monthSalaryList(@RequestParam String month,
			HttpSession session) {
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<SalaryExpense> salaryPaid = employService.getSalariesPaidByMonthByAdmin(month, admin.getClient_code());
		List<SalaryExpense> salaryDue = employService.getSalariesDueByMonthByAdmin(month, admin.getClient_code());

		modelAndView.addObject("salaryPaid", salaryPaid);
		modelAndView.addObject("salaryDue", salaryDue);
		modelAndView.addObject("month", month);

		modelAndView.setViewName("/admin/employees/salary-list");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/employees/salary/{id}", method = RequestMethod.GET)
	public ModelAndView updateSalaryPayment(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		SalaryExpense expense = employService.getExpenseDetails(id);
		System.out.println("Employ Id:" +expense.getEmploy_id());
		List<SalaryPayments> payments = employService.getSalaryPaymentsForExpense(id);
		modelAndView.addObject("payments", payments);
		Employees employ = employService.getEmployDetails(expense.getEmploy_id());
		Integer maxId = employService.getPaymentMaxId();
		int paymentId = maxId.intValue()+1; //7300000
		double totalAmountPaid = Math.round(employService.getTotalPaidForExpense(id));
		double pendingAmount = Math.round(expense.getAmount_to_be_paid() - totalAmountPaid);
		modelAndView.addObject("pendingAmount", pendingAmount);
		modelAndView.addObject("totalAmountPaid", totalAmountPaid);
		modelAndView.addObject("expense", expense);
		modelAndView.addObject("employ", employ);
		modelAndView.addObject("paymentId", paymentId);
		Date today = OzaiUtil.getCurrentDate();
		modelAndView.addObject("today", today);

		modelAndView.setViewName("/admin/employees/salary");
		return modelAndView;

	}
	
	@RequestMapping(value = "/admin/addSalaryPayment", method = RequestMethod.POST)
	public ModelAndView submitRentPayment(
			@RequestParam(value = "payment_file", required = true) MultipartFile payment_file,
			@ModelAttribute("payment") SalaryPayments payment, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("Controller");
		Integer maxId = employService.getPaymentMaxId();
		int paymentId = maxId.intValue()+1; //7300000
		//double totalAmount = Math.round(payment.getRent() - Math.round(payment.getTds_amount()) + Math.round(payment.getGst_amount()));
		payment.setAmount_cleared(Math.round(payment.getAmount_cleared() + payment.getAmount_paid()));
		payment.setPending_amount(Math.round(payment.getAmount_to_be_paid() - payment.getAmount_paid()));
		String filename = null;
		if (!payment_file.isEmpty()) {
			filename = paymentId + "." + payment_file.getOriginalFilename().split("\\.")[1];
		}
		
		payment.setScreen_shot(filename);
		boolean id = employService.saveSalaryPayment(payment);
		if (id) {
			if (payment.getAmount_cleared() >= payment.getAmount_to_be_paid()) {
				boolean save = employService.updateExpenscePaymentStatus(payment.getExpense_id());
			}
			uploadFile(filename, payment_file, "SALARIES");
			modelAndView.addObject("added", true);
			modelAndView.setViewName("redirect:/admin/employees/salary-list?saved=true");
		} else {
			modelAndView.addObject("added", false);
			modelAndView.setViewName("redirect:/admin/employees/salary-list?saved=false");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/employees/salary-paid", method = RequestMethod.GET)
	public ModelAndView propertyModuleRentsPaidList(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<SalaryExpense> salaryPaid = employService.getPaidSalariesByAdmin(admin.getClient_code());
		
		modelAndView.addObject("salaryPaid", salaryPaid);
		
		modelAndView.setViewName("/admin/employees/salary-paid");
		return modelAndView;
		
	}

	@RequestMapping(value = "/admin/employees/payment-list", method = RequestMethod.GET)
	public ModelAndView employModulePaymentList(HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();

		List<SalaryPayments> salaries = employService.getEmploySalaryListByAdmin(admin.getClient_code());

		modelAndView.addObject("salaries", salaries);

		modelAndView.setViewName("/admin/employees/payment-list");
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
  	
  	@RequestMapping(value = "/admin/employees/add", method = RequestMethod.GET)
	public ModelAndView employModuleAdd(HttpSession session) {
  		Admin admin = (Admin) session.getAttribute("AdminUser");
		ModelAndView modelAndView = new ModelAndView();
		List<PG> properties = propertyService.getActivePropertyListOfAdmin(admin.getClient_code(), 0);
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/admin/employees/add");
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/addEmploy", method = {RequestMethod.POST, RequestMethod.GET})
	public String addEmploy(@ModelAttribute Employees employ, HttpSession session) {

		boolean save = employService.addEmploy(employ);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
  

}

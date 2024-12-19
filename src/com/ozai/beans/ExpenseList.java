package com.ozai.beans;

import java.sql.Date;

public class ExpenseList {

	private int id;
	private int expense_id;
	private String category;
	private String material;
	private String property;
	private String client;
	private String month;
	private String year;
	private double invoice_amount;
	private double tds_amount;
	private double gst_amount;
	private double total_amount;
	private String status;
	private Date paid_date;
	private String city;
	private String state;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public double getTds_amount() {
		return tds_amount;
	}

	public void setTds_amount(double tds_amount) {
		this.tds_amount = tds_amount;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getExpense_id() {
		return expense_id;
	}

	public void setExpense_id(int expense_id) {
		this.expense_id = expense_id;
	}

	public double getInvoice_amount() {
		return invoice_amount;
	}

	public void setInvoice_amount(double invoice_amount) {
		this.invoice_amount = invoice_amount;
	}

	public double getGst_amount() {
		return gst_amount;
	}

	public void setGst_amount(double gst_amount) {
		this.gst_amount = gst_amount;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

}

package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "EXPENSES")
public class Expenses implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "SERVICE_MONTH")
	private String service_month;
	
	@Column(name = "SERVICE_TYPE")
	private String service_type;

	@Column(name = "VENDOR_ID")
	private int vendor_id;
	
	@Column(name = "PROPERTY_CODE")
	private int property_code;
	
	@Column(name = "VENDOR_INVOICE_NO")
	private String vendor_invoice_no;
	
	@Column(name = "VENDOR_INVOICE_DATE")
	private Date vendor_invoice_date;
	
	@Column(name = "INVOICE_AMOUNT")
	private double invoice_amount;
	
	@Column(name = "GST_AMOUNT")
	private double gst_amount;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "VAT")
	private float vat;

	@Column(name = "PAYMENT_DUE_DATE")
	private String payment_due_date;
	
	@Column(name = "MATERIAL_PURCHASED")
	private String material_purchased;
	
	@Column(name = "SUBMIT_DATE")
	private Date submit_date;
	
	@Column(name = "ENTRY_BY")
	private String entry_by;
	
	@Column(name = "APPROVED")
	private int approved;
	
	@Column(name = "APPROVED_BY")
	private String approved_by;
	
	@Column(name = "FILENAME")
	private String filename;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "CLEARED_ON")
	private Date cleared_on;
	
	@Column(name = "TOTAL")
	private double total;
	
	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	
	
	@ManyToOne(targetEntity = Vendor.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "VENDOR_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Vendor vendor;
	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_CODE", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}
	
	
	public Expenses() {
		setSubmit_date(OzaiUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getService_month() {
		return service_month;
	}

	public void setService_month(String service_month) {
		this.service_month = service_month;
	}

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	public int getProperty_code() {
		return property_code;
	}

	public void setProperty_code(int property_code) {
		this.property_code = property_code;
	}

	public String getVendor_invoice_no() {
		return vendor_invoice_no;
	}

	public void setVendor_invoice_no(String vendor_invoice_no) {
		this.vendor_invoice_no = vendor_invoice_no;
	}

	public Date getVendor_invoice_date() {
		return vendor_invoice_date;
	}

	public void setVendor_invoice_date(Date vendor_invoice_date) {
		this.vendor_invoice_date = vendor_invoice_date;
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

	public String getPayment_due_date() {
		return payment_due_date;
	}

	public void setPayment_due_date(String payment_due_date) {
		this.payment_due_date = payment_due_date;
	}

	public String getMaterial_purchased() {
		return material_purchased;
	}

	public void setMaterial_purchased(String material_purchased) {
		this.material_purchased = material_purchased;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public String getEntry_by() {
		return entry_by;
	}

	public void setEntry_by(String entry_by) {
		this.entry_by = entry_by;
	}

	public int getApproved() {
		return approved;
	}

	public void setApproved(int approved) {
		this.approved = approved;
	}

	public String getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCleared_on() {
		return cleared_on;
	}

	public void setCleared_on(Date cleared_on) {
		this.cleared_on = cleared_on;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public int getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public float getVat() {
		return vat;
	}

	public void setVat(float vat) {
		this.vat = vat;
	}

}

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
@Table(name = "DELIVERY")
public class Delivery implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "SERVICE_MONTH")
	private String service_month;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "PG_ID")
	private int pg_id;
	
	@Column(name = "INVOICE_NO")
	private String invoice_no;
	
	@Column(name = "INVOICE_DATE")
	private Date invoice_date;
	
	@Column(name = "INVOICE_AMOUNT")
	private double invoice_amount;
	
	@Column(name = "GST_AMOUNT")
	private double gst_amount;
	
	@Column(name = "DELIVERY_DATE")
	private Date delivery_date;
	
	@Formula("invoice_amount + gst_amount")
	private double total;
	
	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	
	@Column(name = "SUBMIT_DATE")
	private Date submit_date;
	
	@Column(name = "ENTRY_BY")
	private String entry_by;
	
	@Column(name = "FILENAME")
	private String filename;
	
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PG_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG pg;
	public PG getPg() {
		return pg;
	}

	public void setPg(PG pg) {
		this.pg = pg;
	}
	
	
	public Delivery() {
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPg_id() {
		return pg_id;
	}

	public void setPg_id(int pg_id) {
		this.pg_id = pg_id;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public Date getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}

	public Date getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}

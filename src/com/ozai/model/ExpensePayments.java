package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "EXPENSE_PAYMENTS")
public class ExpensePayments implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "PAYMENT_ID")
	private int paymentId;

	@Column(name = "EXPENSE_ID")
	private int expense_id;
	
	@Column(name = "INVOICE_AMOUNT")
	private double invoice_amount;
	
	@Column(name = "GST_AMOUNT")
	private double gst_amount;
	
	@Column(name = "APPLICABLE_TDS")
	private double applicable_tds;
	
	@Column(name = "TDS_AMOUNT")
	private double tds_amount;
	
	@Column(name = "AMOUNT_TOBE_PAID")
	private double amount_tobe_paid;
	
	@Column(name = "AMOUNT_CLEARED")
	private double amount_cleared;
	
	@Column(name = "PENDING_AMOUNT")
	private double pending_amount;

	@Column(name = "PAYMENT_DATE")
	private Date payemnt_date;
	
	@Column(name = "AMOUNT_PAID")
	private double amount_paid;
	
	@Column(name = "TXN_REF_NO")
	private String txn_ref_no;

	@Column(name = "PAYMENT_STATUS")
	private String payment_status;
	
	@Column(name = "SCREEN_SHOT")
	private String screen_shot;
	
	
	@ManyToOne(targetEntity = Expenses.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "EXPENSE_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Expenses expense;
	public Expenses getExpense() {
		return expense;
	}

	public void setExpense(Expenses expense) {
		this.expense = expense;
	}
	
	
	public ExpensePayments() {
		//date = TikaanaUtil.getCurrentDate();
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
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

	public double getApplicable_tds() {
		return applicable_tds;
	}

	public void setApplicable_tds(double applicable_tds) {
		this.applicable_tds = applicable_tds;
	}

	public double getTds_amount() {
		return tds_amount;
	}

	public void setTds_amount(double tds_amount) {
		this.tds_amount = tds_amount;
	}

	public double getAmount_tobe_paid() {
		return amount_tobe_paid;
	}

	public void setAmount_tobe_paid(double amount_tobe_paid) {
		this.amount_tobe_paid = amount_tobe_paid;
	}

	public double getAmount_cleared() {
		return amount_cleared;
	}

	public void setAmount_cleared(double amount_cleared) {
		this.amount_cleared = amount_cleared;
	}

	public double getPending_amount() {
		return pending_amount;
	}

	public void setPending_amount(double pending_amount) {
		this.pending_amount = pending_amount;
	}

	public Date getPayemnt_date() {
		return payemnt_date;
	}

	public void setPayemnt_date(Date payemnt_date) {
		this.payemnt_date = payemnt_date;
	}

	public double getAmount_paid() {
		return amount_paid;
	}

	public void setAmount_paid(double amount_paid) {
		this.amount_paid = amount_paid;
	}

	public String getTxn_ref_no() {
		return txn_ref_no;
	}

	public void setTxn_ref_no(String txn_ref_no) {
		this.txn_ref_no = txn_ref_no;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getScreen_shot() {
		return screen_shot;
	}

	public void setScreen_shot(String screen_shot) {
		this.screen_shot = screen_shot;
	}

}

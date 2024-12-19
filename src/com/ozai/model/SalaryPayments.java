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
@Table(name = "SALARY_PAYMENTS")
public class SalaryPayments implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;

	@Column(name = "EMPLOY_ID")
	private int employ_id;
	
	@Column(name = "EXPENSE_ID")
	private int expense_id;
	
	@Column(name = "AMOUNT_TO_BE_PAID")
	private double amount_to_be_paid;
	
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
	
	
	
	@ManyToOne(targetEntity = Employees.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "EMPLOY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Employees employ;
	public Employees getEmploy() {
		return employ;
	}

	public void setEmploy(Employees employ) {
		this.employ = employ;
	}
	
	@ManyToOne(targetEntity = SalaryExpense.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "EXPENSE_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private SalaryExpense expense;
	public SalaryExpense getExpense() {
		return expense;
	}

	public void setExpense(SalaryExpense expense) {
		this.expense = expense;
	}
	
	
	
	public SalaryPayments() {
		//date = TikaanaUtil.getCurrentDate();
	}

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public int getEmploy_id() {
		return employ_id;
	}

	public void setEmploy_id(int employ_id) {
		this.employ_id = employ_id;
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

	public int getExpense_id() {
		return expense_id;
	}

	public void setExpense_id(int expense_id) {
		this.expense_id = expense_id;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public double getAmount_to_be_paid() {
		return amount_to_be_paid;
	}

	public void setAmount_to_be_paid(double amount_to_be_paid) {
		this.amount_to_be_paid = amount_to_be_paid;
	}

}

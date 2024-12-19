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
@Table(name = "PERSONAL_INSURANCE")
public class Insurance implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;
	
	@Column(name = "SUBMIT_DATE")
	private Date submit_date;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "AGE")
	private int age;
	
	
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Insurance() {
		setSubmit_date(OzaiUtil.getCurrentDate());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
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
@Table(name = "ADMIN_STATUS")
public class AdminStatus implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;

	@Column(name = "WHITE_LABEL")
	private int white_label;

	@Column(name = "STATUS")
	private String status;	
	
	
	public AdminStatus() {
		
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

	
	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	
	public int getWhite_label() {
		return white_label;
	}

	public void setWhite_label(int white_label) {
		this.white_label = white_label;
	}

}

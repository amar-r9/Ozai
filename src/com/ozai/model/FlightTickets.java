package com.ozai.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "flight_tickets")

public class FlightTickets implements Serializable
{
	
	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "location_from", nullable = false)
    private String from;

    @Column(name = "location_to", nullable = false)
    private String to;

    @Column(name = "date", nullable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    @Column(name = "number_of_tickets", nullable = false)
    private int numberOfTickets;
    
	@Column(name = "user_id", nullable = false)
	private int userId;
	
	@Column(name = "client_code", nullable = false)
	private int clientCode;

	
	

	public Long getId() {
		return id;
	}




	public void setId(Long id) {
		this.id = id;
	}




	public String getFrom() {
		return from;
	}




	public void setFrom(String from) {
		this.from = from;
	}




	public String getTo() {
		return to;
	}




	public void setTo(String to) {
		this.to = to;
	}




	public Date getDate() {
		return date;
	}




	public void setDate(Date date) {
		this.date = date;
	}




	public int getNumberOfTickets() {
		return numberOfTickets;
	}




	public void setNumberOfTickets(int numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}




	public int getUserId() {
		return userId;
	}




	public void setUserId(int userId) {
		this.userId = userId;
	}




	public int getClientCode() {
		return clientCode;
	}




	public void setClientCode(int clientCode) {
		this.clientCode = clientCode;
	}
	
	

	public FlightTickets(Long id, String from, String to, Date date, int numberOfTickets, int userId, int clientCode) {
		super();
		this.id = id;
		this.from = from;
		this.to = to;
		this.date = date;
		this.numberOfTickets = numberOfTickets;
		this.userId = userId;
		this.clientCode = clientCode;
	}


	

	public FlightTickets() {
		super();
	}


	@Override
	public String toString() {
		return "FlightTickets [id=" + id + ", from=" + from + ", to=" + to + ", date=" + date + ", numberOfTickets="
				+ numberOfTickets + ", userId=" + userId + ", clientCode=" + clientCode + "]";
	}
	

	
}
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

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name = "EVENTS")
public class Event implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "TITLE")
    private String title;

    @Column(name = "SUMMARY")
    private String summary;

    @Column(name = "PROPERTY_ID")
    private int property_id;

    @Column(name = "LOCATION")
    private String location;

    @Column(name = "DATE")
    private Date date;

    @Column(name = "ADMIN_ID")
    private int admin_id;

    @Column(name = "CLIENT_CODE")
    private int client_code;

    @Column(name = "STATUS")
    private String status;

    @Column(name = "FILENAME")
    private String filename;

    // ManyToOne relationship with PG (Properties) entity
    @ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
    private PG property;

    // Getter and Setter for property
    public PG getProperty() {
        return property;
    }

    public void setProperty(PG property) {
        this.property = property;
    }

    // Constructor
    public Event() {
        // No-argument constructor for entity initialization
    }

    // Getters and Setters for other fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getClient_code() {
        return client_code;
    }

    public void setClient_code(int client_code) {
        this.client_code = client_code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
}

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

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "PROPERTIES")
public class PG implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "LOCATION")
	private String location;

	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "CITY")
	private String city;
	
	@Column(name = "COUNTRY")
	private String country;
	
	@Column(name = "STATE")
	private String state;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "SINGLE_SHARE")
	private String single_share;
	
	@Column(name = "DOUBLE_SHARE")
	private String double_share;
	
	@Column(name = "TRIPLE_SHARE")
	private String triple_share;
	
	@Column(name = "FOUR_SHARE")
	private String four_share;

	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "MAP")
	private String map;
	
	@Column(name = "CLIENT_TYPE")
	private String client_type;
	
	@Column(name = "CLIENT")
	private String client;
	
	@Column(name = "ROOMS")
	private int rooms;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	@Column(name = "LAN")
	private String lan;
	
	@Column(name = "LAT")
	private String lat;
	
	@Column(name = "CLUSTER_ID")
	private int cluster_id;
	
	public PG() {
		
	}
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = Cluster.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "CLUSTER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	private Cluster cluster; 
	
	public Cluster getCluster() {
		return cluster;
	}
	  
	public void setCluster(Cluster cluster) { 
		this.cluster = cluster; 
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSingle_share() {
		return single_share;
	}

	public void setSingle_share(String single_share) {
		this.single_share = single_share;
	}

	public String getDouble_share() {
		return double_share;
	}

	public void setDouble_share(String double_share) {
		this.double_share = double_share;
	}

	public String getTriple_share() {
		return triple_share;
	}

	public void setTriple_share(String triple_share) {
		this.triple_share = triple_share;
	}

	public String getFour_share() {
		return four_share;
	}

	public void setFour_share(String four_share) {
		this.four_share = four_share;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}
	
	public String getClient_type() {
		return client_type;
	}

	public void setClient_type(String client_type) {
		this.client_type = client_type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public int getRooms() {
		return rooms;
	}

	public void setRooms(int rooms) {
		this.rooms = rooms;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public String getLan() {
		return lan;
	}

	public void setLan(String lan) {
		this.lan = lan;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public int getCluster_id() {
		return cluster_id;
	}

	public void setCluster_id(int cluster_id) {
		this.cluster_id = cluster_id;
	}

}

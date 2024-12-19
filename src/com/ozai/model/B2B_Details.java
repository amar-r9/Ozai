package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

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
@Table(name = "B2B_DETAILS")
public class B2B_Details implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "JOINING_DATE")
	private Date joining_date;
	
	@Column(name = "ROOM_ID")
	private int room_id;
	
	@Column(name = "BED_ID")
	private int bed_id;
	
	@Column(name = "SHARING")
	private int sharing;
	
	@Column(name = "PROPERTY_ID")
	private int property_id;
	
	@Column(name = "EMPLOY_ID")
	private String employ_id;
	
	@Column(name = "WORK_SITE")
	private String work_site;
	
	@Column(name = "CONTRACT")
	private String contract;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "MOVEOUT_DATE")
	private Date moveout_date;
	
	@Column(name = "ADMIN_ID")
	private int admin_id;
	
	@Column(name = "CLIENT_CODE")
	private int client_code;
	
	
	@ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne(targetEntity = PG.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "PROPERTY_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private PG property;
	public PG getProperty() {
		return property;
	}

	public void setProperty(PG property) {
		this.property = property;
	}
	
	@ManyToOne(targetEntity = Rooms.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "ROOM_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Rooms room;
	public Rooms getRoom() {
		return room;
	}

	public void setRoom(Rooms room) {
		this.room = room;
	}
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne(targetEntity = Beds.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "BED_ID", referencedColumnName = "ID", insertable = false, updatable = false)
	
	private Beds bed;
	public Beds getBed() {
		return bed;
	}

	public void setBed(Beds bed) {
		this.bed = bed;
	}

	public B2B_Details() {
		//setPosted_date(CultodeUtil.getCurrentDate());
		//setPoints(0);
		//setViews(0);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getJoining_date() {
		return joining_date;
	}

	public void setJoining_date(Date joining_date) {
		this.joining_date = joining_date;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public int getSharing() {
		return sharing;
	}

	public void setSharing(int sharing) {
		this.sharing = sharing;
	}

	public String getWork_site() {
		return work_site;
	}

	public void setWork_site(String work_site) {
		this.work_site = work_site;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getMoveout_date() {
		return moveout_date;
	}

	public void setMoveout_date(Date moveout_date) {
		this.moveout_date = moveout_date;
	}

	public int getProperty_id() {
		return property_id;
	}

	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public int getClient_code() {
		return client_code;
	}

	public void setClient_code(int client_code) {
		this.client_code = client_code;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getEmploy_id() {
		return employ_id;
	}

	public void setEmploy_id(String employ_id) {
		this.employ_id = employ_id;
	}

	public int getBed_id() {
		return bed_id;
	}

	public void setBed_id(int bed_id) {
		this.bed_id = bed_id;
	}

}

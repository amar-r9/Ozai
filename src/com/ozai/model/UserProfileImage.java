package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "USER_IMAGE")

@SecondaryTable(name = "USER_IMAGE")
@org.hibernate.annotations.Table(appliesTo = "USER_IMAGE", fetch = FetchMode.SELECT, optional = true)
public class UserProfileImage implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private byte[] image;

	// private User user;

	/*
	 * @Id
	 * 
	 * @Column(name = "id", unique = true, nullable = false)
	 * 
	 * @GeneratedValue(generator = "gen")
	 * 
	 * @GenericGenerator(name = "gen", strategy = "foreign", parameters =
	 * 
	 * @Parameter(name = "property", value = "user"))
	 */

	@Id

	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(table = "USER_IMAGE")
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	/*
	 * @OneToOne
	 * 
	 * @PrimaryKeyJoinColumn public User getUser() { return user; }
	 * 
	 * public void setUser(User user) { this.user = user; }
	 */

	@Override
	public String toString() {
		return "UserImage";
	}

}

package com.ozai.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "COREUSER_IMAGE")

@SecondaryTable(name = "COREUSER_IMAGE")
@org.hibernate.annotations.Table(appliesTo = "COREUSER_IMAGE", fetch = FetchMode.SELECT, optional = true)
public class CoreUserImage implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private byte[] image;

	//private Admin admin;

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

	@Column(table = "COREUSER_IMAGE")
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	/*
	 * @OneToOne
	 * 
	 * @PrimaryKeyJoinColumn public Admin getAdmin() { return admin; }
	 * 
	 * public void setAdmin(Admin admin) { this.admin = admin; }
	 */

	@Override
	public String toString() {
		return "CoerUserImage";
	}

}

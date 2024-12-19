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

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "TALENT")
public class Talent implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TALENT_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "ORGANIZATION")
	private String organization;
	
	@Column(name = "CATEGORY")
	private String category;
	
	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "SUBMIT_DATE")
	private Date submit_date;

	@Column(name = "SUBMISSION_FILE_NAME")
	private String submission_file_name;
	
	@Column(name = "SUMMARY")
	private String summary;
	
	@Column(name = "VIEWS")
	private int views;
	
	@Column(name = "POINTS")
	private int points;
	
	@Column(name = "SELECTED")
	private int selected;
	
	@Column(name = "REJECTED")
	private int rejected;
	
	@Column(name = "UPDATED_BY")
	private String updated_by;
	
	@Column(name = "COMMENTS")
	private String comments;
	
	public Talent() {
		setSubmit_date(OzaiUtil.getCurrentDate());
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

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSubmission_file_name() {
		return submission_file_name;
	}

	public void setSubmission_file_name(String submission_file_name) {
		this.submission_file_name = submission_file_name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public int getRejected() {
		return rejected;
	}

	public void setRejected(int rejected) {
		this.rejected = rejected;
	}

	public String getUpdated_by() {
		return updated_by;
	}

	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

}

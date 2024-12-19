package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "BLOG_ARTICLES")
public class BlogArticle implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ARTICLE_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int article_id;

	@Column(name = "ARTICLE_CATEGORY")
	private String article_category;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "SUMMARY")
	private String summary;

	@Column(name = "CONTENT")
	private String content;
	
	@Column(name = "TAGS")
	private String tags;

	@Column(name = "DATE_CREATED")
	private String date_created;

	@Column(name = "USER_SAVED")
	private String user_saved;
	
	@Column(name = "VIEWS")
	private int views;

	public BlogArticle() {
		//date_created = TikaanaUtil.getCurrentDate();
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getArticle_category() {
		return article_category;
	}

	public void setArticle_category(String article_category) {
		this.article_category = article_category;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getDate_created() {
		return date_created;
	}

	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}

	public String getUser_saved() {
		return user_saved;
	}

	public void setUser_saved(String user_saved) {
		this.user_saved = user_saved;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

}

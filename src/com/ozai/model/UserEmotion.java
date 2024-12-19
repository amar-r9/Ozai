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
@Table(name = "user_emotion")
public class UserEmotion implements Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column(name = "user_id", nullable = false)
    private int userId;
    
	@Column(name = "client_code", nullable = false)
	private int clientCode;
    
    @Column(name = "emotion", nullable = false)
    private String emotion;
    
    @Column(name = "date", nullable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public UserEmotion(Long id, int userId, int clientCode, String emotion, Date date) {
		super();
		this.id = id;
		this.userId = userId;
		this.clientCode = clientCode;
		this.emotion = emotion;
		this.date = date;
	}

	public UserEmotion() {
		super();
	}

	@Override
	public String toString() {
		return "UserEmotion [id=" + id + ", userId=" + userId + ", clientCode=" + clientCode + ", emotion=" + emotion
				+ ", date=" + date + "]";
	}
}

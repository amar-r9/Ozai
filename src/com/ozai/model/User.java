package com.ozai.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.ozai.util.OzaiUtil;

@Entity
@Table(name = "USER")
@SecondaryTables({
	@SecondaryTable(name = "USER_IMAGE", pkJoinColumns = { @PrimaryKeyJoinColumn(name = "id", referencedColumnName = "id") }) })
public class User implements Serializable {

	public interface SaveUser {
	};

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String username;
	private String password;
	private String countryCode;
	private String mobile;
	private String email;
	private Date reg_date;
	private String id_file_name;
	private String state;
	private String city;
	private String country;
	private String is_resident;
	private String resident_type;	
	private String gender;	
	private Date dob;
	private int login_count;
	private byte[] image;
	private int points;
	private String company;
	private String qualification;
	private String college;
	private String job_role;
	private String hometown;
	private int sports;
	private int movies;
	private int arts;
	private int news;
	private int technology;
	private String language;
	private String food_preferences;
	private int active;
	
	/*
	 * @ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
	 * 
	 * @JoinColumn(name = "ID", referencedColumnName = "USER_ID", insertable =
	 * false, updatable = false) private User_Ratings rating;
	 * 
	 * public User_Ratings getRating() { return rating; } public void
	 * setRating(User_Ratings rating) { this.rating = rating; }
	 */	
	
	public User() {
		setReg_date(OzaiUtil.getCurrentDate());
		setIs_resident("NO");
		setResident_type("NA");
	}
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "USERNAME")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LoginModel{" + "userName=" + username + ", name=" + password + '}';
	}

	public char[] getRandomNumber(int length) {
		String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	      String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
	      String numbers = "1234567890";
	      String combinedChars = capitalCaseLetters + lowerCaseLetters + numbers;
	      Random random = new Random();
	      char[] password = new char[length];

	      password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
	      password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
	      password[2] = numbers.charAt(random.nextInt(numbers.length()));
	   
	      for(int i = 3; i< length ; i++) {
	         password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
	      }
	      return password;
	}

	@Column(name = "MOBILE")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "REG_DATE")
	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Column(name = "LOGIN_COUNT")
	public int getLogin_count() {
		return login_count;
	}

	public void setLogin_count(int login_count) {
		this.login_count = login_count;
	}
	
	@Column(table = "USER_IMAGE")
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "POINTS")
	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	@Column(name = "DOB")
	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	@Column(name = "ID_FILE_NAME")
	public String getId_file_name() {
		return id_file_name;
	}

	public void setId_file_name(String id_file_name) {
		this.id_file_name = id_file_name;
	}

	@Column(name = "COUNTRY")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "STATE")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "CITY")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "IS_RESIDENT")
	public String getIs_resident() {
		return is_resident;
	}

	public void setIs_resident(String is_resident) {
		this.is_resident = is_resident;
	}

	@Column(name = "RESIDENT_TYPE")
	public String getResident_type() {
		return resident_type;
	}

	public void setResident_type(String resident_type) {
		this.resident_type = resident_type;
	}

	@Column(name = "GENDER")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	@Column(name="COMPANY")
	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	@Column(name="QUALIFICATION")
	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	@Column(name="COLLEGE")
	public String getCollege() {
		return college;
	}


	public void setCollege(String college) {
		this.college = college;
	}


	@Column(name="JOB_ROLE")
	public String getJob_role() {
		return job_role;
	}


	public void setJob_role(String job_role) {
		this.job_role = job_role;
	}


	@Column(name="HOME_TOWN")
	public String getHometown() {
		return hometown;
	}


	public void setHometown(String hometown) {
		this.hometown = hometown;
	}


	@Column(name="SPORTS")
	public int getSports() {
		return sports;
	}


	public void setSports(int sports) {
		this.sports = sports;
	}


	@Column(name="MOVIES")
	public int getMovies() {
		return movies;
	}


	public void setMovies(int movies) {
		this.movies = movies;
	}

	
	@Column(name="ARTS")
	public int getArts() {
		return arts;
	}


	public void setArts(int arts) {
		this.arts = arts;
	}


	@Column(name="NEWS")
	public int getNews() {
		return news;
	}


	public void setNews(int news) {
		this.news = news;
	}


	@Column(name="TECHNOLOGY")
	public int getTechnology() {
		return technology;
	}


	public void setTechnology(int technology) {
		this.technology = technology;
	}


	@Column(name = "LANGUAGE")
	public String getLanguage() {
		return language;
	}


	public void setLanguage(String language) {
		this.language = language;
	}


	@Column(name = "FOOD_PREFERENCES")
	public String getFood_preferences() {
		return food_preferences;
	}


	public void setFood_preferences(String food_preferences) {
		this.food_preferences = food_preferences;
	}

	public int badge;
	
	public int getBadge()
	{
		return badge;
	}
	
	public void setBadge(int badge)
	{
		this.badge=badge;
	}


	@Column(name = "ACTIVE")
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}


	@Column(name = "COUNTRY_CODE")
	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

}

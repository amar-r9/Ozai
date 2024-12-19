package com.ozai.beans;

public class RoomRevenue {

	private int id;
	private int pg;
	private String property;
	private String room;
	private Integer sharing;
	private Integer count;
	private Integer total_rent;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public Integer getSharing() {
		return sharing;
	}

	public void setSharing(Integer sharing) {
		this.sharing = sharing;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getTotal_rent() {
		return total_rent;
	}

	public void setTotal_rent(Integer total_rent) {
		this.total_rent = total_rent;
	}

	public int getPg() {
		return pg;
	}

	public void setPg(int pg) {
		this.pg = pg;
	}

}

package com.ozai.beans;

import java.util.Map;

import com.google.auto.value.AutoValue.Builder;


@Builder
public class FCMMessageBean {
	
	private String to;
    private String collapse_key;
    private Notification notification;
    private Map<String, String> data;

    // Getters and setters
    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getCollapse_key() {
        return collapse_key;
    }

    public void setCollapse_key(String collapse_key) {
        this.collapse_key = collapse_key;
    }

    public Notification getNotification() {
        return notification;
    }

    public void setNotification(Notification notification) {
        this.notification = notification;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
    }

}

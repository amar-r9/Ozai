package com.ozai.beans;

import lombok.Data;

@Data
public class Notification {
	private String title;
    private String body;

    // Getters and setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
    
}

package com.ozai.service;

import org.springframework.stereotype.Service;

@Service
public class ChatbotService {

    public String getResponse(String userMessage) {
        // Simple keyword-based responses
        if (userMessage.contains("hello")) {
            return "Hi there! How can I assist you today?";
        } else if (userMessage.contains("room")) {
            return "I can provide details about rooms. Please specify.";
        } else {
            return "Sorry, I didn't understand that.";
        }
    }
}
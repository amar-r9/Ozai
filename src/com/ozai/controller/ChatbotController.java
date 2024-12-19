package com.ozai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ozai.service.ChatbotService;

@RestController
@RequestMapping("/chatbot")
public class ChatbotController {

    private final ChatbotService chatbotService;

    // Constructor-based dependency injection
    @Autowired
    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @RequestMapping("/message")
    public String sendMessage(@RequestBody String message) {
        return chatbotService.getResponse(message);
    }
}

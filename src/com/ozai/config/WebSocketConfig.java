package com.ozai.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

import com.ozai.handler.ChatWebSocketHandler;
import com.ozai.handler.GateRequestWebSocketHandler;
import com.ozai.interceptor.CustomHandshakeInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	// Handler for Gate Requests
        registry.addHandler(gateRequestWebSocketHandler(), "/ws/gaterequests")
                .addInterceptors(new CustomHandshakeInterceptor());

        // Handler for Chat functionality
        registry.addHandler(chatWebSocketHandler(), "/ws/chat")
                .addInterceptors(new CustomHandshakeInterceptor());
    }

    @Bean
    public GateRequestWebSocketHandler gateRequestWebSocketHandler() {
        return new GateRequestWebSocketHandler();
    }
    
    @Bean
    public ChatWebSocketHandler chatWebSocketHandler() {
        return new ChatWebSocketHandler();
    }

    @Bean
    public ServletServerContainerFactoryBean createWebSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        container.setMaxTextMessageBufferSize(8192);
        return container;
    }
 
    
}
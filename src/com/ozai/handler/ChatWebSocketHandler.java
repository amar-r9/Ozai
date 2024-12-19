package com.ozai.handler;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ozai.model.Messages;

@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

    private final List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        System.out.println("WebSocket session established: " + session.getId());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        System.out.println("WebSocket session closed: " + session.getId());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("Received message: " + message.getPayload());
        // Broadcast the received message to all connected clients
        for (WebSocketSession wsSession : sessions) {
            if (wsSession.isOpen()) {
                try {
                    wsSession.sendMessage(new TextMessage(message.getPayload()));
                    System.out.println("Sent message to session " + wsSession.getId() + ": " + message.getPayload());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    
    public void sendMessageToAll(String message, int senderId, int receiverId) {
        System.out.println("Sending message to all sessions: " + message);
        for (WebSocketSession session : sessions) {
            if (session.isOpen()) {
                try {
                	// Create a JSON-like structure with sender_id, receiver_id, and message content
                    String payload = String.format("{\"message\": \"%s\", \"sender_id\": %d, \"receiver_id\": %d}", message, senderId, receiverId);
                    session.sendMessage(new TextMessage(payload));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


	/*
	 * public void sendMessageToAll(String message) {
	 * System.out.println("Sending message to all sessions: " + message); for
	 * (WebSocketSession session : sessions) { if (session.isOpen()) { try {
	 * session.sendMessage(new TextMessage(message)); } catch (IOException e) {
	 * e.printStackTrace(); } } } }
	 */
}
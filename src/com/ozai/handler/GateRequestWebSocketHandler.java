package com.ozai.handler;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.json.JSONObject;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Component
public class GateRequestWebSocketHandler extends TextWebSocketHandler {

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
    }

    public void sendUpdate(String message) {
        System.out.println("in sendUpdate: " + message);
        for (WebSocketSession session : sessions) {
            System.out.println("in for loop, session: " + session);
            if (session.isOpen()) {
                System.out.println("session is open: " + session);
                try {
                    session.sendMessage(new TextMessage(message));
                    System.out.println("Sent message to session " + session.getId() + ": " + message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

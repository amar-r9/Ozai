package com.ozai.interceptor;

import java.util.Map;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class CustomHandshakeInterceptor extends HttpSessionHandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        // CORS handling
        response.getHeaders().add("Access-Control-Allow-Origin", "*");
        response.getHeaders().add("Access-Control-Allow-Methods", "GET, POST");
        response.getHeaders().add("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization");
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
}
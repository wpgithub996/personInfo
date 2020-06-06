package com.wang.client01.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@Configuration
public class WebSocketCongfig {
    @Bean
    public ServerEndpointExporter getServerEnd(){
        return new ServerEndpointExporter();
    }
}

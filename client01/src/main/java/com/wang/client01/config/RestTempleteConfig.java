package com.wang.client01.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTempleteConfig {
    //自动配置负载均衡
    @LoadBalanced
    @Bean
    public RestTemplate getRestTemplete(){
        return new RestTemplate();
    }
}

package com.wang.client01.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.http.HttpStatus;
public class ErrorConfig implements ErrorPageRegistrar {
    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        ErrorPage error400Page = new ErrorPage(HttpStatus.BAD_REQUEST, "/500.html");
        ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/500.html");
        ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/500.html");
        ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");
        registry.addErrorPages(error400Page,error401Page,error404Page,error500Page);
    }
}

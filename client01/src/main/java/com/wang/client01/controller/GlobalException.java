package com.wang.client01.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalException {
    @ExceptionHandler(Exception.class)
    public ModelAndView catchex(Exception e){
        System.out.println("捕捉到异常"+e);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("code",e);
        modelAndView.addObject("msg","请联系管理员");
        modelAndView.setViewName("500");
        return modelAndView;
    }
}

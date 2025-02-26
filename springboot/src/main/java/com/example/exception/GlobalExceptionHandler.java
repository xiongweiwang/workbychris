package com.example.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
 
@ControllerAdvice	//让这个类变成 全局异常处理器，能捕获 所有 Controller 里的异常。
public class GlobalExceptionHandler {
    @ExceptionHandler(value = Exception.class)	//这里拦截 所有异常（包括 NullPointerException、IllegalArgumentException 等）。
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("errorPage");
        return mav;
    }
 
}
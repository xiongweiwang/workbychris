package com.itheima.listener;

import jakarta.servlet.ServletContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class WebApplicationContextUtils {
    public static ApplicationContext getWebApplicationContext(ServletContext servletContext) {

        return (ApplicationContext) servletContext.getAttribute("applicationContext");
    }
}

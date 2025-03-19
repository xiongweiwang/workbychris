/*
package com.itheima.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//@WebListener
public class ContextLoaderListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("go into contextInitialized");
        ServletContext servletContext = sce.getServletContext();

        //String contextConfigLocation = servletContext.getInitParameter("contextConfigLocation");
        //ApplicationContext applicationContext = new ClassPathXmlApplicationContext(contextConfigLocation);

        //ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        try {
            ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
            //ApplicationContext applicationContext = new ClassPathXmlApplicationContext(contextConfigLocation);
            if (applicationContext == null) {
                System.out.println("Spring applicationContext is NULL!");
            } else {
                System.out.println("Spring applicationContext loaded successfully!");
                servletContext.setAttribute("applicationContext", applicationContext);
                System.out.println("spring Container initialized");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }




    }
    public void contextDestroyed(ServletContextEvent sce) {

    }
}



//import com.itheima.config.AppConfig;
//import jakarta.servlet.ServletContext;
//import jakarta.servlet.ServletContextEvent;
//import jakarta.servlet.ServletContextListener;
//import jakarta.servlet.annotation.WebListener;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//import com.itheima.config.AppConfig;
//import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

//@WebListener
//public class ContextLoaderListener implements ServletContextListener {
//    public void contextInitialized(ServletContextEvent sce) {
//        AnnotationConfigWebApplicationContext applicationContext = new AnnotationConfigWebApplicationContext();
//        applicationContext.register(AppConfig.class);
//        applicationContext.refresh();
//
//        ServletContext servletContext = sce.getServletContext();
//        servletContext.setAttribute("applicationContext", applicationContext);
//    }
//
//    public void contextDestroyed(ServletContextEvent sce) {
//        // 释放资源
//    }
//}


*/

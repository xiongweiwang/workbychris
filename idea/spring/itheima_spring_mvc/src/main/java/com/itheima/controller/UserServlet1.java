//package com.itheima.controller;
//
//import com.itheima.service.UserService;
//import jakarta.servlet.ServletContext;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebInitParam;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.springframework.context.ApplicationContext;
//
//import java.io.IOException;
//
////@WebServlet(urlPatterns = "/userServlet")
//@WebServlet(
//        urlPatterns = "/userServlet1",
//        initParams = {
//                @WebInitParam(name = "contextConfigLocation", value = "classpath:/applicationContext.xml")
//        }
//)
//public class UserServlet1 extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//
//        ServletContext servletContext = req.getServletContext();
//        ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute("applicationContext");
//
//        UserService userService = applicationContext.getBean(UserService.class);
//        userService.save();
//
//        String contextPath = getServletContext().getContextPath();
//        System.out.println(contextPath);
//        getServletContext().log("This is a log message");
//
//
//        //9. ファイルシステムパスの取得
//        String realPath = getServletContext().getRealPath("/WEB-INF/web.xml");
//        System.out.println(realPath);
//
//
//
//
//        // 使用基于注解的 Spring 配置
////        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
////        UserService userService = applicationContext.getBean(UserService.class);
////
////        // 调用 service 层的方法
////        userService.save();
//    }
//}
//
//
///*
//package com.itheima.controller;
//
//import com.itheima.service.UserService;
//import jakarta.servlet.annotation.WebServlet;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import javax.servlet.ServletException;
//
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(urlPatterns = "/userServlet")
//public class UserServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("UserServlet is called");
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userService = applicationContext.getBean(UserService.class);
//        userService.save();
//    }
//}*/

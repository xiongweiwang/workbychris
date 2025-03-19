package com.itheima.controller;

import com.itheima.listener.WebApplicationContextUtils;
import com.itheima.service.UserService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;


import java.io.IOException;
import java.io.InputStream;

@WebServlet(urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 从 ServletContext 获取 Spring 容器
//        ServletContext servletContext = this.getServletContext();
//        //ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute("applicationContext");
//
//        // 需引入spring-web依赖
     //ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        ServletContext servletContext = req.getServletContext();
        //try { Thread.sleep(1000); } catch (InterruptedException ignored) {}
        System.out.println("Spring servletContext: " + servletContext);
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        System.out.println("Spring ApplicationContext: " + applicationContext);

        if (applicationContext == null) {
            throw new ServletException("Spring ApplicationContext is null. Check web.xml configuration.");
        }

        // 获取 UserService Bean
        UserService userService = applicationContext.getBean(UserService.class);
        userService.save();
    }
}

//        ServletContext servletContext = req.getServletContext();
//        ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute("applicationContext");
//
//        if (applicationContext == null) {
//            throw new ServletException("Spring ApplicationContext is not initialized!");
//        }
//
//        UserService userService = applicationContext.getBean(UserService.class);
//        userService.save();
//
//        // 其他 Servlet 逻辑...
//        String contextPath = req.getServletContext().getContextPath();
//        System.out.println(contextPath);
//        getServletContext().log("This is a log message");
//
//        String realPath = getServletContext().getRealPath("/WEB-INF/web.xml");
//        System.out.println(realPath);
//    }

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //ServletContext applicationContext = req.getServletContext();
        //ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute("applicationContext");

        // 从 ServletContext 获取 Spring 容器
        //ServletContext servletContext = this.getServletContext();

        // 手动写ContextLoaderListener，然后servletContext.setAttribute("applicationContext", applicationContext);
        //ApplicationContext applicationContext = (ApplicationContext) servletContext.getAttribute("applicationContext");


        // 需引入spring-web依赖
        //ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);


//        if (applicationContext == null) {
//            throw new ServletException("Spring ApplicationContext is not initialized!");
//        }
//
//        UserService userService = applicationContext.getBean(UserService.class);
//        userService.save();

//        Logger logger = LoggerFactory.getLogger(UserServlet.class);
//        logger.warn("This is a log message");

        // 其他 Servlet 逻辑...
//        String contextPath = req.getServletContext().getContextPath();
//        System.out.println(contextPath);
//        getServletContext().log("This is a log message");
//
//        String realPath = getServletContext().getRealPath("/WEB-INF/web.xml");
//        System.out.println(realPath);
//    }
//}

/*
package com.itheima.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.springframework.web.context.support.XmlWebApplicationContext;

@WebListener
public class CustomContextLoaderListener implements ServletContextListener {
    private XmlWebApplicationContext applicationContext;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        applicationContext = new XmlWebApplicationContext();
        applicationContext.setConfigLocation("classpath:applicationContext.xml");
        applicationContext.setServletContext(servletContext);
        applicationContext.refresh();

        servletContext.setAttribute("applicationContext", applicationContext);
        System.out.println("Spring WebApplicationContext initialized manually!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (applicationContext != null) {
            applicationContext.close();
        }
    }
}
*/

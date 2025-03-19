//package com.itheima.config;
//
//import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
//
////手动注册 DispatcherServlet（如果不使用 Spring Boot）
//public class MyAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
//
//    @Override
//    protected Class<?>[] getRootConfigClasses() {
//        return new Class[] { AppConfig.class }; // 配置类，通常是 @Configuration 注解的类
//    }
//
//    @Override
//    protected Class<?>[] getServletConfigClasses() {
//        return new Class[] { AppConfig.class }; // 配置 Spring MVC 的类
//    }
//
//    @Override
//    protected String[] getServletMappings() {
//        return new String[] { "/" };  // 映射到根路径
//    }
//}

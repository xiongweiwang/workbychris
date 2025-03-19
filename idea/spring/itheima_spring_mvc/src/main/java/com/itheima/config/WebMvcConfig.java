//package com.itheima.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
////在 Spring 6 中，<mvc:resources> 已经被移除，官方推荐使用 WebMvcConfigurer 进行静态资源映射。
////如果你使用的是 Spring 6，<mvc:resources> 不再可用，需要使用 WebMvcConfigurer 来配置静态资源。
//@Configuration
//public class WebMvcConfig implements WebMvcConfigurer {
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/js/**")
//                .addResourceLocations("/js/");
//    }
//}

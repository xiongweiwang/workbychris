package com.itheima.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import javax.sql.DataSource;

// <context:property-placeholder location="classpath:jdbc.properties" />
@PropertySource("classpath:jdbc.properties")
public class DataSourceConfiguration {
    @Value("${jdbc.driver-class-name}")
    private String driverClassName;
    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;

    @Bean("DBCPDataSource") //Spring会将当前方法的返回值以指定名称存储到Spring容器中。
    public DataSource getDataSource() {
        System.out.println("Driver: " + driverClassName);
        System.out.println("URL: " + url);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;

//        BasicDataSource dataSource = new BasicDataSource();
//        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
//        dataSource.setUrl("jdbc:mysql://localhost:3306/test");
//        dataSource.setUsername("root");
//        dataSource.setPassword("admin");
//        return dataSource;

        // 连接池优化配置（可选）
//        dataSource.setInitialSize(5);  // 初始化连接数
//        dataSource.setMaxTotal(10);     // 最大连接数
//        dataSource.setMinIdle(2);       // 最小空闲连接数
//        dataSource.setMaxIdle(5);       // 最大空闲连接数

//        Connection connection = dataSource.getConnection();
//        System.out.println("DBCP Connection: " + connection);
//        connection.close();
    }

//    @Bean
//    public static PropertySourcesPlaceholderConfigurer propertyConfig() {
//        return new PropertySourcesPlaceholderConfigurer();
//    }
}

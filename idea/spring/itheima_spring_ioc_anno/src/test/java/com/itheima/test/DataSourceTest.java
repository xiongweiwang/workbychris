package com.itheima.test;

import org.junit.Test;

import java.beans.PropertyVetoException;
import java.sql.Connection;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ResourceBundle;

public class DataSourceTest {

    // C3P0 连接池测试
    @Test
    public void test1() throws Exception {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setDriverClass("com.mysql.cj.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/test");
        dataSource.setUser("root");
        dataSource.setPassword("admin");

        Connection connection = dataSource.getConnection();
        System.out.println("C3P0 Connection: " + connection);
        connection.close();
    }

    // DBCP 连接池测试
    @Test
    public void test2() throws Exception {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/test");
        dataSource.setUsername("root");
        dataSource.setPassword("admin");

        // 连接池优化配置（可选）
        dataSource.setInitialSize(5);  // 初始化连接数
        dataSource.setMaxTotal(10);     // 最大连接数
        dataSource.setMinIdle(2);       // 最小空闲连接数
        dataSource.setMaxIdle(5);       // 最大空闲连接数

        Connection connection = dataSource.getConnection();
        System.out.println("DBCP Connection: " + connection);
        connection.close();
    }

    // 手动DBCP
    @Test
    public void test3() throws Exception {
        ResourceBundle bundle = ResourceBundle.getBundle("jdbc"); // 不要带 ".properties"
        String driver = bundle.getString("jdbc.driver-class-name");
        String url = bundle.getString("jdbc.url");
        String username = bundle.getString("jdbc.username");
        String password = bundle.getString("jdbc.password");

        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);

        // 连接池优化配置（可选）
        dataSource.setInitialSize(5);  // 初始化连接数
        dataSource.setMaxTotal(10);     // 最大连接数
        dataSource.setMinIdle(2);       // 最小空闲连接数
        dataSource.setMaxIdle(5);       // 最大空闲连接数

        Connection connection = dataSource.getConnection();
        System.out.println("DBCP Connection: " + connection);
        connection.close();

    }

    // getBean(DBCPDataSource)
    @Test
    public void test4() throws Exception {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        BasicDataSource dataSource = (BasicDataSource) applicationContext.getBean("DBCPDataSource");

        // 连接池优化配置（可选）
        dataSource.setInitialSize(5);  // 初始化连接数
        dataSource.setMaxTotal(10);     // 最大连接数
        dataSource.setMinIdle(2);       // 最小空闲连接数
        dataSource.setMaxIdle(5);       // 最大空闲连接数

        Connection connection = dataSource.getConnection();
        System.out.println("DBCP Connection: " + connection);
        connection.close();
    }
}


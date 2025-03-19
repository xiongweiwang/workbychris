package com.itheima.dao.impl;

import com.itheima.dao.UserDao;
import com.itheima.domain.User;

import java.util.List;
import java.util.Map;
import java.util.Properties;

public class UserDaoImpl implements UserDao{
    private List<String> strList;
    private Map<String, User> userMap;
    private Properties properties;

    public List<String> getStrList() {
        return strList;
    }

    public void setStrList(List<String> strList) {
        this.strList = strList;
    }

    public Map<String, User> getUserMap() {
        return userMap;
    }

    public void setUserMap(Map<String, User> userMap) {
        this.userMap = userMap;
    }

    public Properties getProperties() {
        return properties;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    private String userName;
    private int age;


    public void setAge(int age) {
        this.age = age;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public UserDaoImpl() {
        System.out.println("Constructor method: UserDaoImpl1()");
    }

    public void save() {
//        System.out.println("username = " + userName);
//        System.out.println("age = " + age);
        System.out.println(strList);
        System.out.println(userMap);
        System.out.println(properties);
        System.out.println("UserDaoImpl save running");
    }

//    public void init(){
//        System.out.println("init() method");
//    }
//    public void destory(){
//        System.out.println("destory() method");
//    }
}

package com.itheima.dao.impl;

import com.itheima.dao.UserDao;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{

    public UserDaoImpl() {
        System.out.println("Constructor method: UserDaoImpl()");
    }

    public void save() {
        System.out.println("UserDaoImpl save running");
    }
}

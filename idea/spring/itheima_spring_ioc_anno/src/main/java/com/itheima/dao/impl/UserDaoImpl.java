package com.itheima.dao.impl;

import com.itheima.dao.UserDao;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//<bean id="userDao" class="com.itheima.dao.impl.UserDaoImpl"></bean>
//@Component("userDao")
@Repository("userDao")
//@Bean(initMethod = "init", destroyMethod = "destroy")
public class UserDaoImpl implements UserDao , InitializingBean, DisposableBean {
    public void save() {
        System.out.println("UserDaoImpl save running");
    }

    //@PostConstruct
    //@PostConstruct 和 @PreDestroy 在 JDK 9+ 被移除，导致无法识别。
    public void init(){
        System.out.println("UserDaoImpl init");
    }

    //@PreDestroy
//    ✅ 解决方案:
//      方法 1：
//        使用 javax.annotation-api 依赖
//            <dependency>
//                <groupId>javax.annotation</groupId>
//                <artifactId>javax.annotation-api</artifactId>
//                <version>1.3.2</version> <!-- 适用于 JDK 9+ -->
//            </dependency>
//          适用于 JDK 17，但 javax.annotation 未来可能会完全废弃。
        //方法 2：使用 Spring 提供的 @Bean(initMethod, destroyMethod)

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("UserDaoImpl init");
    }

    @Override
    public void destroy(){
        System.out.println("UserDaoImpl destroy");
    }
}

//Spring 提供了自己的 @PostConstruct 替代方案，在 Spring Boot 2.5+ 和 Spring 6 里，官方推荐用：
//import org.springframework.beans.factory.InitializingBean;
//import org.springframework.beans.factory.DisposableBean;
//
//        public class UserDaoImpl implements InitializingBean, DisposableBean {
//            @Override
//            public void afterPropertiesSet() {
//                System.out.println("UserDaoImpl init");
//            }
//
//            @Override
//            public void destroy() {
//                System.out.println("UserDaoImpl destroy");
//            }
//        }

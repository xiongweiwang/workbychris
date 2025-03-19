package com.itheima.service.impl;

import com.itheima.dao.UserDao;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

//<bean id="userService" class="com.itheima.service.impl.UserServiceImpl"></bean>
//@Component("userService")
@Service("userService")
//Scope("prototype")
@Scope("singleton")
public class UserServiceImpl implements UserService {
    //@Value("${jdbc.driver-class-name}")
    //private String driver;

//    如果有多个同类型的 Bean，
//    此时，如果 @Autowired 直接作用在 UserDao 类型的字段上，
//    会导致 NoUniqueBeanDefinitionException（因为有多个 UserDao 实现）。
//    解决方案:
//            （1）使用 @Qualifier 指定 Bean 名称
//            （2）构造方法 + @Qualifier（推荐）
//                ✅ 优点：
//                        避免字段注入的弊端
//                        依赖不可变
//                        明确指定注入的 Bean，防止冲突
//            （3）. @Primary vs @Qualifier
//            （4）. @Autowired(required = false)
//                如果依赖项 不是必须的，可以加 required = false，防止报错：
    @Autowired    //按照数据类型从Spring容器中匹配。
    @Qualifier("userDao") // 指定具体的 Bean 名称，按照id值从容器中进行匹配的
    //@Resource(name="userDao") //在 JDK 9 及以上，javax.annotation.Resource 被移除，导致编译失败。
    private  UserDao userDao;


//    4. 字段注入 vs 构造器注入
//    虽然字段注入很简洁，但在一些场景下，Spring 官方推荐使用：
//
//    构造器注入（@Autowired 作用在构造方法上）：

//    @Autowired
//    public UserServiceImpl(@Qualifier("userDao") UserDao userDao) {
//        this.userDao = userDao;
//    }


//✅ 优点：
//    保证依赖不可变（使用 final 关键字），增强安全性。
//    更容易进行单元测试（可以手动创建 UserDao 并传入）。
//    避免循环依赖（Spring 先创建对象，再注入依赖）。
    // <constructor-arg name="userDao" ref="userDao"></constructor>
//    @Autowired
//    public UserServiceImpl(UserDao userDao) {   // 构造方法注入
//        this.userDao = userDao;
//    }


    // <property name="userDao" ref="userDao"></property>
//    @Autowired
//    public void setUserDao(UserDao userDao) {
//        this.userDao = userDao;
//    }

    @Override
    public void save() {
        //System.out.println(driver);
        userDao.save();
    }
}

package com.itheima.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;

import javax.sql.DataSource;
import java.sql.Connection;

@Configuration
//<context:component-scan base-package="com.itheima" />
@ComponentScan("com.itheima")
//<import resource="applicationContext-user.xml"/>
@Import(DataSourceConfiguration.class)
public class SpringConfiguration {
}

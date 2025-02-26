package com.example.controller;

import java.text.DateFormat;
import java.util.Date;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
  
@Controller
public class HelloController {
  
    @RequestMapping("/hello")
    public String hello(Model m) throws Exception {
        m.addAttribute("now", DateFormat.getDateTimeInstance().format(new Date()));
        if(true){
            throw new Exception("some exception");
        }
        return "hello"; // 返回 /WEB-INF/jsp/hello.jsp
    }
     
}

//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
// 
//@Controller
//public class HelloController {
// 
//    @RequestMapping("/hello")
//    public String hello() {
//        return "hello";	// 返回 /WEB-INF/jsp/hello.jsp
//    }
// 
//}
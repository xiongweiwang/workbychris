package com.itheima.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
//import com.itheima.config.AppConfig;
import com.itheima.domain.User;
import com.itheima.domain.Vo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

//    public UserController() {
//        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
//
//    }

    //@RequestMapping(value="/quick",method = RequestMethod.GET,params = {"username","password"})
    @RequestMapping(value="/quick")
    public  String save(){
        System.out.println("Controller save running");
        return "success";
    }

    @RequestMapping(value="/quick2")
    public ModelAndView save2(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("username","quick2: ModelAndView");
        modelAndView.setViewName("success");
        return modelAndView;
    }

    @RequestMapping(value="/quick3")
    public ModelAndView save3(ModelAndView modelAndView){
        modelAndView.addObject("username","quick3: ModelAndView");
        modelAndView.setViewName("success");
        return modelAndView;
    }

    @RequestMapping(value="/quick4")
    public String save4(Model model){
        model.addAttribute("username","quick4: Model");
        return "success";
    }

    @RequestMapping(value="/quick5")
    public String save5(HttpServletRequest request){
        request.setAttribute("username","quick5: HttpServletRequest");
        return "success";
    }

    @RequestMapping(value="/quick6")
    public void save6(HttpServletResponse response) throws IOException {
        response.getWriter().println("quick6: HttpServletResponse");
    }

    @RequestMapping(value="/quick7")
    @ResponseBody
    public String save7() throws IOException {
        return "quick7: @ResponseBody";
    }

    @RequestMapping(value="/quick8")
    @ResponseBody
    public String save8() throws IOException {
        return "{\"username\": \"Tom\", \"age\": 18}";
    }

    @RequestMapping(value = "/quick9", produces = "application/json")
    @ResponseBody
    public String save9() throws IOException {
        User user = new User();
        user.setUsername("quick9");
        user.setAge(9);

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(user);
    }

    @RequestMapping(value = "/quick10", produces = "application/json")
    @ResponseBody
    public User save10() throws IOException {
        User user = new User();
        user.setUsername("quick10");
        user.setAge(10);
        return user;
    }

    /*封装基本数据类型*/
    @RequestMapping( "/quick11")
    @ResponseBody
    public void save11(@RequestParam("username")String name, @RequestParam("age")int age) throws IOException {
        System.out.println(name);
        System.out.println(age);
    }

    /*封装实体*/
    @RequestMapping( "/quick12")
    @ResponseBody
    public void save12(User user) throws IOException {
        System.out.println(user);
    }

    /*获得数组类型参数*/
    @RequestMapping( "/quick13")
    @ResponseBody
    public void save13(@RequestParam("strs")String[] strs) throws IOException {
        System.out.println(Arrays.asList(strs));
    }

    /*获得集合类型参数*/
    @RequestMapping( "/quick14")
    @ResponseBody
    public void save14(Vo vo) throws IOException {
        System.out.println(Arrays.asList(vo));
    }

    /*获得集合类型参数*/
    @RequestMapping( "/quick15")
    @ResponseBody
    public void save15(@RequestBody List<User> userList) throws IOException {
        System.out.println(userList);
    }


    @GetMapping("/quick16")
    public void save16(@RequestParam(value="name", required = false, defaultValue = "itcast") String userName) throws IOException {
        System.out.println(userName);
    }

    //参数不是以·？形式的。
    @GetMapping(value="/quick17/{userName}")
    @ResponseBody   // 告诉 Spring 不需要解析 JSP 视图
    public void save17(@PathVariable(value = "userName") String userName) {
        System.out.println(userName);
    }

    @RequestMapping(value="/quick18")
    @ResponseBody   // 告诉 Spring 不需要解析 JSP 视图
    public void save18(@RequestParam("date")Date date) {
        System.out.println(date);
    }

    @RequestMapping(value="/quick19")
    @ResponseBody   // 告诉 Spring 不需要解析 JSP 视图
    public void save19(HttpServletRequest servletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession) {

        System.out.println(servletRequest);
        System.out.println(httpServletResponse);
        System.out.println(httpSession);
    }

    //获取请求头
    @RequestMapping(value="/quick20")
    @ResponseBody   // 告诉 Spring 不需要解析 JSP 视图
    public void save20(@RequestHeader(value = "User-Agent", required = false) String user_agent) {
        System.out.println("Requests Headers ~ user_agent:" + user_agent);
    }

    //获取请求头
    @RequestMapping(value="/quick21")
    @ResponseBody   // 告诉 Spring 不需要解析 JSP 视图
    public void save21(@CookieValue(value = "JSESSIONID") String jsessionid) {
        System.out.println("Requests Headers ~ cookie:" + jsessionid);
    }

    //文件上传
    @ResponseBody
    @PostMapping("/quick22")
    public String uploadFile(@RequestParam("username")String name, @RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "文件为空";
        }

        // 获取文件名
        String fileName = file.getOriginalFilename();
        System.out.println("上传的文件名：" + fileName);

        // 指定保存目录
        File uploadDir = new File("C:/work/idea/spring/upload");
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // 确保目录存在
        }

        // 指定文件完整路径
        File destFile = new File(uploadDir, fileName);

        try {
            // 保存文件
            file.transferTo(destFile);
            return "文件上传成功：" + destFile.getAbsolutePath();
        } catch (IOException e) {
            e.printStackTrace();
            return "文件上传失败";
        }
    }

    //文件上传
//    @ResponseBody
//    @PostMapping("/quick23")
//    public String uploadFile23(@RequestParam("username") String username, @RequestParam("files") MultipartFile[] files) {
//        System.out.println(username);
//
//        // 用来记录上传结果
//        StringBuilder result = new StringBuilder();
//
//        for (MultipartFile file : files) {
//            // 获取文件名
//            String fileName = file.getOriginalFilename();
//            System.out.println("上传的文件名：" + fileName);
//
//            // 指定保存目录
//            File uploadDir = new File("C:/work/idea/spring/upload");
//            if (!uploadDir.exists()) {
//                uploadDir.mkdirs();  // 确保目录存在
//            }
//
//            // 指定文件完整路径
//            File destFile = new File(uploadDir, fileName);
//
//            try {
//                // 保存文件
//                file.transferTo(destFile);
//                result.append("文件上传成功：").append(destFile.getAbsolutePath()).append("\n");
//            } catch (IOException e) {
//                e.printStackTrace();
//                result.append("文件上传失败：").append(fileName).append("\n");
//            }
//        }
//
//        // 返回所有文件的上传结果
//        return result.toString();
//    }

    @ResponseBody
    @PostMapping("/quick23")
    public String uploadFile23(@RequestParam("username") String username, @RequestParam("files") MultipartFile[] files) {
        System.out.println(username);

        // 用来记录上传结果
        StringBuilder result = new StringBuilder();

        for (MultipartFile file : files) {
            try {
                // 获取文件名，并进行 URL 解码，确保中文字符能正确显示
                String fileName = URLDecoder.decode(file.getOriginalFilename(), "UTF-8");
                System.out.println("上传的文件名：" + fileName);

                // 指定保存目录
                File uploadDir = new File("C:/work/idea/spring/upload");
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();  // 确保目录存在
                }

                // 指定文件完整路径
                File destFile = new File(uploadDir, fileName);

                // 保存文件
                file.transferTo(destFile);
                result.append("文件上传成功：").append(destFile.getAbsolutePath()).append("\n");
            } catch (IOException e) {
                e.printStackTrace();
                result.append("文件上传失败：").append(file.getOriginalFilename()).append("\n");
            }
        }

        // 返回所有文件的上传结果
        return result.toString();
    }









}

package com.itheima.converter;

//import org.springframework.core.convert.converter.Converter;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//public class DateConverter implements Converter<String, Date> {
//
//
//    @Override
//    public Date convert(String dateString) {
//        // 将日期字符串转换成日期对象 返回
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = null;
//        try {
//            date = sdf.parse(dateString);
//        } catch (ParseException e) {
//            throw new RuntimeException(e);
//        }
//        return date;
//    }
//}


import org.springframework.core.convert.converter.Converter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {
    private static final String DATE_FORMAT = "yyyy-MM-dd";

    @Override
    public Date convert(String source) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
        dateFormat.setLenient(false); // 确保严格匹配格式
        try {
            return dateFormat.parse(source);
        } catch (ParseException e) {
            throw new IllegalArgumentException("Invalid date format, expected " + DATE_FORMAT);
        }
    }
}


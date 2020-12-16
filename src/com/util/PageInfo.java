package com.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.List;

/**
 * @ProjectName: ssm
 * @Package: com.bjpowernode.util
 * @Description: java类作用描述
 * @Author: admin
 * @CreateDate: 2020/12/12 16:18
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
public class PageInfo extends com.github.pagehelper.PageInfo {

    private String url;

    public PageInfo(List list){

        super(list);

        //从当前本地线程当中获取请求
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();

        //获取当前的请求地址
        String uri = request.getRequestURI() + "?1=1";//http://localhost:8080/ssm/teacher/list?name=教&age=20.....

        /**
         * 获得请求当中所有的参数名称
         */
        Enumeration<String> parameterNames = request.getParameterNames();

        //迭代所有的 参数名称
        while(parameterNames.hasMoreElements()){

            //取出参数名称
            String paramName = parameterNames.nextElement();

            //根据参数名称获取参数的值
            String paramValue = request.getParameter(paramName);

            //如果参数的值不为空，并且参数不为常驻参数(1=1&page=?)，则拼接到当前请求地址的参数列表当中
            //
            if(paramValue != null && !"".equals(paramValue) && !"1".equals(paramName) && !"page".equals(paramName)){

                //对地址栏参数做转码
                try {
                    paramValue = URLEncoder.encode(paramValue,"UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }

                uri += "&" + paramName + "=" + paramValue;
            }

        }

        //为url属性赋值
        url = uri;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


}

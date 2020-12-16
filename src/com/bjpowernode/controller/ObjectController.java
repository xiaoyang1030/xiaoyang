package com.bjpowernode.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bjpowernode.entity.Province;
import com.bjpowernode.model.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ObjectController {

    @Autowired
    ProvinceService provinceImpl;

    @RequestMapping("/objectTest01")
    public void objectTest01(HttpServletResponse response) throws IOException {
        List<Province> provinces = provinceImpl.selectAll();
        String s = JSONObject.toJSONString(provinces);
        response.getWriter().write(s);
    }
}

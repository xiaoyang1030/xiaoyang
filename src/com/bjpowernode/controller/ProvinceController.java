package com.bjpowernode.controller;

import com.bjpowernode.entity.Province;
import com.bjpowernode.model.service.ProvinceService;
import com.bjpowernode.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("province")
public class ProvinceController {
    @Autowired
    private ProvinceService provinceImpl;
    @Autowired
    private UserService userService;
    @RequestMapping("list")
    public List<Province> list(){
        return provinceImpl.selectAll();
    }

    @RequestMapping("delete")
    public String  delete(Integer id){
        userService.updateByProvinceId(id);
        provinceImpl.deleteByPrimaryKey(id);
        return "redirect:list";
    }
}

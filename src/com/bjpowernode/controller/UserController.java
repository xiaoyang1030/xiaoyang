package com.bjpowernode.controller;

import com.bjpowernode.entity.Province;
import com.bjpowernode.entity.User;
import com.bjpowernode.model.service.ProvinceService;
import com.bjpowernode.model.service.UserService;
import com.github.pagehelper.Page;
import com.util.PageInfo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceImpl;

//    @RequestMapping("list")
//    List<User> list() {
//        return userService.selectAll();
//        //2.调用模型层    返回值默认是要进入到request的attribute(request.setAttribute())
//    }

    @RequestMapping("del")
    String del(int id) {
        userService.deleteByPrimaryKey(id);
        return "redirect:list";
    }
    @RequestMapping("save")
    String save(User user) {
        if(user.getId()==null){
            userService.insert(user);
        }else {
            userService.updateByPrimaryKeySelective(user);
        }
        return "redirect:list";
    }

    @RequestMapping("edit")
    User edit(Integer id, Map<String,Object> map){
        List<Province> provinces = provinceImpl.selectAll();
        map.put("provinceList",provinces);
        return userService.selectByPrimaryKey(id);
    }

    @RequestMapping("delBatch")
    String delbatch(Integer[] ids){
        userService.delbatch(ids);
        return "redirect:list";
    }
//    private int pageSize=3;
//    @RequestMapping("list")
//    List<User> seluser(User user){
//        //return userService.selectUsers(user);
//
    private int pageSize=3;
    @RequestMapping("list")
    PageInfo seluser(User user,@RequestParam(defaultValue = "1") Integer page,Map<String,Object> map){
        List<Province> provinces = provinceImpl.selectAll();
        map.put("provinces",provinces);
        PageHelper.startPage(page,pageSize);
        PageInfo pageInfo=new PageInfo(userService.selectUsers(user));
        return pageInfo;
    }



//    传递到自身controller中时只需要返回方法名即可
//第一种为原始servlet方法
//    1接收请求参数
//    2调用模型层方法
//    3往作用域中放值
//    4响应用户（重定向或页面跳转）
//    req.getParameter(id);

//    2使用ModelAndView
//    @RequestMapping("list")
//    ModelAndView list(){
//        ModelAndView modelAndView=new ModelAndView();
//        List<User> users = userService.selectAll();
//        modelAndView.addObject("userList",users);
//        modelAndView.setView(new InternalResourceView("/pages/list.jsp"));
//        return modelAndView;
//    }
    //3返回视图的名称 视图的名称：被试图解析器的前缀和后缀包夹的那个字符串
//    @RequestMapping("list")
//    String list(ArrayList<User> list){
//        List<User> listDB=userService.selectAll();
//        list.addAll(listDB);//
//        return "list";
//    }


    //4返回视图的名称
//    @RequestMapping("list")
//    String list(Map<String,Object> map){
//        //调用模型层
//        List<User> listDB=userService.selectAll();
//        map.put("userList",listDB);
//        return "list";
//    }

//    //5使用约定
//    @RequestMapping("list")
//    void list(Map<String,Object> map){
//        List<User> listDB=userService.selectAll();
//        map.put("userList",listDB);
//        //4.请求转发,约定: 当没有指明要做何种响应的时候，
//        // 默认请求转发到 视图解析器的前辍 + namespace + action + 视图解析器的后辍
//    }
    //    //6使用约定
//    @RequestMapping("list")
//    void list(ArrayList<User> list){
//        List<User> listDB=userService.selectAll();
//        list.addAll(listDB);// req.setAttribute("userList",list); //attributeName默认是按照类型做推断：userList   user
//        //4.请求转发,约定: 当没有指明要做何种响应的时候，
//        // 默认请求转发到 视图解析器的前辍 + namespace + action + 视图解析器的后辍
//    }
////    7使用约定
//    @RequestMapping("list")
//    List<User> list(){
//        return userService.selectAll();
//        //2.调用模型层    返回值默认是要进入到request的attribute(request.setAttribute())
//    }
    /**
     * 8.使用约定
     */
//    @RequestMapping("list")
//    Map<String,Object> list(){
//
//        Map<String,Object> map = new HashMap<>();
//
//        List<User>  list = userService.selectAll();//2.调用模型层
//
//        //3.往作用域放值
//        map.put("userList",list);//request.setAttribute("userList",list)
//
//        //4.响应按约定走
//
//        return map;
//    }

}

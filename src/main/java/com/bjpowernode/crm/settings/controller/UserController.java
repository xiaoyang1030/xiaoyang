package com.bjpowernode.crm.settings.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;

    @RequestMapping("login")
    String login(User user, Model model,HttpServletRequest request) {
        try {
            user.setAllowIps(request.getRemoteHost());
            user = userService.queryOne(user);
            request.getSession().setAttribute("user",user);
            return "index";
        } catch (CrmException e) {
            model.addAttribute("loginAct",user.getLoginAct());
            model.addAttribute("mess", e.getMessage());
        }
        return "../../login";
    }

    @RequestMapping("loginout")
    public String loginout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "../../login";
    }

    @RequestMapping("/queryAll")
    @ResponseBody
    public List<User> queryAll() {

        return userService.queryAll();

    }

}

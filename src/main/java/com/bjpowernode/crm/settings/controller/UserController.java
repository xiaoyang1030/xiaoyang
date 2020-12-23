package com.bjpowernode.crm.settings.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.UUIDUtil;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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
    @RequestMapping("fileUpload")

    public String fileUpload(MultipartFile photo,HttpSession session,HttpServletRequest request){
        //获取某个路径的绝对地址
        String realPath = session.getServletContext().getRealPath("/upload");
        File file=new File(realPath);
        //判断存放文件目录是否存在，不存在就创建
        if(!file.exists()){
            file.mkdirs();
        }
        //获取上传文件文件名
        String filename= photo.getOriginalFilename();
        filename= UUIDUtil.getUUID()+filename;
        //upload文件名
        try {
            photo.transferTo(new File(realPath+File.separator+filename));
            User user = (User) session.getAttribute("user");
            user.setPhoto(request.getContextPath()+
                    File.separator+"upload"+File.separator+filename);
            userService.fileUpload(user);
        } catch (IOException e) {
            e.printStackTrace();
        }catch (CrmException e1){
            e1.printStackTrace();
        }
        return "index";
    }

}

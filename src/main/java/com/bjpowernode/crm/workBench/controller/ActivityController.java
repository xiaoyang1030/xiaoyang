package com.bjpowernode.crm.workBench.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.bean.ActivityQueryVo;
import com.bjpowernode.crm.workBench.service.ActivityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;


    @RequestMapping("/workbench/activity/list")
    @ResponseBody
    public ResultVo selectAll(@RequestParam(defaultValue = "1") int page, int pageSize,
                              ActivityQueryVo activityQueryVo) {
        PageHelper.startPage(page,pageSize);
        List<Activity> activities = activityService.queryAll(activityQueryVo);
        PageInfo<Activity> pageInfo=new PageInfo<>(activities);
        ResultVo<Activity> resultVo=new ResultVo();
        resultVo.setPageInfo(pageInfo);
        return resultVo;
    }

    //添加和修改
    @RequestMapping("createOrUpdateActivity")
    @ResponseBody
    public ResultVo createOrUpdateActivity(Activity activity, HttpSession session){
        ResultVo resultVo=null;
        try{
            User user = (User) session.getAttribute("user");

            if(activity.getId()==null){
                activity.setCreateBy(user.getName());
            }else{
                activity.setEditBy(user.getName());
            }
           String id=activity.getId();
            //获取activity的id号
            activityService.createOrUpdateActivity(activity);
            if(id==null){
                resultVo=new ResultVo(true,"添加市场成功");
            }else {
                resultVo=new ResultVo(true,"修改市场成功");
            }

        }catch (CrmException e){
           resultVo=new ResultVo(false,e.getMessage());
        }
        return resultVo;
    }

    @RequestMapping("queryById")
    @ResponseBody
    public Activity queryById(String id){
        return activityService.selectById(id);
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public ResultVo delBacth(String id){
        ResultVo resultVo=null;
        try{
            System.out.println(id);
            activityService.deleteBatch(id);
            resultVo=new ResultVo(true,"删除成功");
        }catch (CrmException e){
         resultVo=new ResultVo(false,e.getMessage());
        }
        return resultVo;
    }

    @RequestMapping("delActivityBeizhu")
    @ResponseBody
    public ResultVo delActivityBeizhu(String id){
        ResultVo resultVo=null;
        try{
                System.out.println(id);
            activityService.delActivityBeizhu(id);
            resultVo=new ResultVo(true,"删除成功");
        }catch (CrmException e){
         resultVo=new ResultVo(false,e.getMessage());
        }
        return resultVo;
    }

    @RequestMapping("toDetail")
    public String toDetail(String id, Model model){
        Activity activity = activityService.selectById(id);
        model.addAttribute("activity",activity);
        return "/activity/detail";
    }
}

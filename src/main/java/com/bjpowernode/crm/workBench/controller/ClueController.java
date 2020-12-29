package com.bjpowernode.crm.workBench.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.*;
import com.bjpowernode.crm.workBench.service.ClueSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClueController {
    @Autowired
    private ClueSerice clueSerice;

    @RequestMapping("clue/listClue")
    @ResponseBody
    public List<Clue> listClue(ClueQueryVo clueQueryVo) {
        List<Clue> clue = clueSerice.selectList(clueQueryVo);
        return clue;
    }


    @RequestMapping("createClue")
    @ResponseBody
    public ResultVo createClue(Clue clue, HttpSession session) {
        ResultVo resultVo = null;
        try {

            User user = (User) session.getAttribute("user");
            clue.setCreateby(user.getName());
            clueSerice.createClue(clue);
            resultVo = new ResultVo(true, "添加线索成功");
        } catch (CrmException e) {
            e.printStackTrace();
            resultVo = new ResultVo(true, e.getMessage());
        }
        return resultVo;
    }

    @RequestMapping("/clue/queryById")
    public String queryById(String id, Model model, HttpSession session) {
        List<User> users = (List<User>) session.getServletContext().getAttribute("users");
        Clue clue = clueSerice.selectById(id, users);
        List<ClueActivityRelation> clueActivityRelations = clueSerice.queryAll(id);
        model.addAttribute("clue", clue);
        model.addAttribute("relation", clueActivityRelations);
        return "/clue/detail";
    }

    //解除线索和市场的关联
    @RequestMapping("clue/unbind")
    @ResponseBody
    public ResultVo unbind(String id) {
        ResultVo resultVo = null;
        try {
            clueSerice.unbind(id);
            resultVo = new ResultVo(true, "删除绑定成功");
        } catch (CrmException e) {
            resultVo = new ResultVo(true, e.getMessage());
        }
        return resultVo;
    }

    @RequestMapping("clue/bindguanxi")
    @ResponseBody
    public ResultVo bindguanxi(String ids, String clueid,Model model) {
        ResultVo resultVo = new ResultVo();
        try {

            List<Activity> bind = clueSerice.bind(ids, clueid);
            resultVo.setList(bind);
            resultVo.setOk(true);
            resultVo.setMess("关联市场活动成功");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMess(e.getMessage());
        }
        return resultVo;
    }

    //从线索详情页跳转到线索转换页面
    @RequestMapping("clue/convert")
    public String convert(String id,Model model,HttpSession session){
        List<User> users = (List<User>) session.getServletContext().getAttribute("users");
        Clue clue = clueSerice.selectById(id, users);
        model.addAttribute("clue", clue);
        return "clue/convert";
    }

    //转换
    @RequestMapping("clue/transfer")
    @ResponseBody
    public ResultVo transfer(String isTran, HttpSession session, String clueid, Tran tran){
     ResultVo resultVo=new ResultVo();
     try{
         User user =(User) session.getAttribute("user");
         clueSerice.transfer(isTran,clueid,tran,user.getName());
         resultVo.setOk(true);
         resultVo.setMess("转换成功");
     }catch (CrmException e){
         resultVo.setOk(true);
         resultVo.setMess(e.getMessage());
     }
     return resultVo;
    }

}

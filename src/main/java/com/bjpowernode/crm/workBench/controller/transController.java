package com.bjpowernode.crm.workBench.controller;

import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.Customer;
import com.bjpowernode.crm.workBench.bean.StageVo;
import com.bjpowernode.crm.workBench.bean.Tran;
import com.bjpowernode.crm.workBench.bean.TranVO;
import com.bjpowernode.crm.workBench.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class transController {
    @Autowired
    TransactionService transactionService;

    @RequestMapping("/transaction/save")
    private String save(){
        return "/transaction/save";
    }

    //主动提示功能
    @RequestMapping("workbench/transaction/queryCustomerName")
    @ResponseBody
    public List<String> queryCustomerName(String customerName){
        List<String> strings = transactionService.queryCustomerName(customerName);
        return strings;
    }

    //根据公司名称查询公司主键
    @RequestMapping("transaction/queryIdByName")
    @ResponseBody
    public Customer queryIdByName(String customerName){
        return transactionService.queryIdByName(customerName);
    }


    //写阶段提示可能性
    @RequestMapping("transaction/queryPossibility")
    @ResponseBody
    public String queryPossibility(String stage, HttpSession session){
        Map<String,String> stage2Possibility = (Map<String, String>) session.getServletContext().getAttribute("stage2Possibility");
        return stage2Possibility.get(stage);
    }
    @RequestMapping("transaction/createTransaction")
    public String createTransaction(Tran tran,HttpSession session){
        User user = (User) session.getAttribute("user");
        transactionService.createTransaction(tran,user.getName());
        return "transaction/index";
    }

    @RequestMapping("transaction/listTran")
    @ResponseBody
    public List<Tran> listTran(TranVO tranvo,HttpSession session){
        List<User> users = (List<User>) session.getServletContext().getAttribute("users");
        List<Tran> trans = transactionService.selectAllTrans(tranvo, users);
        return trans;
    }
    @RequestMapping("transaction/detail")
    public String detail(String tranId, HttpSession session, Model model){
        List<User> users = (List<User>) session.getServletContext().getAttribute("users");
        Tran tran = transactionService.selectByTranId(tranId, users);
        model.addAttribute("tran",tran);
        return "transaction/detail";
    }

    @RequestMapping("transaction/queryStage")
    @ResponseBody
    public List<StageVo> queryStage(String id, HttpSession session,String index){
        User user = (User) session.getAttribute("user");
        Map<String,String>  dictionaryMap = (Map<String, String>) session.getServletContext().getAttribute("stage2Possibility");
        List<StageVo> stageImgVos =transactionService.selectStage(id,index,dictionaryMap,user.getName());
        return stageImgVos;
    }

}

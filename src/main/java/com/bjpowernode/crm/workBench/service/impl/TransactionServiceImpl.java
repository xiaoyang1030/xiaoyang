package com.bjpowernode.crm.workBench.service.impl;

import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.*;
import com.bjpowernode.crm.workBench.mapper.*;
import com.bjpowernode.crm.workBench.service.TransactionService;
import org.apache.ibatis.transaction.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private TranDao tranDao;
    @Autowired
    private TranHistoryDao tranHistoryDao;
    @Autowired
    private TranRemarkDao tranRemarkDao;
    @Autowired
    private ContactsDao contactsDao;
    @Autowired
    private ActivityDao activityDao;


    //主动提示功能
    @Override
    public List<String> queryCustomerName(String customername) {
        List<Customer> customers = customerDao.selectByName(customername);
        List<String> names = new ArrayList<>();
        for (Customer customer : customers) {
            names.add(customer.getName());
        }
        return names;
    }

    @Override
    public Customer queryIdByName(String customerName) {
        List<Customer> customers = customerDao.selectCustomer(customerName);
        if (customers.size() > 0) {
            return customers.get(0);
        }
        return null;
    }

    @Override
    public void createTransaction(Tran tran, String name) {
        tran.setId(UUIDUtil.getUUID());
        tran.setCreatetime(DateTimeUtil.getSysTime());
        tran.setCreateby(name);
        int i = tranDao.insertSelective(tran);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.CREATE_TRANACTION);
        }

        //添加交易历史
        TranHistory transactionHistory = new TranHistory();
        transactionHistory.setId(UUIDUtil.getUUID());
        transactionHistory.setCreateby(name);
        transactionHistory.setCreatetime(DateTimeUtil.getSysTime());
        transactionHistory.setExpecteddate(tran.getExpecteddate());
        transactionHistory.setStage(tran.getStage());
        transactionHistory.setMoney(tran.getMoney());
        transactionHistory.setTranid(tran.getId());
        tranHistoryDao.insertSelective(transactionHistory);


        //添加交易备注
        TranRemark transactionRemark = new TranRemark();
        transactionRemark.setId(UUIDUtil.getUUID());
        transactionRemark.setEditflag("0");
        transactionRemark.setTranid(tran.getId());
        transactionRemark.setCreateby(name);
        transactionRemark.setCreatetime(DateTimeUtil.getSysTime());
        transactionRemark.setNotecontent(tran.getDescription());
        tranRemarkDao.insertSelective(transactionRemark);
    }

    @Override
    public List<Tran> selectAllTrans(TranVO tranvo, List<User> users) {
        List<Tran> trans = tranDao.selectAll(tranvo);
        List<Customer> customers = customerDao.selectAll();
        for (Tran tran : trans) {
            for (Customer customer : customers) {
                if (tran.getCustomerid() != null) {
                    if (tran.getCustomerid().equals(customer.getId())) {
                        tran.setCustomerid(customer.getName());
                    }
                } else {
                    continue;
                }

            }
        }
        return trans;
    }

    @Override
    public Tran selectByTranId(String tranId, List<User> users) {

        Tran tran = tranDao.selectByPrimaryKey(tranId);
        Customer customer = customerDao.selectByPrimaryKey(tran.getCustomerid());
        tran.setCustomerid(customer.getName());
        Contacts contacts = contactsDao.selectByPrimaryKey(tran.getContactsid());
        tran.setContactsid(contacts.getFullname());
        Activity activity = activityDao.selectByPrimaryKey(tran.getActivityid());
        tran.setActivityid(activity.getName());
        List<TranRemark> tranRemarks = tranRemarkDao.selectByTranId(tranId);
        List<TranHistory> histories=tranHistoryDao.selectByTranId(tranId);
        tran.setTranHistories(histories);
        tran.setTranRemarks(tranRemarks);
        return tran;
    }

    @Override
    public List<StageVo> selectStage(String id, String location, Map<String, String> dictionaryMap, String name) {
        Set<Map.Entry<String, String>> entries = dictionaryMap.entrySet();
        List<Map.Entry<String, String>> stage2Posibility=new ArrayList<>(entries);
        String currentStage="";
        String currentPossibiliry="";
        Tran tran=null;
        List<TranHistory> tranHistories=null;
        int index=0;
        if(location==null){
            tran = tranDao.selectByPrimaryKey(id);
            currentStage=tran.getStage();
            currentPossibiliry=tran.getPossibitility();
            for (int i = 0; i <stage2Posibility.size() ; i++) {
                String stage=stage2Posibility.get(i).getKey();
                if(currentStage.equals(stage)){
                    index=i;
                    break;
                }
            }
        }else{
            //点击交易图标，修改交易阶段
            index = Integer.parseInt(location);
            //改变当前交易的阶段
            tran = new Tran();
            tran.setId(id);
            tran.setEditby(name);
            tran.setEdittime(DateTimeUtil.getSysTime());
            currentStage = stage2Posibility.get(index).getKey();
            currentPossibiliry = stage2Posibility.get(index).getValue();

            tran.setStage(currentStage);
            tran.setPossibitility(currentPossibiliry);
            //更新交易的状态(数据库)
            tranDao.updateByPrimaryKeySelective(tran);

            //点击更改交易阶段，重新查询最新交易信息
            tran = tranDao.selectByPrimaryKey(id);

            //创建一条当前改变交易阶段交易历史
            TranHistory transactionHistory = new TranHistory();
            transactionHistory.setId(UUIDUtil.getUUID());
            transactionHistory.setTranid(id);
            transactionHistory.setPossibility(currentPossibiliry);
            transactionHistory.setExpecteddate(tran.getExpecteddate());
            transactionHistory.setMoney(tran.getMoney());
            transactionHistory.setStage(currentStage);
            transactionHistory.setCreatetime(DateTimeUtil.getSysTime());
            transactionHistory.setCreateby(name);

            tranHistoryDao.insertSelective(transactionHistory);

            //查询当前交易对应交易历史信息,如果想实现按创建事件排序，请用Example查询
            tranHistories = tranHistoryDao.selectByTranId(id);
        }



        int pointer = 0;
        //查找交易可能性为0的pointer:临界点
        for(int i = 0; i < stage2Posibility.size(); i++){
            String posibility = stage2Posibility.get(i).getValue();//每个阶段对应的可能性
            if("0".equals(posibility)){
                pointer = i;
                break;
            }
        }

        List<StageVo> stageImgVos = new ArrayList<>();//存放当前交易的交易图标

        /**
         *  开始确定当前交易所处阶段对应的交易图标的种类(三种中的一种)
         */
        //交易失败了 ==>前7个肯定是黑圈 后两个是x，红x和黑x不能确定
        if("0".equals(currentPossibiliry)){
            //遍历缓存中所有的阶段和可能性
            for(int i = 0; i < stage2Posibility.size(); i++){
                StageVo stageImgVo = new StageVo();
                String stage = stage2Posibility.get(i).getKey();//每个阶段
                String posibility = stage2Posibility.get(i).getValue();//每个阶段对应的可能性
                if("0".equals(posibility)){//失败当中黑x
                    if(stage.equals(currentStage)){
                        //红x
                        System.out.println("red X");
                        stageImgVo.setType("红x");
                    }else{
                        //黑x
                        System.out.println("black X");
                        stageImgVo.setType("黑x");
                    }
                }else{//前7个是黑圈
                    System.out.println("black circle");
                    stageImgVo.setType("黑圈");
                }
                stageImgVo.setStage(stage);
                stageImgVo.setPosibility(posibility);
                stageImgVos.add(stageImgVo);
                stageImgVo.setIndex(i + "");
            }
        }else{
            //交易中或者交易成功 ==> 后两个肯定黑x
            for(int i = 0; i < stage2Posibility.size(); i++){
                String stage = stage2Posibility.get(i).getKey();//每个阶段
                String posibility = stage2Posibility.get(i).getValue();//每个阶段对应的可能性
                StageVo stageImgVo = new StageVo();
                if(i < index){
                    System.out.println("green cricle");
                    stageImgVo.setType("绿圈");
                }else if(index == i){
                    System.out.println("maodian");
                    stageImgVo.setType("锚点");
                }else if(index < i && i < pointer){
                    System.out.println("black circle");
                    stageImgVo.setType("黑圈");
                }else{
                    System.out.println("black X");
                    stageImgVo.setType("黑x");
                }
                stageImgVo.setStage(stage);
                stageImgVo.setPosibility(posibility);
                stageImgVos.add(stageImgVo);
                stageImgVo.setIndex(i + "");
            }
        }
        //把每次更改之后的交易历史保存在交易图标集合中的第一个元素中，你也可以保存在其他元素中
        stageImgVos.get(0).setTran(tran);
        //把交易历史也放在第一个元素中
        stageImgVos.get(0).setTranHistories(tranHistories);
        return stageImgVos;
    }
}

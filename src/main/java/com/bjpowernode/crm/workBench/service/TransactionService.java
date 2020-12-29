package com.bjpowernode.crm.workBench.service;

import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.Customer;
import com.bjpowernode.crm.workBench.bean.StageVo;
import com.bjpowernode.crm.workBench.bean.Tran;
import com.bjpowernode.crm.workBench.bean.TranVO;

import java.util.List;
import java.util.Map;

public interface TransactionService {
    List<String> queryCustomerName(String customername);

    Customer queryIdByName(String customerName);

    void createTransaction(Tran tran,String name);

    List<Tran> selectAllTrans(TranVO tranvo, List<User> users);

    Tran selectByTranId(String tranId, List<User> users);

    List<StageVo> selectStage(String id, String location, Map<String, String> dictionaryMap, String name);
}

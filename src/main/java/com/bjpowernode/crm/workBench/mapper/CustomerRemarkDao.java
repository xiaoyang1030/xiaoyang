package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.CustomerRemark;

public interface CustomerRemarkDao {
    int deleteByPrimaryKey(String id);

    int insert(CustomerRemark record);

    int insertSelective(CustomerRemark record);

    CustomerRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CustomerRemark record);

    int updateByPrimaryKey(CustomerRemark record);
}
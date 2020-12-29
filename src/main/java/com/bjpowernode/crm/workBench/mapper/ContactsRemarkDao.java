package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.ContactsRemark;

public interface ContactsRemarkDao {
    int deleteByPrimaryKey(String id);

    int insert(ContactsRemark record);

    int insertSelective(ContactsRemark record);

    ContactsRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ContactsRemark record);

    int updateByPrimaryKey(ContactsRemark record);
}
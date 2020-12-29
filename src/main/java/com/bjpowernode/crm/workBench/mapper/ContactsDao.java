package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Contacts;

public interface ContactsDao {
    int deleteByPrimaryKey(String id);

    int insert(Contacts record);

    int insertSelective(Contacts record);

    Contacts selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Contacts record);

    int updateByPrimaryKey(Contacts record);
}
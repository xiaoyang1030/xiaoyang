package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.ContactsActivityRelation;

public interface ContactsActivityRelationDao {
    int deleteByPrimaryKey(String id);

    int insert(ContactsActivityRelation record);

    int insertSelective(ContactsActivityRelation record);

    ContactsActivityRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ContactsActivityRelation record);

    int updateByPrimaryKey(ContactsActivityRelation record);
}
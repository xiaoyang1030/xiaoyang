package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.ClueActivityRelation;

public interface ClueActivityRelationDao {
    int deleteByPrimaryKey(String id);

    int insert(ClueActivityRelation record);

    int insertSelective(ClueActivityRelation record);

    ClueActivityRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClueActivityRelation record);

    int updateByPrimaryKey(ClueActivityRelation record);
}
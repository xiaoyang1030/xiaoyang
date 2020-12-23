package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.ClueRemark;

public interface ClueRemarkDao {
    int deleteByPrimaryKey(String id);

    int insert(ClueRemark record);

    int insertSelective(ClueRemark record);

    ClueRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClueRemark record);

    int updateByPrimaryKey(ClueRemark record);
}
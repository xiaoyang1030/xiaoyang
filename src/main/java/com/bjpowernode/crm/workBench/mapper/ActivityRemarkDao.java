package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {
    int deleteByPrimaryKey(String id);

    int insert(ActivityRemark record);

    int insertSelective(ActivityRemark record);

    List<ActivityRemark> selectAll();

    ActivityRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ActivityRemark record);

    int updateByPrimaryKey(ActivityRemark record);

    List<ActivityRemark> selectByActivityId(String id);
}
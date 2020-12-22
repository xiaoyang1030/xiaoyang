package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.bean.ActivityQueryVo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ActivityDao   {
     List<Activity> selectAll(ActivityQueryVo activityQueryVo);

    int insertActivity(Activity activity);

    Activity selectById(String id);

    int deleteByPrimaryKey(String id);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);
}

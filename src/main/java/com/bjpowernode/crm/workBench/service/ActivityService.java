package com.bjpowernode.crm.workBench.service;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.bean.ActivityQueryVo;
import com.bjpowernode.crm.workBench.bean.ActivityRemark;

import java.util.List;

public interface ActivityService {
    List<Activity> queryAll(ActivityQueryVo activityQueryVo);


    void createOrUpdateActivity(Activity activity);

    Activity selectById(String id);

    void deleteBatch(String id);

    void delActivityBeizhu(String id);

   ActivityRemark queryByRemarkId(String id);

    void updateEditRemark(ActivityRemark activityRemark);

    ActivityRemark createEditRemark(ActivityRemark activityRemark);
}

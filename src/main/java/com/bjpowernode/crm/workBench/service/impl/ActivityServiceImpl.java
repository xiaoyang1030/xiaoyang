package com.bjpowernode.crm.workBench.service.impl;

import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserDao;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.bean.ActivityQueryVo;
import com.bjpowernode.crm.workBench.bean.ActivityRemark;
import com.bjpowernode.crm.workBench.mapper.ActivityDao;
import com.bjpowernode.crm.workBench.mapper.ActivityRemarkDao;
import com.bjpowernode.crm.workBench.mapper.ClueActivityRelationDao;
import com.bjpowernode.crm.workBench.mapper.ClueDao;
import com.bjpowernode.crm.workBench.service.ActivityService;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("service")
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityDao activityDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ActivityRemarkDao activityRemarkDao;
    @Autowired
    private ClueDao clueDao;
    @Autowired
    private ClueActivityRelationDao activityRelationDao;

    @Override
    public List<Activity> queryAll(ActivityQueryVo activityQueryVo) {
        List<Activity> activities = activityDao.selectAll(activityQueryVo);

        for (Activity activity : activities) {
            User user = userDao.selectByPrimaryKey(activity.getOwner());
            activity.setOwner(user.getName());
        }
        return activities;
    }

    @Override
    public void createOrUpdateActivity(Activity activity) {
        if (activity.getId() == null) {
            activity.setId(UUIDUtil.getUUID());
            activity.setCreateTime(DateTimeUtil.getSysTime());
            int count = activityDao.insertActivity(activity);
            if (count == 0) {
                throw new CrmException(CrmExceptionEnum.ACTIVITY_CREATE);
            }
        } else {
            activity.setEditTime(DateTimeUtil.getSysTime());
            int i = activityDao.updateByPrimaryKeySelective(activity);
            if (i == 0) {
                throw new CrmException(CrmExceptionEnum.ACTIVITY_EDIT);
            }
        }

    }

    @Override
    public Activity selectById(String id) {
        Activity activity = activityDao.selectById(id);
        User user = userDao.selectByPrimaryKey(activity.getOwner());
        activity.setOwner(user.getName());
        List<ActivityRemark> activityRemarks = activityRemarkDao.selectByActivityId(id);
        activity.setActivityRemark(activityRemarks);
        return activity;
    }

    @Override
    public void delActivityBeizhu(String id) {
        int i = activityRemarkDao.deleteByPrimaryKey(id);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.ACTIVITY_BEIZHUDELETE);
        }
    }

    @Override
    public ActivityRemark queryByRemarkId(String id) {
        return activityRemarkDao.selectByPrimaryKey(id);
    }

    @Override
    public void updateEditRemark(ActivityRemark activityRemark) {
        activityRemark.setEdittime(DateTimeUtil.getSysTime());
        activityRemark.setEditflag("1");
        int i = activityRemarkDao.updateByPrimaryKeySelective(activityRemark);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.ACTIVITY_EDITBEIZHU);
        }
    }

    @Override
    public ActivityRemark createEditRemark(ActivityRemark activityRemark) {
        activityRemark.setId(UUIDUtil.getUUID());
        activityRemark.setCreatetime(DateTimeUtil.getSysTime());
        activityRemark.setEditflag("0");
        int i = activityRemarkDao.insertSelective(activityRemark);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.ACTIVITY_CREATEBEIZHU);
        } else {
            return activityRemark;
        }
    }

    //查询所有未关联的市场活动
    @Override
    public List<Activity> selectByName(String name,String clueid) {

        List<Activity> activities=activityDao.selectByName(name,clueid);
        for (Activity activity : activities) {
            List<User> users = userDao.selectAll();
            for (User user : users) {
                if(activity.getOwner().equals(user.getId())){
                    activity.setOwner(user.getName());
                }
            }
        }
        return activities;
    }

    //查询所有已经关联的市场活动
    @Override
    public List<Activity> selectByClueIdName(String name, String clueid) {
        List<Activity> activities=activityDao.selectByNameAndClueid(name,clueid);
        for (Activity activity : activities) {
            List<User> users = userDao.selectAll();
            for (User user : users) {
                if(activity.getOwner().equals(user.getId())){
                    activity.setOwner(user.getName());
                }
            }
        }
        return activities;
    }

    @Override
    public List<Activity> selectActivityName(String name) {
        List<Activity> activities=activityDao.selectByActivityName(name);
        for (Activity activity : activities) {
            List<User> users = userDao.selectAll();
            for (User user : users) {
                if(activity.getOwner().equals(user.getId())){
                    activity.setOwner(user.getName());
                }
            }
        }
        return activities;
    }

    @Override
    public void deleteBatch(String id) {
        String[] split = id.split("-");
        for (String del : split) {
            int i = activityDao.deleteByPrimaryKey(del);
            if (i == 0) {
                throw new CrmException(CrmExceptionEnum.ACTIVITY_delBach);
            }
        }
    }


}

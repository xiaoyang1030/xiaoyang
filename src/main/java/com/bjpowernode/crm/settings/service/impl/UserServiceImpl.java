package com.bjpowernode.crm.settings.service.impl;

import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserDao;
import com.bjpowernode.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Override
    public List<User> queryUsers() {
        return userDao.selectAll();
    }

    @Override
    public User queryOne(User user) {
        user.setLoginPwd(MD5Util.getMD5(user.getLoginPwd()));
        //在查出用户数据之前要先取出客户端的ip地址信息
        String address = user.getAllowIps();
        //得把客户端的ip置为null，如果不是null将会参与条件查询
        user.setAllowIps(null);
        user = userDao.selectOne(user);
        //查询用户判断用户是否为空，如果为空上抛异常
        if(user==null){
            throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_EXCEPTION);
            //进入此else证明用户名和密码没问题
        }else {
           //判断日期是否超过，超过上报异常
            if(user.getExpireTime().compareTo(DateTimeUtil.getSysTime())<=0){
                throw new CrmException(CrmExceptionEnum.LOGIN_EXPIRE_EXCEPTION);
            }
            if("0".equals(user.getLockState())){
                throw new CrmException(CrmExceptionEnum.LOGIN_LOCK_EXCEPTION);
            }
            if(user.getAllowIps().contains(address)){
                throw new CrmException(CrmExceptionEnum.LOGIN_IP_EXCEPTION);
            }
        }
        return user;
    }

    @Override
    public List<User> queryAll() {
        return userDao.selectAll();
    }


}

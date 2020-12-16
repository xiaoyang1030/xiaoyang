package com.bjpowernode.model.service.impl;

import com.bjpowernode.entity.User;
import com.bjpowernode.model.dao.UserDao;
import com.bjpowernode.model.service.ProvinceService;
import com.bjpowernode.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(User record) {
        return userDao.insert(record);
    }

    @Override
    public int insertSelective(User record) {
        return userDao.insertSelective(record);
    }

    @Override
    public List<User> selectAll() {
        return userDao.selectAll();
    }

    @Override
    public User selectByPrimaryKey(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userDao.updateByPrimaryKey(record);
    }


    @Override
    public void delbatch(Integer[] cids) {
        userDao.delbatch(cids);
    }

    @Override
    public List<User> selectUsers(User user) {
        return userDao.selectUsers(user);
    }

    @Override
    public int getTotalNum(User user) {
        return userDao.selectTotalNum( user);
    }

    @Override
    public User getByUserNameAndPwd(String userName, String password) {
        return userDao.selectOne(userName,password);
    }

    @Override
    public void updateByProvinceId(Integer id) {
        userDao.updateByProvinceId(id);
    }
}

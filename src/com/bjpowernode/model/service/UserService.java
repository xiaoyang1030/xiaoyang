package com.bjpowernode.model.service;

import com.bjpowernode.entity.User;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectAll();

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    void delbatch(Integer[] cids);

    List<User> selectUsers(User user);

    int getTotalNum(User user);

    User getByUserNameAndPwd(String userName, String password);

    void updateByProvinceId(Integer id);
}

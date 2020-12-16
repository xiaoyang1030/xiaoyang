package com.bjpowernode.model.dao;

import com.bjpowernode.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectAll();

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


    void delbatch(Integer[] cids);

    List<User> selectUsers(User user);

    int selectTotalNum(User user);

    User selectOne(@Param("userName") String userName,@Param("password") String password);

    void updateByProvinceId(Integer id);
}
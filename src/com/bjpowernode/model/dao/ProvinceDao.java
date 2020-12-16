package com.bjpowernode.model.dao;

import com.bjpowernode.entity.Province;

import java.util.List;

public interface ProvinceDao {
    int deleteByPrimaryKey(Integer pid);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);

    List<Province> selectAll();
}
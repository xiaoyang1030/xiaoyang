package com.bjpowernode.model.service;

import com.bjpowernode.entity.Province;

import java.util.List;

public interface ProvinceService {
    int deleteByPrimaryKey(Integer pid);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);

    List<Province> selectAll();
}

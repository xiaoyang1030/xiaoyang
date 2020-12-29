package com.bjpowernode.crm.base.mapper;

import com.bjpowernode.crm.base.bean.DicType;

import java.util.List;

public interface DicTypeDao {
    int deleteByPrimaryKey(String code);

    int insert(DicType record);

    int insertSelective(DicType record);
    List<DicType> selectAll();

    DicType selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(DicType record);

    int updateByPrimaryKey(DicType record);
}
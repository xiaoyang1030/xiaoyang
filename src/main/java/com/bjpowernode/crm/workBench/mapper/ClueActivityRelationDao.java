package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.bean.ClueActivityRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueActivityRelationDao {
    int deleteByPrimaryKey(String id);

    int insert(ClueActivityRelation record);

    int insertSelective(ClueActivityRelation record);

    ClueActivityRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClueActivityRelation record);

    int updateByPrimaryKey(ClueActivityRelation record);

    List<ClueActivityRelation> queryList();

    List<String> queryByCLueId(@Param("clueid")String clueid);

    List<ClueActivityRelation> selectByCLueId(@Param("clueid")String clueid);

    void deleteByClueidAndActivityId(ClueActivityRelation clueActivityRelation1);
}
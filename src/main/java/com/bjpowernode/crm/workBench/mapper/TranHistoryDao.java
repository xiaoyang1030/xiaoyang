package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.TranHistory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TranHistoryDao {
    int deleteByPrimaryKey(String id);

    int insert(TranHistory record);

    int insertSelective(TranHistory record);

    TranHistory selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TranHistory record);

    int updateByPrimaryKey(TranHistory record);

    List<TranHistory> selectByTranId(@Param("tranId") String tranId);
}
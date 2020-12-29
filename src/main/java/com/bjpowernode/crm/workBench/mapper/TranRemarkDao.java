package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.TranRemark;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TranRemarkDao {
    int deleteByPrimaryKey(String id);

    int insert(TranRemark record);

    int insertSelective(TranRemark record);
    
    List<TranRemark> selectByTranId(@Param("tranId")String tranid);

    TranRemark selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TranRemark record);

    int updateByPrimaryKey(TranRemark record);

}
package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Tran;
import com.bjpowernode.crm.workBench.bean.TranVO;

import java.util.List;

public interface TranDao {
    int deleteByPrimaryKey(String id);

    int insert(Tran record);

    int insertSelective(Tran record);

    Tran selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Tran record);

    int updateByPrimaryKey(Tran record);

    List<Tran> selectAll(TranVO tranvo);
}
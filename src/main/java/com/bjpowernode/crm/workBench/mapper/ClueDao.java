package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Clue;
import com.bjpowernode.crm.workBench.bean.ClueQueryVo;

import java.util.List;

public interface ClueDao {
    int deleteByPrimaryKey(String id);

    int insert(Clue record);

    int insertSelective(Clue record);

    Clue selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Clue record);

    int updateByPrimaryKey(Clue record);

    List<Clue> selectAll(ClueQueryVo clueQueryVo);


}
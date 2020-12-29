package com.bjpowernode.crm.workBench.service;

import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.*;

import java.util.List;

public interface ClueSerice {
    void createClue(Clue clue);

    Clue selectById(String id, List<User> users);

    List<Clue> selectList(ClueQueryVo clueQueryVo);


    List<ClueActivityRelation> queryAll(String id);

    void unbind(String id);

    List<Activity> bind(String ids, String clueid);

    void transfer(String isTran, String clueid, Tran tran,String username);
}

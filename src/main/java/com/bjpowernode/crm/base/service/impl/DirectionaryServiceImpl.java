package com.bjpowernode.crm.base.service.impl;

import com.bjpowernode.crm.base.bean.DicType;
import com.bjpowernode.crm.base.bean.DicValue;
import com.bjpowernode.crm.base.mapper.DicTypeDao;
import com.bjpowernode.crm.base.mapper.DicValueDao;
import com.bjpowernode.crm.base.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DirectionaryServiceImpl implements DictionaryService {
    @Autowired
    private DicTypeDao dicTypeDao;
    @Autowired
    private DicValueDao dicValueDao;

    @Override
    public Map<String, List<DicValue>> selectAll() {
        List<DicType> dicTypes = dicTypeDao.selectAll();
        Map<String,List<DicValue>> map=new HashMap<>();
        for (DicType dicType : dicTypes) {
            Example example=new Example(DicValue.class);
            example.createCriteria().andEqualTo("typecode",dicType.getCode());
            example.setOrderByClause("orderno");
            List<DicValue> dicValues = dicValueDao.selectByExample(example);
            map.put(dicType.getCode(),dicValues);
        }
        return map;
    }
}

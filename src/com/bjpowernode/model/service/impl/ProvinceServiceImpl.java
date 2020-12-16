package com.bjpowernode.model.service.impl;

import com.bjpowernode.entity.Province;
import com.bjpowernode.model.dao.ProvinceDao;
import com.bjpowernode.model.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("provinceImpl")
public class ProvinceServiceImpl implements ProvinceService {
    @Autowired
    ProvinceDao provinceDao;
    @Override
    public int deleteByPrimaryKey(Integer pid) {
        return provinceDao.deleteByPrimaryKey(pid);
    }

    @Override
    public int insert(Province record) {
        return provinceDao.insert(record);
    }

    @Override
    public int insertSelective(Province record) {
        return provinceDao.insertSelective(record);
    }

    @Override
    public Province selectByPrimaryKey(Integer pid) {
        return provinceDao.selectByPrimaryKey(pid);
    }

    @Override
    public int updateByPrimaryKeySelective(Province record) {
        return provinceDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Province record) {
        return provinceDao.updateByPrimaryKey(record);
    }

    @Override
    public List<Province> selectAll() {
        return provinceDao.selectAll();
    }
}

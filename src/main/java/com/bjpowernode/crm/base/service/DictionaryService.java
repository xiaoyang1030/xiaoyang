package com.bjpowernode.crm.base.service;

import com.bjpowernode.crm.base.bean.DicType;
import com.bjpowernode.crm.base.bean.DicValue;

import java.util.List;
import java.util.Map;

public interface DictionaryService {
    Map<String, List<DicValue>> selectAll();
}

package com.bjpowernode.crm.base.constants;

import com.bjpowernode.crm.base.bean.DicType;
import com.bjpowernode.crm.base.bean.DicValue;
import com.bjpowernode.crm.base.service.DictionaryService;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resources;
import javax.servlet.ServletContext;
import java.util.*;

@Component
public class Cache {
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private UserDao userDao;

    public Cache() {

    }

    @PostConstruct
    public void init() {
        //缓存字典数据
        Map<String, List<DicValue>> stringListMap = dictionaryService.selectAll();
        servletContext.setAttribute("dictionaryMap", stringListMap);

        //缓存所有者
        List<User> users = userDao.selectAll();
        servletContext.setAttribute("users", users);

        ResourceBundle resourceBundle = ResourceBundle.getBundle("mybatis/Stage2Possibility");
        Enumeration<String> keys = resourceBundle.getKeys();
        Map<String, String> stage2Possibility = new TreeMap<>();
        while (keys.hasMoreElements()) {
            String key = keys.nextElement();//阶段
            String possibility = resourceBundle.getString(key);//可能性
            stage2Possibility.put(key, possibility);
        }
        servletContext.setAttribute("stage2Possibility",stage2Possibility);

    }
}

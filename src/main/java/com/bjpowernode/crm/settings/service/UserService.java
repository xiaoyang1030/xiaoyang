package com.bjpowernode.crm.settings.service;

import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workBench.bean.Activity;

import java.util.List;

public interface UserService {
    List<User> queryUsers();

    User queryOne(User user);

    List<User> queryAll();

    void fileUpload(User user);
}

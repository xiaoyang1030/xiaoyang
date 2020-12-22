package com.bjpowernode.crm.test;

//import com.bjpowernode.crm.base.util.MD5Util;
//import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.workBench.bean.Activity;
import com.bjpowernode.crm.workBench.mapper.ActivityDao;
import com.bjpowernode.crm.workBench.service.ActivityService;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestUser {
    @Test
    public void test01(){
        String uuid = UUIDUtil.getUUID();
        System.out.println(uuid);
    }
    @Test
    public void test02(){
        String admin = MD5Util.getMD5("admin");
        System.out.println(admin);
    }
    @Test
    public void test03(){
        int a=1;
        try{


        if(a==1){
            throw new CrmException(CrmExceptionEnum.LOGIN_ACCOUNT_EXCEPTION);
        }
        }catch (CrmException e){
            System.out.println(e.getMessage());
        }
    }

    @Autowired
    ActivityDao activityDao;
    @Test
    public void test04(){
        Activity activity = activityDao.selectByPrimaryKey("b20bdc46774b4bdab3439af7f64b3d67");
        System.out.println(activity);
    }

}

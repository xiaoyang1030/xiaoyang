package com.bjpowernode.crm.base.exception;

import com.bjpowernode.crm.base.constants.CrmExceptionEnum;

public class CrmException extends RuntimeException {
    public CrmException(){

    }

    public CrmException(CrmExceptionEnum crmExceprionEnum) {
        //如果想获取到堆栈当中的异常信息，必须调用父类的构造方法
        super(crmExceprionEnum.getMess());

    }
}

package com.bjpowernode.crm.base.constants;

public enum  CrmExceptionEnum {
    LOGIN_ACCOUNT_EXCEPTION("001","用户名或密码错误"),
    LOGIN_EXPIRE_EXCEPTION("001","账户已失效！"),
    LOGIN_LOCK_EXCEPTION("001","账户被锁定，请联系管理员！"),
    LOGIN_IP_EXCEPTION("001","不允许的IP地址！"),
    FILEUPLOAD_EXCEPTION("001","上传文件失败！"),

    ACTIVITY_CREATE("002","添加用户失败"),
    ACTIVITY_EDIT("002","修改用户失败"),
    ACTIVITY_delBach("002","删除用户失败"),
    ACTIVITY_BEIZHUDELETE("002","删除备注失败"),
    ACTIVITY_EDITBEIZHU("002","修改备注失败"),
    ACTIVITY_CREATEBEIZHU("002","添加备注失败"),

    CLUE_CREATE("003","添加线索失败"),
    CLUE_UNBIND("003","线索和市场活动解绑失败"),
    CLUE_BIND("003","关联市场活动失败"),
    CLUE_TRANSFER("003","转换失败"),

    CREATE_TRANACTION("004","创建交易失败");



    private String code;
    private String mess;

    CrmExceptionEnum() {
    }

    CrmExceptionEnum(String code, String mess) {
        this.code = code;
        this.mess = mess;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
}

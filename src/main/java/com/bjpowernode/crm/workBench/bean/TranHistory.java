package com.bjpowernode.crm.workBench.bean;

import java.io.Serializable;

/**
 * tbl_tran_history
 * @author 
 */
public class TranHistory implements Serializable {
    private String id;

    private String stage;

    private String money;

    private String expecteddate;

    private String createtime;

    private String createby;

    private String tranid;

    private String possibility;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getExpecteddate() {
        return expecteddate;
    }

    public void setExpecteddate(String expecteddate) {
        this.expecteddate = expecteddate;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getTranid() {
        return tranid;
    }

    public void setTranid(String tranid) {
        this.tranid = tranid;
    }

    public String getPossibility() {
        return possibility;
    }

    public void setPossibility(String possibility) {
        this.possibility = possibility;
    }
}
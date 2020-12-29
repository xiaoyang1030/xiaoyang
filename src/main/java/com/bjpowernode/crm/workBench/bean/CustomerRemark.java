package com.bjpowernode.crm.workBench.bean;

import java.io.Serializable;

/**
 * tbl_customer_remark
 * @author 
 */
public class CustomerRemark implements Serializable {
    private String id;

    private String notecontent;

    private String createby;

    private String createtime;

    private String editby;

    private String edittime;

    private String editflag;

    private String customerid;

    @Override
    public String toString() {
        return "CustomerRemark{" +
                "id='" + id + '\'' +
                ", notecontent='" + notecontent + '\'' +
                ", createby='" + createby + '\'' +
                ", createtime='" + createtime + '\'' +
                ", editby='" + editby + '\'' +
                ", edittime='" + edittime + '\'' +
                ", editflag='" + editflag + '\'' +
                ", customerid='" + customerid + '\'' +
                '}';
    }

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNotecontent() {
        return notecontent;
    }

    public void setNotecontent(String notecontent) {
        this.notecontent = notecontent;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getEditby() {
        return editby;
    }

    public void setEditby(String editby) {
        this.editby = editby;
    }

    public String getEdittime() {
        return edittime;
    }

    public void setEdittime(String edittime) {
        this.edittime = edittime;
    }

    public String getEditflag() {
        return editflag;
    }

    public void setEditflag(String editflag) {
        this.editflag = editflag;
    }

    public String getCustomerid() {
        return customerid;
    }

    public void setCustomerid(String customerid) {
        this.customerid = customerid;
    }
}
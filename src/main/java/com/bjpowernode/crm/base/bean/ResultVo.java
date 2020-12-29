package com.bjpowernode.crm.base.bean;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class ResultVo<T> {
    private boolean ok;
    private String mess;

    T t;

    List<T> list;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String   toString() {
        return "ResultVo{" +
                "ok=" + ok +
                ", mess='" + mess + '\'' +
                ", t=" + t +
                ", pageInfo=" + pageInfo +
                '}';
    }

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public boolean isOk() {
        return ok;
    }

    public ResultVo( boolean ok,String mess) {
        this.mess = mess;
        this.ok = ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    private PageInfo<T> pageInfo;

    public PageInfo<T> getPageInfo() {
        return pageInfo;
    }

    public ResultVo(PageInfo<T> pageInfo) {
        this.pageInfo = pageInfo;
    }

    public ResultVo() {
    }

    public void setPageInfo(PageInfo<T> pageInfo) {
        this.pageInfo = pageInfo;
    }
}

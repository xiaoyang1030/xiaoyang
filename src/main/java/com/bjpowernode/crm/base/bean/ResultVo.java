package com.bjpowernode.crm.base.bean;

import com.github.pagehelper.PageInfo;

public class ResultVo<T> {
    private boolean ok;
    private String mess;



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

    @Override
    public String toString() {
        return "ResultVo{" +
                "pageInfo=" + pageInfo +
                '}';
    }

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

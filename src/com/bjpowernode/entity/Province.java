package com.bjpowernode.entity;

import java.io.Serializable;

/**
 * province
 * @author 
 */
public class Province implements Serializable {
    private Integer pid;

    private String pname;

    private static final long serialVersionUID = 1L;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}
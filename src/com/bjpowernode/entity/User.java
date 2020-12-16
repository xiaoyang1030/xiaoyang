package com.bjpowernode.entity;

import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * t_user
 * @author 
 */
public class User implements Serializable {
    private Integer id;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 真实名称
     */
    private String realName;

    /**
     * 姓别
     *
     */
    private String sex;

    /**
     * 电话
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 备注
     */
    private String password;

    private String positionId;

    private Province province;

    public User() {
    }

    public User(Integer id, String userName, String realName, String sex, String mobile, String email, String password, String positionId, Province province) {
        this.id = id;
        this.userName = userName;
        this.realName = realName;
        this.sex = sex;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
        this.positionId = positionId;
        this.province = province;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPositionId() {
        return positionId;
    }

    public void setPositionId(String positionId) {
        this.positionId = positionId;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}
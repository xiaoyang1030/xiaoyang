package com.bjpowernode.crm.base.bean;

import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * tbl_dic_value
 * @author 
 */
@Table(name = "tbl_dic_value")
@NameStyle(Style.normal)
public class DicValue implements Serializable {
    /**
     * 主键，采用UUID
     */
    @Id
    private String id;

    /**
     * 不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。
     */
    private String value;

    /**
     * 可以为空
     */
    private String text;

    /**
     * 可以为空，但不为空的时候，要求必须是正整数
     */
    private String orderno;

    /**
     * 外键
     */
    private String typecode;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }

    public String getTypecode() {
        return typecode;
    }

    public void setTypecode(String typecode) {
        this.typecode = typecode;
    }
}
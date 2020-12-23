package com.bjpowernode.crm.workBench.bean;

import java.io.Serializable;

/**
 * tbl_clue_activity_relation
 * @author 
 */
public class ClueActivityRelation implements Serializable {
    private String id;

    private String clueid;

    private String activityid;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClueid() {
        return clueid;
    }

    public void setClueid(String clueid) {
        this.clueid = clueid;
    }

    public String getActivityid() {
        return activityid;
    }

    public void setActivityid(String activityid) {
        this.activityid = activityid;
    }
}
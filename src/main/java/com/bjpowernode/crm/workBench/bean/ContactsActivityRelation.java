package com.bjpowernode.crm.workBench.bean;

import java.io.Serializable;

/**
 * tbl_contacts_activity_relation
 * @author 
 */
public class ContactsActivityRelation implements Serializable {
    private String id;

    private String contactsid;

    private String activityid;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContactsid() {
        return contactsid;
    }

    public void setContactsid(String contactsid) {
        this.contactsid = contactsid;
    }

    public String getActivityid() {
        return activityid;
    }

    public void setActivityid(String activityid) {
        this.activityid = activityid;
    }
}
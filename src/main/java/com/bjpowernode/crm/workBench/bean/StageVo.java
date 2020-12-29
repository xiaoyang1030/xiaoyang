package com.bjpowernode.crm.workBench.bean;

import java.util.List;

public class StageVo {
    private String stage;
    private String posibility;
    private String type;
    private String index;
    private Tran tran;
    private List<TranHistory> tranHistories;

    @Override
    public String toString() {
        return "StageVo{" +
                "stage='" + stage + '\'' +
                ", posibility='" + posibility + '\'' +
                ", type='" + type + '\'' +
                ", index='" + index + '\'' +
                ", tran=" + tran +
                ", tranHistories=" + tranHistories +
                '}';
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public Tran getTran() {
        return tran;
    }

    public void setTran(Tran tran) {
        this.tran = tran;
    }

    public List<TranHistory> getTranHistories() {
        return tranHistories;
    }

    public void setTranHistories(List<TranHistory> tranHistories) {
        this.tranHistories = tranHistories;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getPosibility() {
        return posibility;
    }

    public void setPosibility(String posibility) {
        this.posibility = posibility;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

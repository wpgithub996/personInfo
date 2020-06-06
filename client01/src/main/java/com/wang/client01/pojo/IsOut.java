package com.wang.client01.pojo;

import org.springframework.data.relational.core.sql.In;

import java.io.Serializable;

public class IsOut implements Serializable {
    private String inout;
    private Integer num;

    public IsOut(String inout, Integer num) {
        this.inout = inout;
        this.num = num;
    }

    public IsOut() {
    }

    public String getInout() {
        return inout;
    }

    public void setInout(String inout) {
        this.inout = inout;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}

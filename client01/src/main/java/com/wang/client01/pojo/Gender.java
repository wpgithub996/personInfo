package com.wang.client01.pojo;

import java.io.Serializable;

public class Gender implements Serializable {
    private String sex;
    private Integer num;

    public Gender(String sex, Integer num) {
        this.sex = sex;
        this.num = num;
    }

    public Gender() {
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}

package com.wang.client01.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class PersonInfo implements Serializable {
    private Integer idNum;
    private String name;
    private String gender;
    private Integer age;
    private String phone;
    private String city;
    private String address;
    private String idCard;
    private String isOut;
    private String isHost;
    private String hostNum;
    //分页
    private Integer total;
    private Integer page;
    private Integer pageNum;
}

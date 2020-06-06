package com.wang.server.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.relational.core.sql.In;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
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
}

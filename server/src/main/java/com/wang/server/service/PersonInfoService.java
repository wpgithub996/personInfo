package com.wang.server.service;

import com.wang.server.pojo.PersonInfo;

import java.util.List;

public interface PersonInfoService {
    //新增
    int savePerson(PersonInfo info);

    //修改
    int updateInfo(PersonInfo info);

    //删除
    int deleteByIdNum(String IdNum);

    //查询
    List<PersonInfo> find(PersonInfo info);

    //获取男女数量
    List genderNum();

    //查询是否外出人员数量
    List<Integer> getOutNum();
}

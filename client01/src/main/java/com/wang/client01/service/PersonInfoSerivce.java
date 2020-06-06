package com.wang.client01.service;

import com.wang.client01.pojo.IsOut;
import com.wang.client01.pojo.PersonInfo;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface PersonInfoSerivce {
    //新增
    int savePerson(PersonInfo personInfo);

    //修改
    int updateInfo(PersonInfo info);

    //删除
    int deleteByIdNum(String IdNum);

    //查询
    List<PersonInfo> find(PersonInfo info,int page);

    //查询男性数量
    List<String> genderNum();

    //查询外出人员数量
    List<IsOut> getOut();

    //导出信息
    void getExcel(HttpServletResponse response) throws Exception;
}

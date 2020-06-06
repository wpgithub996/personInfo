package com.wang.server.service.impl;

import com.wang.server.mapper.PersonMapper;
import com.wang.server.pojo.PersonInfo;
import com.wang.server.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {
    @Autowired
    private PersonMapper personMapper;

    //新增人员
    @Override
    public int savePerson(PersonInfo info) {
        return personMapper.savePerson(info);
    }

    @Override
    public int updateInfo(PersonInfo info) {
        return personMapper.updateInfo(info);
    }

    @Override
    public int deleteByIdNum(String IdNum) {
        return personMapper.deleteByIdNum(IdNum);
    }

    @Override
    public List<PersonInfo> find(PersonInfo info) {
        return personMapper.find(info);
    }

    @Override
    public List genderNum() {
        List<Integer> objects = new LinkedList<>();
        objects.add(personMapper.boyNum());
        objects.add(personMapper.girlNum());
        return objects;
    }

    @Override
    public List<Integer> getOutNum() {
        Integer out = personMapper.isOut("是");
        Integer in = personMapper.isOut("否");
        ArrayList<Integer> list = new ArrayList<>();
        list.add(out);
        list.add(in);
        return list;
    }
}

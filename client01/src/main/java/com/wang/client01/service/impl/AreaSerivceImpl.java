package com.wang.client01.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wang.client01.pojo.Area;
import com.wang.client01.pojo.IsOut;
import com.wang.client01.pojo.PersonInfo;
import com.wang.client01.service.AreaSerivce;
import com.wang.client01.service.PersonInfoSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class AreaSerivceImpl implements AreaSerivce {
    @Autowired
    private RestTemplate restTemplate;
    @Override
    public List<Area> getarea(String parentid) {
        String url="http://personInfoServer/findArea";
        String resultstr = restTemplate.postForObject(url, parentid, String.class);
        List<Area> areas = JSON.parseArray(resultstr, Area.class);
        return areas;
    }
}

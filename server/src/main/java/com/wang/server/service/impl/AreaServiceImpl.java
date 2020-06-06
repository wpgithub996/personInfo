package com.wang.server.service.impl;

import com.netflix.discovery.converters.Auto;
import com.wang.server.mapper.AreaMapper;
import com.wang.server.mapper.PersonMapper;
import com.wang.server.pojo.Area;
import com.wang.server.pojo.PersonInfo;
import com.wang.server.service.AreaService;
import com.wang.server.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaMapper areaMapper;
    @Override
    public List<Area> getarea(String parentid) {
        return areaMapper.findarea(parentid) ;
    }
}

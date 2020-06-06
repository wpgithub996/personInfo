package com.wang.client01.service;

import com.wang.client01.pojo.Area;
import com.wang.client01.pojo.IsOut;
import com.wang.client01.pojo.PersonInfo;

import java.util.List;

public interface AreaSerivce {
    List<Area> getarea(String parentid);
}

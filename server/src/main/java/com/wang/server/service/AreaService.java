package com.wang.server.service;

import com.wang.server.pojo.Area;
import com.wang.server.pojo.PersonInfo;

import java.util.List;

public interface AreaService {

    List<Area> getarea(String parentid);
}

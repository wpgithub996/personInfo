package com.wang.server.mapper;

import com.wang.server.pojo.Area;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AreaMapper {
    List<Area> findarea(@Param("parentid") String parentid);
}

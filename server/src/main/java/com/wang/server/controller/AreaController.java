package com.wang.server.controller;

import com.wang.server.pojo.Area;
import com.wang.server.pojo.PersonInfo;
import com.wang.server.service.AreaService;
import com.wang.server.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;

    @RequestMapping("/findArea")
    @ResponseBody
    public List<Area> getArea(@RequestBody String parentid){
       return areaService.getarea(parentid);
    }
}

package com.wang.server.controller;

import com.wang.server.pojo.PersonInfo;
import com.wang.server.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PersonInfoController {
    @Autowired
    private PersonInfoService personInfoService;

    //新增人员
    @RequestMapping("/save")
    @ResponseBody
    public int savePerson(@RequestBody PersonInfo info){
        return personInfoService.savePerson(info);
    }

    //删除
    @RequestMapping("/deleteByIdNum")
    @ResponseBody
    public int deleteById(@RequestBody String IdNum){
        return personInfoService.deleteByIdNum(IdNum);
    }

    //修改
    @RequestMapping("/updataInfo")
    @ResponseBody
    public int updataInfo(@RequestBody PersonInfo info){

//        PersonInfo personInfo = reciveParam(map);
        return personInfoService.updateInfo(info);
    }

    //查询
    @RequestMapping("/find")
    @ResponseBody
    public List<PersonInfo> findInfo(@RequestBody PersonInfo info){
        return personInfoService.find(info);
    }

    @RequestMapping("/gender")
    @ResponseBody
    public List genderNum(){
        return personInfoService.genderNum();
    }

    @RequestMapping("/isOut")
    @ResponseBody
    public List isOut(){
        return personInfoService.getOutNum();
    }
}

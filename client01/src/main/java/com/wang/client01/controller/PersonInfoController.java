package com.wang.client01.controller;

import com.wang.client01.pojo.Area;
import com.wang.client01.pojo.Gender;
import com.wang.client01.pojo.IsOut;
import com.wang.client01.pojo.PersonInfo;
import com.wang.client01.service.AreaSerivce;
import com.wang.client01.service.PersonInfoSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class PersonInfoController {
    @Autowired
    private PersonInfoSerivce serivce;
    @Autowired
    private AreaSerivce areaSerivce;

    //跳转到登录页面
    @RequestMapping("/")
    public String jumpLogin(){
        return "login";
    }
    //跳转到登录页面
    @RequestMapping("/tell")
    public String jumptell(){
        return "tell";
    }


    //登录验证
    @RequestMapping("login")
    public String login(@RequestParam(value = "username") String username,@RequestParam(value = "password") String password){
        return "main";
    }
    //新增(微信小程序调用此接口)
    @RequestMapping("/saveforwx")
    @ResponseBody
    public Integer  savePerson(@RequestParam Map<String,Object> map){
        PersonInfo info = reciveParam(map);
        if(info.getHostNum().equals("")){
            info.setHostNum(info.getIdCard());
        }else {
            info.setHostNum(info.getHostNum().split("-")[1]);
        }
        int result = serivce.savePerson(info);
        if(result>0){
            return 1;
        }else {
            return 0;
        }
    }
    //新增
    @RequestMapping("/save")
    public String  save(PersonInfo info){

        if(info.getHostNum().equals("")){
            info.setHostNum(info.getIdCard());
        }else {
            info.setHostNum(info.getHostNum().split("-")[1]);
        }
        int result = serivce.savePerson(info);
        if(result>0){
            return "personList";
        }else {
            return "500";
        }
    }
    //修改
    @RequestMapping("/updataInfo")
    public String updataInfo(PersonInfo info){
        int i = serivce.updateInfo(info);
        if(i>0){
            return "personList";
        }else {
            return "500";
        }
    }

    //删除
    @RequestMapping("/deleteByIdNum/{IdNum}")
    @ResponseBody
    public int delete(@PathVariable("IdNum") String IdNum){
       return serivce.deleteByIdNum(IdNum);
    }

    @RequestMapping("/findOne/{idCard}")
    @ResponseBody
    public List<PersonInfo> getOne(@PathVariable("idCard") String idCard){
        PersonInfo personInfo = new PersonInfo();
        personInfo.setIdCard(idCard);
        List<PersonInfo> personInfos = serivce.find(personInfo, 0);
        return personInfos;
    }

    //条件查询(全部)
    @RequestMapping("/find")
    @ResponseBody
    public List<PersonInfo> find(PersonInfo info){
        return serivce.find(info,info.getPageNum());
    }


    //获取男女数量
    @RequestMapping("/gender")
    @ResponseBody
    public List gender(){
        List<String> list = serivce.genderNum();
        LinkedList<Gender> genders = new LinkedList<>();
        String sex="男性";
        for (int i = 0; i <list.size() ; i++) {
            Gender gender = new Gender();
            gender.setSex(sex);
            gender.setNum(Integer.parseInt(list.get(i)));
            genders.add(gender);
            sex="女性";
        }
       return genders;
    }

    //获取外出人员数量
    @RequestMapping("/isOut")
    @ResponseBody
    public List<IsOut> getOut(){
        List<IsOut> out = serivce.getOut();
        return out;
    }

    //导出信息
    @RequestMapping("/exportInfo")
    @ResponseBody
    public String getExcel(HttpServletResponse response){
        try {
            serivce.getExcel(response);
        } catch (Exception e) {
            e.printStackTrace();
            return "信息导出失败请重试";
        }
        return "信息导出成功";
    }

    //接收参数
    public PersonInfo reciveParam(Map<String,Object> map){
        PersonInfo personInfo = new PersonInfo();
        personInfo.setName(String.valueOf(map.get("name")));
        personInfo.setGender(String.valueOf(map.get("gender")));
        personInfo.setAge(Integer.valueOf(String.valueOf(map.get("age"))));
        personInfo.setPhone(String.valueOf(map.get("phone")));
        personInfo.setCity(String.valueOf(map.get("city")));
        personInfo.setAddress(String.valueOf(map.get("address")));
        personInfo.setIdCard(String.valueOf(map.get("idCard")));
        personInfo.setIsOut(String.valueOf(map.get("isOut")));
        personInfo.setIsHost(String.valueOf(map.get("isHost")));
        personInfo.setHostNum(String.valueOf(map.get("hostNum")));
        return personInfo;
    }


    @RequestMapping("/findArea")
    @ResponseBody
    public List<Area> getArea(String parentid){
        return areaSerivce.getarea(parentid);
    }
}

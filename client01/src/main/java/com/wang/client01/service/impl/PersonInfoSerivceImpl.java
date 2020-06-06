package com.wang.client01.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wang.client01.pojo.IsOut;
import com.wang.client01.pojo.PersonInfo;
import com.wang.client01.service.PersonInfoSerivce;
import com.wang.client01.util.ToExclUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Service
public class PersonInfoSerivceImpl implements PersonInfoSerivce {
    @Autowired
    private RestTemplate restTemplete;

    //新增人员
    @Override
    public int savePerson(PersonInfo personInfo) {
        String url="http://personInfoServer/save";
        Integer isSucc = restTemplete.postForObject(url,personInfo , int.class);
        return isSucc;
    }
    //修改
    @Override
    public int updateInfo(PersonInfo info) {
        String url="http://personInfoServer/updataInfo";
        Integer isSucc = restTemplete.postForObject(url,info , int.class);
        return isSucc;
    }
    //删除
    @Override
    public int deleteByIdNum(String IdNum) {
        String url="http://personInfoServer/deleteByIdNum";
        Integer isSucc = restTemplete.postForObject(url, IdNum, int.class);
        return isSucc;
    }
    //查询
    @Override
    public List<PersonInfo> find(PersonInfo info,int page) {
        String url="http://personInfoServer/find";
        String resultStr = restTemplete.postForObject(url, info, String.class);
        //使用FASTJSON将字符串转换为集合
        List<PersonInfo> list = JSON.parseArray(resultStr, PersonInfo.class);
        PageHelper.startPage(page,10);
        PageInfo<PersonInfo> personInfoPageInfo = new PageInfo<>(list);
        List<PersonInfo> personInfos = personInfoPageInfo.getList();
        if(personInfos.size()==0){
            return  personInfos;
        }
        personInfos.get(0).setPage(personInfoPageInfo.getPageNum());
        personInfos.get(0).setTotal((int)personInfoPageInfo.getTotal());
        personInfos.get(0).setPageNum(personInfoPageInfo.getPageNum());
        return personInfos;
    }

    @Override
    public List<String> genderNum() {
        String url="http://personInfoServer/gender";
        String str = restTemplete.postForObject(url, null, String.class);
        List<String> lists = JSON.parseArray(str, String.class);
        return lists;
    }

    @Override
    public List<IsOut> getOut() {
        String url="http://personInfoServer/isOut";
        String s = restTemplete.postForObject(url, null, String.class);
        List<Integer> nums = JSON.parseArray(s,Integer.class);
        ArrayList<IsOut> isOuts = new ArrayList<>();
        String inout="外出";
        for (int i = 0; i <nums.size() ; i++) {
            IsOut isOut = new IsOut();
            isOut.setNum(nums.get(i));
            isOut.setInout(inout);
            isOuts.add(isOut);
            inout="本地";
        }
        return isOuts;
    }

    @Override
    public void getExcel(HttpServletResponse response) throws Exception {
        //标题
        ArrayList<String> titles = new ArrayList<>();
        titles.add("编号");
        titles.add("姓名");
        titles.add("性别");
        titles.add("身份证号");
        titles.add("年龄");
        titles.add("电话");
        titles.add("所在地区");
        titles.add("详细地址");
        titles.add("是否外出");
        titles.add("是否户主");
        //获得全部人员信息
        PersonInfo info = new PersonInfo();
        String url="http://personInfoServer/find";
        String resultStr = restTemplete.postForObject(url, info, String.class);
        //使用FASTJSON将字符串转换为集合
        List<PersonInfo> personInfoList = JSON.parseArray(resultStr, PersonInfo.class);
        ToExclUtils.toExcel(response,titles,personInfoList);

    }


}

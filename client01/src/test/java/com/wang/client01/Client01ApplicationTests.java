package com.wang.client01;

import com.wang.client01.service.PersonInfoSerivce;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Client01ApplicationTests {
    @Autowired
    private PersonInfoSerivce serivce;
    @Test
    void contextLoads() {
    }

    @Test
    public void save(){
        int i = serivce.deleteByIdNum("123456456456456");
        System.out.println(i);
    }


    @Test
    public void t1(){
//        String s = serivce.genderNum();
//        System.out.println("==================="+s);
    }
}

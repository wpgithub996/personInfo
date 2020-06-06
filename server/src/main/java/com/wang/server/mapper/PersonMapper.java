package com.wang.server.mapper;

import com.wang.server.pojo.PersonInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PersonMapper {
    //新增人员
    int savePerson(PersonInfo info);

    //修改信息
    int updateInfo(PersonInfo info);

    //删除
    int deleteByIdNum(String IdNum);

    //查询
    List<PersonInfo> find(PersonInfo info);

    //查询男性数量
    Integer boyNum();

    //查询女性数量
    Integer girlNum();

    //查询是否外出
    Integer isOut(@Param("flag") String flag);
    

}

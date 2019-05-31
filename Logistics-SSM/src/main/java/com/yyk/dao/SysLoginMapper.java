package com.yyk.dao;

import com.yyk.dto.LoginDTO.LoginResDTO;
import com.yyk.entity.SysLogin;
import com.yyk.entity.SysLoginCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysLoginMapper {
    int countByExample(SysLoginCriteria example);

    int deleteByExample(SysLoginCriteria example);

    int deleteByPrimaryKey(Integer id);

    int insert(SysLogin record);

    int insertSelective(SysLogin record);

    List<SysLogin> selectByExample(SysLoginCriteria example);

    SysLogin selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SysLogin record, @Param("example") SysLoginCriteria example);

    int updateByExample(@Param("record") SysLogin record, @Param("example") SysLoginCriteria example);

    int updateByPrimaryKeySelective(SysLogin record);

    int updateByPrimaryKey(SysLogin record);
    
    List<LoginResDTO> selectByExampleNew(SysLoginCriteria example);
} 
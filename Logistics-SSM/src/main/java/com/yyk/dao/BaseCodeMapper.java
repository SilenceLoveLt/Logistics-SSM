package com.yyk.dao;

import com.yyk.entity.BaseCode;
import com.yyk.entity.BaseCodeCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseCodeMapper {
    int countByExample(BaseCodeCriteria example);

    int deleteByExample(BaseCodeCriteria example);

    int deleteByPrimaryKey(String code);

    int insert(BaseCode record);

    int insertSelective(BaseCode record);

    List<BaseCode> selectByExample(BaseCodeCriteria example);

    BaseCode selectByPrimaryKey(String code);

    int updateByExampleSelective(@Param("record") BaseCode record, @Param("example") BaseCodeCriteria example);

    int updateByExample(@Param("record") BaseCode record, @Param("example") BaseCodeCriteria example);

    int updateByPrimaryKeySelective(BaseCode record);

    int updateByPrimaryKey(BaseCode record);
}
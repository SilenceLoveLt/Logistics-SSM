package com.yyk.dao;

import com.yyk.entity.BaseCodeType;
import com.yyk.entity.BaseCodeTypeCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseCodeTypeMapper {
    int countByExample(BaseCodeTypeCriteria example);

    int deleteByExample(BaseCodeTypeCriteria example);

    int insert(BaseCodeType record);

    int insertSelective(BaseCodeType record);

    List<BaseCodeType> selectByExample(BaseCodeTypeCriteria example);

    int updateByExampleSelective(@Param("record") BaseCodeType record, @Param("example") BaseCodeTypeCriteria example);

    int updateByExample(@Param("record") BaseCodeType record, @Param("example") BaseCodeTypeCriteria example);
}
package com.yyk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;

public interface SysLineMapper {
    int countByExample(SysLineCriteria example);

    int deleteByExample(SysLineCriteria example);

    int insert(SysLine record);

    int insertSelective(SysLine record);

    List<SysLine> selectByExample(SysLineCriteria example);

    int updateByExampleSelective(@Param("record") SysLine record, @Param("example") SysLineCriteria example);

    int updateByExample(@Param("record") SysLine record, @Param("example") SysLineCriteria example);
    
    int  countByBaseCode(BaseCodeDTO object);
    

}
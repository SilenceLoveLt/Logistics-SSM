package com.yyk.dao;

import com.yyk.entity.SysLine;
import com.yyk.entity.SysLineCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysLineMapper {
    int countByExample(SysLineCriteria example);

    int deleteByExample(SysLineCriteria example);

    int deleteByPrimaryKey(String lineId);

    int insert(SysLine record);

    int insertSelective(SysLine record);

    List<SysLine> selectByExample(SysLineCriteria example);

    SysLine selectByPrimaryKey(String lineId);

    int updateByExampleSelective(@Param("record") SysLine record, @Param("example") SysLineCriteria example);

    int updateByExample(@Param("record") SysLine record, @Param("example") SysLineCriteria example);

    int updateByPrimaryKeySelective(SysLine record);

    int updateByPrimaryKey(SysLine record);
}
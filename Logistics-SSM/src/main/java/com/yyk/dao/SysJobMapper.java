package com.yyk.dao;

import com.yyk.entity.SysJob;
import com.yyk.entity.SysJobCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysJobMapper {
    int countByExample(SysJobCriteria example);

    int deleteByExample(SysJobCriteria example);

    int deleteByPrimaryKey(String jobId);

    int insert(SysJob record);

    int insertSelective(SysJob record);

    List<SysJob> selectByExample(SysJobCriteria example);

    SysJob selectByPrimaryKey(String jobId);

    int updateByExampleSelective(@Param("record") SysJob record, @Param("example") SysJobCriteria example);

    int updateByExample(@Param("record") SysJob record, @Param("example") SysJobCriteria example);

    int updateByPrimaryKeySelective(SysJob record);

    int updateByPrimaryKey(SysJob record);
}
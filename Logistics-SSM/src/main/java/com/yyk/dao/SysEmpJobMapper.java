package com.yyk.dao;

import com.yyk.entity.SysEmpJob;
import com.yyk.entity.SysEmpJobCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysEmpJobMapper {
    int countByExample(SysEmpJobCriteria example);

    int deleteByExample(SysEmpJobCriteria example);

    int deleteByPrimaryKey(String empJobId);

    int insert(SysEmpJob record);

    int insertSelective(SysEmpJob record);

    List<SysEmpJob> selectByExample(SysEmpJobCriteria example);

    SysEmpJob selectByPrimaryKey(String empJobId);

    int updateByExampleSelective(@Param("record") SysEmpJob record, @Param("example") SysEmpJobCriteria example);

    int updateByExample(@Param("record") SysEmpJob record, @Param("example") SysEmpJobCriteria example);

    int updateByPrimaryKeySelective(SysEmpJob record);

    int updateByPrimaryKey(SysEmpJob record);
    
    int insertByBatch(List<SysEmpJob> list);
}
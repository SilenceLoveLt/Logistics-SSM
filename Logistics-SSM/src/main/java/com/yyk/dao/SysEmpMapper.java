package com.yyk.dao;

import com.yyk.entity.SysEmp;
import com.yyk.entity.SysEmpCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysEmpMapper {
    int countByExample(SysEmpCriteria example);

    int deleteByExample(SysEmpCriteria example);

    int deleteByPrimaryKey(String empId);

    int insert(SysEmp record);

    int insertSelective(SysEmp record);

    List<SysEmp> selectByExample(SysEmpCriteria example);

    SysEmp selectByPrimaryKey(String empId);

    int updateByExampleSelective(@Param("record") SysEmp record, @Param("example") SysEmpCriteria example);

    int updateByExample(@Param("record") SysEmp record, @Param("example") SysEmpCriteria example);

    int updateByPrimaryKeySelective(SysEmp record);

    int updateByPrimaryKey(SysEmp record);
    
    List<SysEmp> selectByExampleNew(SysEmpCriteria example);
}
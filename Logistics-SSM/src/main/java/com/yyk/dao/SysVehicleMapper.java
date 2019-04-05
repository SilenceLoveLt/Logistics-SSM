package com.yyk.dao;

import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysVehicleMapper {
    int countByExample(SysVehicleCriteria example);

    int deleteByExample(SysVehicleCriteria example);

    int deleteByPrimaryKey(String vehicleId);

    int insert(SysVehicle record);

    int insertSelective(SysVehicle record);

    List<SysVehicle> selectByExample(SysVehicleCriteria example);

    SysVehicle selectByPrimaryKey(String vehicleId);

    int updateByExampleSelective(@Param("record") SysVehicle record, @Param("example") SysVehicleCriteria example);

    int updateByExample(@Param("record") SysVehicle record, @Param("example") SysVehicleCriteria example);

    int updateByPrimaryKeySelective(SysVehicle record);

    int updateByPrimaryKey(SysVehicle record);
}
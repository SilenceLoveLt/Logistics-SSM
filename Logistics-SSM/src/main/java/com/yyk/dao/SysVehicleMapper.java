package com.yyk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.dto.VehicleDTO.VehicleResDTO;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;

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
    
    int  countByBaseCode(BaseCodeDTO object);
    
    List<VehicleResDTO> selectByExampleNew(SysVehicleCriteria example);
}
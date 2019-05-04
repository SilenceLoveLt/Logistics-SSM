package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.dto.BaseCodeDTO.BaseCodeDTO;
import com.yyk.entity.SysVehicle;
import com.yyk.entity.SysVehicleCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysVehicleService {
	 List<BaseCodeDTO> selectLeftTrees();
	 
	 int updateVehicle (SysVehicleCriteria criteria,SysVehicle sysVehicle);
	 
	 List<SysVehicle> selectVehicle (SysVehicleCriteria criteria);
	 
	 int insertVehicle (SysVehicle sysVehicle);
	 
	 ResDataDTO<List<SysVehicle>>  selectApplyTypeListPage(SysVehicleCriteria criteria,PageInfo pageInfo);
	 
	 ResDataDTO<List<SysVehicle>>  selectVehicleTypeListPage(SysVehicleCriteria criteria,PageInfo pageInfo);
	 
}

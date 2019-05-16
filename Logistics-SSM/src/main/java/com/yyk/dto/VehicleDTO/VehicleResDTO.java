package com.yyk.dto.VehicleDTO;

import com.yyk.entity.SysVehicle;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月16日 下午9:22:04
* 类说明
*/
public class VehicleResDTO extends SysVehicle{
	private String vehicleTypeName;

	public String getVehicleTypeName() {
		return vehicleTypeName;
	}

	public void setVehicleTypeName(String vehicleTypeName) {
		this.vehicleTypeName = vehicleTypeName;
	}
	
	

}

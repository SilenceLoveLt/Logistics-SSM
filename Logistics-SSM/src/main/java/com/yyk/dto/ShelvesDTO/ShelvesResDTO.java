package com.yyk.dto.ShelvesDTO;

import com.yyk.entity.SysShelves;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月16日 下午7:10:08
* 类说明
*/
public class ShelvesResDTO extends SysShelves{
	private String shelvesTypeName;

	public String getShelvesTypeName() {
		return shelvesTypeName;
	}

	public void setShelvesTypeName(String shelvesTypeName) {
		this.shelvesTypeName = shelvesTypeName;
	}
	
}

package com.yyk.dto.LoginDTO;

import com.yyk.entity.SysLogin;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月25日 下午12:35:44
* 类说明
*/
public class LoginResDTO extends SysLogin{
	private String roleName;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	
	
	

}

package com.yyk.dto.LoginDTO;

import com.yyk.entity.SysLogin;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月25日 下午12:35:44
* 类说明
*/
public class LoginReqDTO extends SysLogin{
	private String verificationCode;
	
	private String oldPassword;
	
	

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	
	

}

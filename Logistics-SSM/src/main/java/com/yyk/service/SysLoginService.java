package com.yyk.service;

import java.util.List;

import com.yyk.dto.LoginDTO.LoginResDTO;
import com.yyk.entity.SysLogin;
import com.yyk.entity.SysLoginCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysLoginService {
	int insertLogin (SysLogin sysLogin);
	
	int updateLogin (SysLoginCriteria criteria,SysLogin sysLogin);
	
	List<LoginResDTO> selectInfoLogin(SysLoginCriteria criteria);
}

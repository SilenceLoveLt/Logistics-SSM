package com.yyk.service;

import java.util.List;

import com.yyk.common.PageInfo;
import com.yyk.common.ResDataDTO;
import com.yyk.entity.SysUser;
import com.yyk.entity.SysUserCriteria;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:02:59
* 类说明
*/
public interface SysUserService {
	ResDataDTO<List<SysUser>> selectSysUserByPage(SysUserCriteria criteria,PageInfo pageInfo);
	
	int insertUser (SysUser sysUser);

}

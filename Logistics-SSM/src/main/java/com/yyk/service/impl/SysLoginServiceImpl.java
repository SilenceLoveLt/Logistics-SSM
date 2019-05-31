package com.yyk.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyk.dao.SysLoginMapper;
import com.yyk.dto.LoginDTO.LoginResDTO;
import com.yyk.entity.SysLogin;
import com.yyk.entity.SysLoginCriteria;
import com.yyk.service.SysLoginService;
import com.yyk.util.UUIDGenerator;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:03:38
* 类说明
*/
@Service("sysLoginService")
public class SysLoginServiceImpl implements SysLoginService{
	
	@Autowired
	private SysLoginMapper sysLoginDao;


	@Override
	public int insertLogin(SysLogin sysLogin) {
		sysLogin.setStatus(1);
		sysLogin.setLoginId(UUIDGenerator.create32Key());
		sysLogin.setCreateTime(new Date());
		sysLogin.setUpdateTime(new Date());
		return sysLoginDao.insertSelective(sysLogin);
	}

	@Override
	public int updateLogin(SysLoginCriteria criteria,SysLogin sysLogin) {
		return sysLoginDao.updateByExampleSelective(sysLogin,criteria);
	}

	@Override
	public List<LoginResDTO> selectInfoLogin(SysLoginCriteria criteria) {
		return sysLoginDao.selectByExampleNew(criteria);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
}

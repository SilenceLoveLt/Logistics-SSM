package com.yyk.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yyk.dao.AdminDao;
import com.yyk.entity.AdminInfo;
import com.yyk.entity.AdminInfoExample;
import com.yyk.service.AdminService;

@Service("adminService")
public class AdminServieImpl  implements AdminService{

	@Autowired
    public AdminDao  adminDao;

	public List<AdminInfo> getAdminByWord(AdminInfoExample example) {
		return adminDao.selectByExample(example);
	}

}

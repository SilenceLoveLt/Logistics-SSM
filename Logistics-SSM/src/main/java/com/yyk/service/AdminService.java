package com.yyk.service;

import java.util.List;

import com.yyk.entity.AdminInfo;
import com.yyk.entity.AdminInfoExample;


public interface AdminService  {
	
	List<AdminInfo> getAdminByWord(AdminInfoExample example);

}

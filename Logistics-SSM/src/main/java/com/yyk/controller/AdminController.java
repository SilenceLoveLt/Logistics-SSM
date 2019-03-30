package com.yyk.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yyk.entity.AdminInfo;
import com.yyk.service.AdminService;

@Controller
@RequestMapping(value="/login")
public class AdminController {

	@Autowired
	public AdminService adminService;
	
	
	
	@RequestMapping(value="/showName",method=RequestMethod.POST)
	public String getId(@ModelAttribute AdminInfo  adminInfo,ModelMap model)
	{
	    model.put("adminId", adminInfo.getAdminPwd());
		return "showName";
	}
}

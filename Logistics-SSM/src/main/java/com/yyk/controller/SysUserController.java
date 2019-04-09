package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yyk.constant.Url;
import com.yyk.constant.Views;

@Controller
@RequestMapping(Url.USER_MANAGE)
public class SysUserController {
	
	 @RequestMapping("/")
	 public String get(){
		 System.out.println("员工");
	   return Views.USER_VIEW;
	 }

}

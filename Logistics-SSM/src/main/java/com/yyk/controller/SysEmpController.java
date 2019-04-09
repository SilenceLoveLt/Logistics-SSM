package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yyk.constant.Url;
import com.yyk.constant.Views;

@Controller
@RequestMapping(Url.EMP_MANAGE)
public class SysEmpController {
	
	 @RequestMapping("/")
	 public String get(){
	   return Views.EMP_VIEW;
	 }

}

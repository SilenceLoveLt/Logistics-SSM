package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yyk.constant.Url;
import com.yyk.constant.Views;

@Controller
@RequestMapping(Url.JOB_MANAGE)
public class SysJobController {
	
	 @RequestMapping("/")
	 public String get(){
	   return Views.JOB_VIEW;
	 }

}

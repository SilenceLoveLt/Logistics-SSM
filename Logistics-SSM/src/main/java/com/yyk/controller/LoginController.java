package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yyk.constant.Url;
import com.yyk.constant.Views;

@Controller
public class LoginController   {

	
	@RequestMapping(Url.BACK_LOGIN_URL)
	public String login() {
		return Views.USER_LOGIN_VIEW;
	}
	
	
}

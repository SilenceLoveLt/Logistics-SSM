package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.yyk.constant.Url;
import com.yyk.constant.Views;

@Controller
public class AdminController {


	@RequestMapping(Url.INDEX_MANAGE)
	public String start() {
		return Views.INDEX_VIEW;
	}

}

package com.yyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author YYK
 * @date 2019/04/06  22:09
 */
@RestController
public class ErrorController {
    @RequestMapping(value = "/error400Page")
    public String error400Page() {
        return "400";
    }
    @RequestMapping(value = "/error401Page")
    public String error401Page() {
        return "401";
    }
    @RequestMapping(value = "/error404Page")
    public String error404Page() {
        return "404";
    }
    @RequestMapping(value = "/error403Page")
    public String error403Page() {
        return "403";
    }
    @RequestMapping(value = "/error405Page")
    public String error405Page() {
        return "405";
    }
    @RequestMapping(value = "/error500Page")
    public String error500Page(Model model) {
        return "500";
    }
}

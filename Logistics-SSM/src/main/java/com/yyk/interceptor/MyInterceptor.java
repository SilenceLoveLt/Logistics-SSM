package com.yyk.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yyk.entity.SysLogin;

/**
 * 需要config配置类配合，看config目录
 * 路径只有走DispatcherServlet，才会被拦截，默认静态资源不会被拦截
 * @author YYK
 */
@Component
public class MyInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	//登录不做拦截
       
    	HttpSession session = request.getSession();
        //这里的User是登陆时放入session的
        SysLogin user = (SysLogin) session.getAttribute("sysLogin");
		String loginName = request.getParameter("loginName");
		String loginPaassword = request.getParameter("loginPassword");
		System.out.println("loginName"+loginName+"loginPaassword"+loginPaassword);
		if((loginName!=null&&loginPaassword!=null) || user!=null){
			return true;
		}else {
			return false;
		}
    	
	     
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //请求处理之后进行调用，但是在视图被渲染之前，即Controller方法调用之后
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行，主要是用于进行资源清理工作

    }
}

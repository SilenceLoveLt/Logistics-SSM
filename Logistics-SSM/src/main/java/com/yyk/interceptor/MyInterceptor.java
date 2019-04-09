package com.yyk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 需要config配置类配合，看config目录
 * 路径只有走DispatcherServlet，才会被拦截，默认静态资源不会被拦截
 * @author YYK
 */
public class MyInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //controller方法调用之前
        System.out.println("我没进controller");
       /* HttpSession session = request.getSession();
	      // 判断是否已有该用户登录的session
	      if(session.getAttribute(SESSION_KEY) != null){
	          return true;
	      }
	
	      //跳转到登录页
	      String url = "/login";
	      response.sendRedirect(url);
	      return false;
*/
        // 获得请求的资源
       /* String uri = httpServletRequest.getRequestURI();
        System.out.println(httpServletRequest.getRequestURI());
        if (uri.equals("/login/user")) {
            return true;
        }
        if (httpServletResponse.getStatus() == 404) {
            return true;
        }else if(httpServletResponse.getStatus() == 405){
            return true;
        }else if(httpServletResponse.getStatus() == 500){
            return true;
        }
        return false;*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //请求处理之后进行调用，但是在视图被渲染之前，即Controller方法调用之后
        System.out.println("我进拦截器了");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行，主要是用于进行资源清理工作
    	 System.out.println("afterCompletion被调用");

    }
}

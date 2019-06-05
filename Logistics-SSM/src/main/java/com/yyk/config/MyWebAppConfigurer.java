package com.yyk.config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yyk.interceptor.MyInterceptor;

@Configuration
public class MyWebAppConfigurer  extends WebMvcConfigurationSupport{
    /**
     * 添加拦截器
     * @param registry
     */
	
	 @Autowired
	 private MyInterceptor myInterceptor;
	 

	 
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	 //InterceptorRegistration registration=registry.addInterceptor(myInterceptor);
    	 //registration.addPathPatterns("/**").excludePathPatterns("/error404Page","/error400Page","/error401Page","/error403Page","/error500Page","/loginManage/login/user","/loginManage/loginUrl","/**/*.css", "/**/*.js", "/**/*.png", "/**/*.jpg", "/**/*.jpeg");
    }
    
    
    
    
    /**
     * 过去要访问一个页面需要先创建个Controller控制类，再写方法跳转到页面
     * 在这里配置后就不需要那么麻烦了，直接访问http://localhost:8080就跳转到login.jsp页面了
     * @param registry
     */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("").setViewName("login");
	}
    
	
	
	
    // 这个方法是用来配置静态资源的，比如html，js，css，等等
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    
    
    
    
    
    
    
    
    
    
}

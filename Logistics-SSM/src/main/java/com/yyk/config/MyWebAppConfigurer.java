package com.yyk.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.yyk.interceptor.MyInterceptor;

@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter{
    /**
     * 添加拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	 InterceptorRegistration registration=registry.addInterceptor(new MyInterceptor());
    	 //过滤所有请求
    	 //registration.addPathPatterns("/**");
    	 //过滤除了登录页面请求
    	 registration.excludePathPatterns("/error");
    	 registration.excludePathPatterns("/login/user","/**/*.css", "/**/*.js", "/**/*.png", "/**/*.jpg", "/**/*.jpeg");
         super.addInterceptors(registry);
    }
}

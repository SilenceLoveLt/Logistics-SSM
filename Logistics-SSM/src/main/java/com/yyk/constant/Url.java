package com.yyk.constant;

public interface Url {
	 /*============通用url开始===========*/
    /*列表数据查询所有*/
    String SELECT_LIST_ALL = "/selectListAll";
    /*列表数据分页查询*/
    String SELECT_LIST_BY_PAGE = "/selectListByPage";
    /*信息查询*/
    String SELECT_INFO = "/selectInfo";
    /*插入数据*/
    String INSERT_INFO = "/insertInfo";
    /*更新数据*/
    String UPDATE_INFO = "/updateInfo";
    /*删除信息*/
    String DELETE_INFO = "/deleteInfo";
	
	//登录请求地址
	String BACK_LOGIN_URL = "/login/user";
	
	//员工管理
	String EMP_MANAGE = "/empManage";
	
	
}

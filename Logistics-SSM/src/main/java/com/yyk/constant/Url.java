package com.yyk.constant;

public interface Url {
	 /*============通用url开始===========*/
    /*列表数据查询所有*/
    String SELECT_LIST_ALL = "/selectListAll";
    /*列表数据分页查询*/
    String SELECT_LIST_BY_PAGE = "/selectListByPage";
    /*左侧列表数查询*/
    String SELECT_LEFT_TREE = "/selectLeftTree";

    /*信息查询*/
    String SELECT_INFO = "/selectInfo";
    /*插入数据或修改数据*/
    String INSERT_OR_UPDATE_INFO = "/insertOrUpdateInfo";
    /*插入数据*/
    String INSERT_INFO = "/insertInfo";
    /*更新数据*/
    String UPDATE_INFO = "/updateInfo";
    /*删除信息*/
    String DELETE_INFO = "/deleteInfo";
    /*批量删除*/
    String DELETE_LIST = "/deleteList";
	/*登录请求地址*/
	String BACK_LOGIN_URL = "/login/user";
	
	/*员工管理*/
	String EMP_MANAGE = "/empManageList";
	
	/*职位管理*/
    String JOB_MANAGE = "/jobManageList";
    
    /*员工职位管理*/
    String EMP_JOB_MANAGE = "/empJobManageList";
    String ON_JOB_MANAGE = "/onJobList";
    String OFF_JOB_MANAGE = "/offJobList";
    
    /*客户管理*/
    String USER_MANAGE = "/userManageList";
    String UPDATE_USER_PSW="/updateUserPsw";
    
    /*订单管理*/
	String ORDER_MANAGE = "/orderManageList";
	String CHECK_ORDER_MANAGE = "/checkOrderManage";
	String CHECK_ORDER_LIST = "/checkOrderList";
	String CANCEL_ORDER_MANAGE = "/cancelOrderManage";
	String SELECT_CANCEL_BY_PAGE = "/selectCancelByPage";
	String CANCEL_ORDER_LIST = "/cancleOrderList";
	String SELECT_ORDER_MANAGE = "/selectOrderManage";
	String SELECT_ORDER_BY_PAGE = "/selectlOrderByPage";
	
	
    /*线路管理*/
    String LINE_MANAGE = "/lineManageList";
    String ADD_LINE_PAGE="/addLinePage";
    
    /*线路管理*/
    String VHEICLE_MANAGE = "/vehicleManageList";
    String ADD_VEHICLE_PAGE="/addVehiclePage";
    
    /*数据字典管理*/
    String BASECODE_MANAGE = "/basecodeManageList";
    String BASECODETYPE_LIST_BY_PAGE = "/selectCodeTypeListByPage";
    String BASECODE_LIST_BY_PAGE = "/selectCodeListByPage";
    String INSERT_CODETYPE = "/insertCodeType";
    String UPDATE_CODETYPE = "/updateCodeType";
    String INSERT_CODE = "/insertCode";
    String UPDATE_CODE = "/updateCode";
    String DELETE_INFO_CODE = "/deleteInfoCode";
    String DELETE_INFO_CODETYPE = "/deleteInfoCodeType";
    String DELETE_LIST_CODETYPE = "/deleteListCodeType";
    String DELETE_LIST_CODE = "/deleteListCode";
    
    
    
    
    
    
    
    
    
    
    
}

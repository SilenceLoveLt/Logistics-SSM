<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yyk.entity.SysLogin" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	SysLogin sysLogin=(SysLogin)request.getSession().getAttribute("sysLogin");
%>
<html>
    <head>
		<base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
         <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath%>static/css/menu.css?ver=1">
        <style>
        .nav{
         margin-top: 20px; 
        }
        .sub>li{
        padding-top: 4px;
        }
        .nav>li{
        border-bottom: 1px solid #414040;
        padding-top: 20px;
       
        }
       /*  .nav>li>span>{
        padding-top: 13px;
        } */
        li>span>{
        padding-top: 13px;
        }
       .nav>li>.right{
           padding-top: 22px;
       
       }
       
        </style>
 </head>
    <body>
	<input type="hidden" id="userList" value="<%=basePath%>userManageList/" />
	<input type="hidden" id="updatePassword" value="<%=basePath%>updateUserPsw/" />
	<input type="hidden" id="empList" value="<%=basePath%>empManageList/" />
	<input type="hidden" id="jobList" value="<%=basePath%>jobManageList/" />
	<input type="hidden" id="basecodeList" value="<%=basePath%>basecodeManageList/" /> 
	<input type="hidden" id="addOrder" value="<%=basePath%>orderManageList/addOrderManage" />
	<input type="hidden" id="lineList" value="<%=basePath%>lineManageList/" />
	<input type="hidden" id="vehicleList" value="<%=basePath%>vehicleManageList/" />
	<input type="hidden" id="checkOrder" value="<%=basePath%>orderManageList/checkOrderManage" />
	<input type="hidden" id="cancelOrder" value="<%=basePath%>orderManageList/cancelOrderManage" />
	<input type="hidden" id="selectOrder" value="<%=basePath%>orderManageList/selectOrderManage" />
	<input type="hidden" id="goodsList" value="<%=basePath%>goodsManageList/" />
	<input type="hidden" id="shelvesList" value="<%=basePath%>shelvesManageList/" />
	<input type="hidden" id="inShelvesList" value="<%=basePath%>goodsShelvesManageList/selectInShelvesManage" />
	<input type="hidden" id="outShelvesList" value="<%=basePath%>goodsShelvesManageList/selectOutShelvesManage" />
	<input type="hidden" id="insertInvoicePage" value="<%=basePath%>invoiceManageList/addInvoicePage"/>
	<input type="hidden" id="updateInvoicePage" value="<%=basePath%>invoiceManageList/updateInvoicePage"/>
	<input type="hidden" id="invoiceList" value="<%=basePath%>invoiceManageList/"/>
	<input type="hidden" id="addVehicle" value="<%=basePath%>vehicleManageList/addVehiclePage"/>
	<input type="hidden" id="addLine" value="<%=basePath%>lineManageList/addLinePage"/>
	

    	<ul class="nav" >
    		<li id="system"><i class="fa fa-gear fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="empList">员工列表</li>
    				<li class="jobList">职位列表</li>
    			</ul>
    		</li>
    		<li id="user"><i class="fa fa-users fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="userList">客户列表</li>
    			</ul>
    		</li>
    		<li id="order"><i class="fa fa-th-list fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单管理<span class="right  glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="addOrder">新增订单</li>
    				<li class="checkOrder">审核订单</li>
    				<li class="cancelOrder">取消订单</li>
    				<li class="selectOrder">查询订单</li>
    			</ul>
    		</li>
    		<li id="goods"><i class="fa fa-envelope-open fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货物管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="goodsList">货物列表</li>
    			</ul>
    		</li>
    		<li id="shelves"><i class="fa fa-server fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货架管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="shelvesList">货架列表</li>
    				<li class="inShelvesList">入库记录</li>
    				<li class="outShelvesList">出库记录</li>
    			</ul>
    		</li>
    	
    		<li id="vehicle"><i class="fa  fa-taxi  fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车辆管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="vehicleList">车辆列表</li>
    				<li class="addVehicle">新增车辆</li>
    			</ul>
    		</li>
    		<li id="line"><i class="fa fa-random fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线路管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="lineList">线路列表</li>
    				<li class="addLine">新增线路</li>
    			</ul>
    		</li>
    		<li id="invoice"><i class="fa fa-truck fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;配送管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="insertInvoicePage">生成配送单</li>
    				<li class="updateInvoicePage">更新配送单</li>
    				<li class="invoiceList">货物签收</li>
    			</ul>
    		</li>
    		<li id="basecode"><i class="fa fa-table fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;字典管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="basecodeList">数据字典</li>
    			</ul>
    		</li>
    		
    	</ul>
	<%--用于提交数据的表单--%>
	<form id="menuForm" method="post" action="">
		<input type="hidden">
	</form>
 	</body>
	<script>
	
	
	
        $(function() {
        	 //权限控制
            var roleId = '<%=sysLogin.getRoleid()%>';
            if(roleId=="2"){ //登录角色为客户
                $("#system").attr("style", "display:none");
                $("#user").attr("style", "display:none");
                $("#order .checkOrder").attr("style", "display:none");
                $("#goods").attr("style", "display:none");
                $("#shelves").attr("style", "display:none");
                $("#vehicle").attr("style", "display:none");
                $("#line").attr("style", "display:none");
                $("#invoice .insertInvoicePage").attr("style", "display:none");
                $("#basecode").attr("style", "display:none");
                
			}
            var roleId = '<%=sysLogin.getRoleid()%>';
            if(roleId=="3"){ //登录角色为普通管理员
                $("#system").attr("style", "display:none");
                $("#basecode").attr("style", "display:none");
                
			}
            //监听一级菜单点击事件
            $(".nav>li").click(function() {
                //找到二级菜单，让二级菜单展开
                $(this).children(".sub").slideToggle(500);
                //控制下拉箭头
                $(this).children(".right").toggleClass("glyphicon glyphicon-chevron-right").toggleClass("glyphicon glyphicon-chevron-down");
            });

            $(".sub>li").click(function(event) {
                //监听二级阻止事件冒泡
                event.stopPropagation();
                //获取所点击li 的id
                var getId=$(this).attr("class");
                console.info(getId+"-------");
                var userListUrl=$("#"+getId).val();
                console.info(userListUrl+"-----");
                $("#menuForm").attr("action",userListUrl);
                $("#menuForm").submit();

            })
        });
	</script>
</html>
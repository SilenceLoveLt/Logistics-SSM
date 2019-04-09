<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
		<base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
        <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath%>static/css/menu.css">
        <style>
        li>span{
        padding-top: 30px;
        }
        .sub>li{
        padding-top: 6px;
        }
        .nav{
        }
        </style>
 </head>
    <body>
	<input type="hidden" id="userList" value="<%=basePath%>userManageList/" />
	<input type="hidden" id="empList" value="<%=basePath%>empManageList/" />
	<input type="hidden" id="jobList" value="<%=basePath%>jobManageList/" />
	<input type="hidden" id="pdtList" value="/pdtManageList" />
	<input type="hidden" id="orderList" value="/orderManageList" />
	<input type="hidden" id="stockList" value="/stockManageList" />
	<input type="hidden" id="storeOutList" value="/storeOutList" />
	<input type="hidden" id="storeInList" value="/storeInList" />

    	<ul class="nav" >
    		<li><span class="img  glyphicon glyphicon-user"></span>&nbsp; &nbsp; &nbsp;系统管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="empList">员工列表</li>
    				<li class="jobList">职位列表</li>
    			</ul>
    		</li>
    		<li><span class="img glyphicon glyphicon-globe"></span>&nbsp; &nbsp; &nbsp;客户管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="userList">客户列表</li>
    			</ul>
    		</li>
    			<li><span class="img glyphicon glyphicon-shopping-cart"></span>&nbsp; &nbsp; &nbsp;订单管理<span class="right  glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="orderList">订单列表</li>
    			</ul>
    		</li>
    		<li><span class="img glyphicon glyphicon-cutlery"></span>&nbsp; &nbsp; &nbsp;货物管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="pdtList">货物列表</li>
    			</ul>
    		</li>
    		<li><span class="img glyphicon glyphicon-queen"></span>&nbsp; &nbsp; &nbsp;货架管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li class="stockList">货架列表</li>
    				<li class="storeInList">入库记录</li>
    				<li class="storeOutList">出库记录</li>
    			</ul>
    		</li>
    	
    		<li><span class="img glyphicon glyphicon-book"></span>&nbsp; &nbsp; &nbsp;车辆管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li>车辆列表</li>
    			</ul>
    		</li>
    		<li><span class="img glyphicon glyphicon-book"></span>&nbsp; &nbsp; &nbsp;线路管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li>线路列表</li>
    			</ul>
    		</li>
    		<li><span class="img glyphicon glyphicon-book"></span>&nbsp; &nbsp; &nbsp;字典管理<span class="right glyphicon glyphicon-chevron-right"></span>
    			<ul class="sub">
    				<li>数据字典</li>
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
            //监听一级菜单点击事件
            $(".nav>li").click(function() {
                //找到二级菜单，让二级菜单展开
                $(this).children(".sub").slideToggle(1000);
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
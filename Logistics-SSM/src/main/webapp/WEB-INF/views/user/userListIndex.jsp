<%--
  User: liting
  Date: 2019/3/26
  Time: 9:48 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Title</title>
    <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-treeview.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    
    
    <style>
        * {
            margin: 0;
            padding: 0;
          }

        .breadcrumb {
            width: 1360px;
            height: 40px;
            margin-left: 18px;
        }
        .row {
            margin-bottom: 10px;
        }
        .modal-dialog {
            width: 700px;
        }
        .serbtn{
            padding-left: 850px;
        }
        .btnfun{
        	
        }
    </style>
</head>
<body style=" margin-bottom: 0px;">
<ol class="breadcrumb">
    <li><a>Home</a></li>
    <li><a>客户管理</a></li>
    <li class="active">客户列表</li>
</ol>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
       <div class="container-fluid">
            <form id="searchEmpForm" name="searchEmpForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">客户姓名:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_empId" id="search_empId"
                                       placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">客户编码:</label>
                             <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_empId" id="search_empId"
                                       placeholder="请输入客户名称">
                            </div>
                          
		                   <span class="input-group-btn ">
							<button style="margin-left: 50px" class="btn btn-primary" type="button" id="searchBtn" onclick="searchDatas();" style="margin-right: 10px; margin-left: 10px"><span class="glyphicon glyphicon-zoom-in">
							</span>查&nbsp;&nbsp;&nbsp;询</button>
							<button style="margin-left: 70px" class="btn btn-primary" type="button"  id="resetSearchBtn" onclick="resetSearchConditions();"><span class="glyphicon glyphicon-remove">
						   </span>重&nbsp;&nbsp;&nbsp;置</button>
				          </span>
				          
			           </div>
                    </div>
                   
                  
		  </form>
	</div>
    </div>
	</div>
<div>
	<table id="pageDataGrid"></table>
	<div id="toolbar" class="btn-group"></div>
</div>
</div>
<!--查询框 end-->
<!--模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="empForm" name="empForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">客户姓名:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empName" id="empName" placeholder="请输入..."/>
                        </div>
                        
                        <label class="control-label col-sm-2">电话号码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empPhone" id="empPhone" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span>*</span>客户编码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="empPhone" id="empPhone" placeholder="请输入..."/>
                        </div>
                    </div>
                    
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">居住地址:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12">
                            <textarea class="form-control" name="address" id="address"
                                      style="resize:none; height: 50px;" rows="3"
                                      placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                   
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">存档时间:</label>
                       <div class="col-md-4  has-feedback"  >
							<input  name="beginTime" id="search_beginTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  onkeyup="this.value=this.value.replace(/\s+/g,'')"
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"  onblur="checkInput()" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
						</div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-md-4  has-feedback"  >
							<input  name="beginTime" id="search_beginTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  onkeyup="this.value=this.value.replace(/\s+/g,'')"
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"  onblur="checkInput()" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
						</div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..."
                                      onkeyup="this.value=this.value.replace(/\s+/g,'')"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <button id="ok" class="btn btn-success  col-sm-1 col-sm-offset-4   " style="width: 80px">保存</button>
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2 " style="width: 80px">重置
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
    <!--模态框 end-->
 <div class="btnfun"> 
<button type="button" class="btn btn-success" onclick="addFun()" style="margin-left:16px">新&nbsp;&nbsp;&nbsp;增</button>
<button type="button" class="btn btn-success" onclick="updateFun()"style="margin-left:40px" >修&nbsp;&nbsp;&nbsp;改</button>
<button class="btn btn-success" onclick="addFun()" style="margin-left:40px">删&nbsp;&nbsp;&nbsp;除</button>
</div>
</body>
<script>
	/* 新增  */
   function addFun(){
	   $('#myModal').modal('show');
	   
   }
	/* 修改 */
	 function updateFun(){
	   $('#myModal').modal('show');
	   
   }
	/* 删除  */
</script>
</html>

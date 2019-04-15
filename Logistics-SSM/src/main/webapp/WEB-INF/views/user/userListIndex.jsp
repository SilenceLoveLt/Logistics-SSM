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
   <%--  <link rel="stylesheet" href="<%=basePath%>static/css/jquery.dataTables.min.css"> --%>
    <link rel="stylesheet" href=" http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap-treeview.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <%-- <script src="<%=basePath%>static/js/jquery.js"></script> --%>
   <%--  <script src="<%=basePath%>static/js/jquery.dataTables.min.js"></script> --%>
    <script src="<%=basePath%>static/js/jquery.dataTables.js"></script> 
    <script src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
          }

        .breadcrumb {
            /* width: 1360px; */
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
        .text-c>th{
        text-align: center;
        }
    </style>
</head>
<body">
<input type="hidden" id="userPageList" value="<%=basePath%>userManageList/selectListByPage" />
<input type="hidden" id="empList" value="<%=basePath%>empManageList/" />
<input type="hidden" id="jobList" value="<%=basePath%>jobManageList/" />
<input type="hidden" id="pdtList" value="/pdtManageList" />
<input type="hidden" id="orderList" value="/orderManageList" />
<input type="hidden" id="stockList" value="/stockManageList" />
<input type="hidden" id="storeOutList" value="/storeOutList" />
<input type="hidden" id="storeInList" value="/storeInList" />
	
	
<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>客户管理</a></li>
	    <li class="active">客户列表</li>
	</ol>
</div>
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
                                <input type="text" class="form-control  input-sm " name="search_userName" id="search_userName"
                                       placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">客户编码:</label>
                             <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_userCode" id="search_userCode"
                                       placeholder="请输入客户编码">
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
</div>
</div>
<!--查询框 end-->
<!--模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="userForm" name="userForm" method="post">
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
                            <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入..."/>
                        </div>
                        
                        <label class="control-label col-sm-2">电话号码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="userPhone" id="userPhone" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span>*</span>客户编码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="userCode" id="userCode" placeholder="请输入..."/>
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
							<input  name="creatTime" id="search_creatTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  onkeyup="this.value=this.value.replace(/\s+/g,'')"
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"  onblur="checkInput()" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
						</div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-md-4  has-feedback"  >
							<input  name="updateTime" id="search_updateTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  onkeyup="this.value=this.value.replace(/\s+/g,'')"
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
                    <button id="reseted" class="btn btn-warning  col-sm-1  col-sm-offset-2 " style="width: 80px">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <!--模态框 end-->
<div class="btnfun"> 
	<button type="button" class="btn btn-primary" onclick="addFun()" style="margin-left:16px">新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增</button>
	<!-- <button type="button" class="btn btn-primary" onclick="updateFun()"style="margin-left:40px" >修&nbsp;&nbsp;&nbsp;改</button> -->
	<button class="btn btn-primary" onclick="deleteFun()" style="margin-left:40px">批量删除</button>
</div>
<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
	<thead>
		<tr class="text-c">
		    <th>
                <input type="checkbox" id="checkall" class="checkall" name="checkBoxs" />
            </th>
			<!-- <th>客户编号</th> -->
			<th>客户姓名</th>
			<th>客户编码</th>
			<th>客户电话</th>
			<th>客户地址</th>
			<th>存档时间</th>
			<th>修改时间</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</body>
<script type="text/javascript">
   $(document).ready(function() {
	   dataTableDraw();
   });
   
   
   var urlStr = $("#userPageList").val();
   function dataTableDraw(){
    $("#dutyListTable").dataTable({
	 pagingType: 'full_numbers',
	 scrollY:false,
	 scrollX:false,
	 processing : true, //加载转态
	 ordering:false,       //禁用排序去掉图标
	 bProcessing : true, //DataTables载入数据时，是否显示‘进度’提示 
	 bAutoWidth: false,
     bServerSide:true, //开启后端分页
     bDestroy: true,         //下边两个属性应该是重载数据相关的 不加在加载数据会弹窗报错 点击确定后显示数据
     bRetrieve: true,
     bProcessing: true, //显示加载数据时的提示
     bInfo:true,  //显示信息 如 当前x页 共x条数据等
     bFilter:false,  //检索、筛选框
     sAjaxSource:urlStr, //请求url
     bLengthChange:false, //支持变更页面显示数据行数
     sPaginationType: "bootstrap", //翻页风格
     bPaginate:true,  //显示翻页按钮
     iDisplayLength : 5,
     iDisplayStart :0,
     fnServerData: retrieveData, //执行函数
     aoColumns:[//列表元素  支持多种属性 
                     {
	                    "sClass": "text-center",
	                    "mData": "userId",
	                    "render": function (data, type, full, meta) {
	                        return '<input type="checkbox"  class="checkchild"  value="' + data + '" />';
	                    },
	                    "bSortable": false
                      },
                    /*   { "mData": "userId"}, */
                      { "mData": "userName"},
                      { "mData": "userCode"},
                      { "mData": "userPhone"},
                      { "mData": "addr"},
					  { "mData" : "createTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  },
					  { "mData" : "updateTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  } ,
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+row.userId+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+row.userId+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.userId+"')\">删除</button>"
				               return html;  
				            }
				        } 

                  ],
     oLanguage: {  
          "sProcessing" : "正在加载中......",  
          "sLengthMenu" : "_MENU_",  
          "sZeroRecords" : "无记录",  
          "sEmptyTable" : "表中无数据存在！",  
          "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _MAX_  条记录",  
          "sInfoEmpty" : "没有数据",  
          "sInfoFiltered" : "数据表中共为 _TOTAL_ 条记录",  
          "sSearch" : " ",  
          "oPaginate" : {  
           "sFirst" : " 首页 ",  
           "sPrevious" : " 上一页 ",  
           "sNext" : " 下一页 ",  
           "sLast" : " 末页 "  
           }  
    }  
    });
   // $(".dataTables_wrapper .dataTables_filter input").attr("placeholder","检索内容");
  
}  
 

   
   //对应上边的回调函数 参数个数不变 名字可改 第一个为请求url  第二个为上送数据 第三个为回调函数
	function retrieveData(sSource,aoData,fnCallback) {
	 var userNameSearch = {
	   "name":"userNameSearch",
	   "value":$("#search_userName").val()
	 }
	 var userCodeSearch = {
	   "name":"userCodeSearch",
	   "value":$("#search_userCode").val()
	 }
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	 aoData.push(userNameSearch);
	 aoData.push(userCodeSearch);
	 $.ajax({
	     url : sSource,//这个就是请求地址对应sAjaxSource
	     data : {"aoData":JSON.stringify(aoData)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
	     type : 'post',
	     dataType : 'json',
	     async : false,
	     success : function(result) {
	         fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
	     },
	    error : function(XMLHttpRequest, textStatus, errorThrown) {
			bootboxAlert({
				message : '获取列表失败：' + getAjaxErrorResponseContent(XMLHttpRequest, textStatus, errorThrown)
	         });
	   }
	 });
	}
   
  
   /* 日期格式化代码 */
	function getMyDate(time){  
	    if(typeof(time)=="undefined"){
	        return "";
	    }
	    var oDate = new Date(time),  
	     oYear = oDate.getFullYear(),  
	     oMonth = oDate.getMonth()+1,  
	     oDay = oDate.getDate(),  
	   /*  oHour = oDate.getHours(),  
	     oMin = oDate.getMinutes(),  
	     oSen = oDate.getSeconds(),  */
	     oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间  
	     // +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen)
	     return oTime;  
	    }
	    
	     //补0操作,当时间数据小于10的时候，给该数据前面加一个0  
	    function getzf(num){  
	        if(parseInt(num) < 10){  
	            num = '0'+num;  
	        }  
	        return num;  
	    }

	  /* 实现复选框多选 */
	  $(".checkall").click(function () {
	        var check = $(this).prop("checked");
	        $(".checkchild").prop("checked", check);
	  }); 
	
	 function childclick(){
	        if ($(this).is(":checked") == false) {
	            $("#checkAll").prop("checked", false);
	        }
	    }

   
	    
   /* 查询条件 */
   function searchDatas(){
	   table.draw();
    }
  

	/* 新增  */
   function addFun(){
	   $('#myModal').modal('show');
   }
	/* 修改 */
	 function oemp_editmn(){
	   $('#myModal').modal('show');
   }
	/* 删除  */
	 function oemp_editzt(id){
	   console.info("id:"+id);
   }
	
   /* 批量删除 */
    function deleteFun(){
    	 var checkVal = [];//获取选中的id
    	 $("input.checkboxes[name='checkBoxs']:checkbox").each(function() {
    		    if ($(this).is(":checked")) {
    		        var s= $(this).val();
    		        checkVal.push(s);
    		        ableMany=true;
    		    }
    		});
    	console.log("checkVal+++======");
    	
   }
</script>
</html>



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

    
   <%--   <script src="<%=basePath%>static/js/jquery.js"></script> --%>
    <script src="<%=basePath%>static/bootstrap/jquery-confirm/js/jquery-confirm.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script> 
     <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
     <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-theme.min.css">
     <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href=" http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">
      <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrap-table-zh-CN.js"></script>
   <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script> 
  <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="<%=basePath%>static/js/jquery.dataTables.min.js"></script>
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
<body>
<input type="hidden" id="userPageList" value="<%=basePath%>userManageList/selectListByPage" />
<input type="hidden" id="insertOrUpdateUser" value="<%=basePath%>userManageList/insertOrUpdateInfo" />
<input type="hidden" id="deleteInfoUser" value="<%=basePath%>userManageList/deleteInfo" />
<input type="hidden" id="deleteListUser" value="<%=basePath%>userManageList/deleteList" />

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
            <form id="searchUserForm" name="searchUserForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">客户姓名:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm "  oninput="checkInput()" name="search_userName" id="search_userName"
                                       placeholder="请输入客户名称">
                            </div>

                            <label class="control-label col-md-1 ">客户电话:</label>
                             <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm " oninput="checkInput()" name="search_userPhone" id="search_userPhone"
                                       placeholder="请输入客户电话">
                            </div>
                          
		                   <div class="col-md-2 ">
									<button class="btn btn-primary" 
										type="button" id="searchBtn" onclick="searchDatas();"
										>
										<span class="glyphicon glyphicon-zoom-in"> </span>查&nbsp;&nbsp;&nbsp;询
									</button>
							</div>

							<div class="col-md-2">
									<button disabled
										style="background-color: grey; border-color: grey;"
										class="btn btn-primary" type="button" id="resetSearchBtn"
										onclick="resetSearchConditions();">
										<span class="glyphicon glyphicon-remove"> </span>重&nbsp;&nbsp;&nbsp;置
									</button>
							</div>
				          
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="userForm" name="userForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="userId" id="userId" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span style="color:red; font-weight:bold;">*</span>客户姓名:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="userName" id="userName" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                        
                        <label class="control-label col-sm-2"><span style="color:red; font-weight:bold;">*</span>电话号码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="userPhone" id="userPhone" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2"><span style="color:red; font-weight:bold;">*</span>居住地址:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12">
                            <textarea class="form-control" name="addr" id="addr"
                                      style="resize:none; height: 50px;" rows="3" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')"
                                      placeholder="请输入..."
                                      ></textarea>
                        </div>
                    </div>
                   
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">存档时间:</label>
                       <div class="col-md-4  has-feedback"  >
							<input  name="createTime" id="createTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd ' })" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
						</div>

                        <label class="control-label col-sm-2 ">修改时间:</label>
                        <div class="col-md-4  has-feedback"  >
							<input  name="updateTime" id="updateTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd ' })" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" /> 
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
                    <button id="ok" class="btn btn-default  col-sm-1 col-sm-offset-2  "  onclick="submitHandler()" style="width: 80px">保存</button>
                    <button id="reseted" class="btn btn-default  col-sm-1  col-sm-offset-2 " onclick="resetHandler()" style="width: 80px">重置</button>
                    <button id="closeModel" type="button" class="btn btn-default col-sm-1  col-sm-offset-2 "  data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <!--模态框 end-->
<!-- <div class="btn-group" style="margin-top:10px; " >
   <button type="button" class="btn btn-default" onclick="addFun()" style="margin-left:16px"> <i class="fa fa-plus-square-o fa-lg"></i>&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
	<button class="btn btn-default" onclick="deleteFun()" ><i class="fa fa-trash-o fa-lg"></i>&nbsp;批量删除</button>
</div> -->
<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
	<thead>
		<tr class="text-c">
		    <th>
                <input type="checkbox" id="checkall" class="checkall" name="checkBoxs" />
            </th>
			<th></th> 
			<th>客户姓名</th>
			<th>客户电话</th>
			<th>客户地址</th>
			<th>存档时间</th>
			<th>修改时间</th>
			<th>操作</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</body>
<script type="text/javascript">
var userId=null;
var userPhone=null;
var userName=null;
var addr=null;
var createTime=null;
var updateTime=null;
var remark=null;


   $(document).ready(function() {
	   //默认加载dataTable
	   dataTableDraw();
	   
	   //表单验证
	   formValidator();
   });
   
   function changeBtnable() {
		$("#resetSearchBtn").removeAttr("disabled");
		$("#resetSearchBtn").removeAttr("style", "background-color:grey");
		$("#resetSearchBtn").removeAttr("style", "border-color:grey");
	}

	function changeBtndisable() {
		$("#resetSearchBtn").attr("disabled", "true");
		$("#resetSearchBtn").attr("style",
				"background-color:grey;border-color:grey");
	}

	var values = "";//判断按钮状态全局变量
	function checkInput() {
		var searchUserForm = $('#searchUserForm').serializeArray();
		$.each(searchUserForm, function() {
			if (this.value != "") {
				values += this.value;
			}
		});
		if (values.length > 0) {
			changeBtnable();
		} else {
			changeBtndisable();
		}
		values = "";
	}
	
	
	
   $("#ok").attr("disabled","true");
   $("#ok").attr("style","background-color:grey;border-color:grey;color:white;");
   
   function check()
   {
     $("#ok").removeAttr("disabled");
     $("#reseted").removeAttr("disabled");
     $("#reseted").removeAttr("style","border-color:grey;background-color:grey;color:white;");
     $("#ok").removeAttr("style","border-color:grey;background-color:grey;color:white;");
   }
   function checkInputing(){
		var  userCode=$("#userForm #userCode").val();
		var  userName=$("#userForm #userName").val();
		var  userPhone=$("#userForm #userPhone").val();
		var  addr=$("#userForm #addr").val();
		var  createTime=$("#userForm #createTime").val();
		var  updateTime=$("#userForm #updateTime").val();
		var  remark=$("#userForm #remark").val();
		var  password=$("#userForm #password").val();
		if((userCode=='')&& (userName=='' )&&(userPhone=='')&&(addr=='') &&(createTime=='')&&(updateTime=='')&&(remark=='')&&(password==''))
		{
			$("#ok").attr("disabled","true");
			$("#reseted").attr("disabled","true");	
			$("#ok").attr("style","background-color:grey;border-color:grey;color:white;");
			$("#reseted").attr("style","background-color:grey;border-color:grey;color:white;");
	    }else{
	    	check();
	    }
	}
   //表单验证配置
   function formValidator(){
   $('#userForm').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            }, 
      fields: {
    	  userName: {
              validators: {
                  notEmpty: {
                      message: '客户姓名不能为空'
                  }
              }
          },
          userPhone: {
              validators: {
                  notEmpty: {
                      message: '客户电话不能为空'
                  },
                  regexp: {
                      regexp: "^\\d+$",
                      message: '只能录入正整数'
                  }
              }
          },
          addr: {
              validators: {
            	  notEmpty: {
                      message: '客户地址不能为空'
                  }
              }
          },
      }
    });
   }  
   var urlStr = $("#userPageList").val();
   function dataTableDraw(){
    $("#dutyListTable").dataTable({
	 pagingType: 'full_numbers',
	 scrollY:"300px",
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
     //动态生成复选框
     fnDrawCallback: function() {  
           $(this).find('thead input[type=checkbox]').removeAttr('checked');                        
       },  
     aoColumnDefs: [{
                       'targets': 0,
                       'searchable':false,
                       'orderable':false,
                       'className': 'dt-body-center',
                       'render': function (data, type, row){
                        return '<input class="checkbox_select" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.userId).html() + '">';
                  
                       }
                  }],  
     aoColumns:[//列表元素  支持多种属性 
                      { "mData": ""}, 
					  {
					     "mData": "userId",
					     "visible": false
					  },
                      { "mData": "userName"},
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
				             /*  var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.userId+"')\">删除</button>" */
				                       var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.userId+"')\">删除</button>"
				                       
				                       
				                       return html;  
				            }
				      },
				      { "mData": "remark",
				    	  "visible": false
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
	 var userPhoneSearch = {
	   "name":"userPhoneSearch",
	   "value":$("#search_userPhone").val()
	 }
	
	
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 aoData.push(userNameSearch);
	 aoData.push(userPhoneSearch);
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
			/* bootboxAlert({
				message : '获取列表失败：' + getAjaxErrorResponseContent(XMLHttpRequest, textStatus, errorThrown)
	         }); */
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

	     
	     
	  //datatable全选
        $('.checkall').on('click', function () {
              if (this.checked) {
                   $(this).attr('checked','checked')
                   $('.checkbox_select').each(function () {
                       this.checked = true;                        
                   });
               } else {
                   $(this).removeAttr('checked')
                   $('.checkbox_select').each(function () {
                       this.checked = false;
                   });
               }                 
       });     


	    
   /* 查询查询条件 */
   function searchDatas(){
	   var table = $('#dutyListTable').DataTable();
	   table.draw(true);
    }
   
   /**重置查询条件*/
	function resetSearchConditions() {
		$("#searchUserForm")[0].reset();
		var table = $('#dutyListTable').DataTable();
		table.draw(true);
		changeBtndisable();
	}
   
	/* 关闭模态框*/
	$('#myModal').on('hidden.bs.modal', function() {
		$("#userForm")[0].reset();//使用dom的reset
		$("#userId").val("");
        $("#userForm").data('bootstrapValidator').destroy();
        $('#userForm').data('bootstrapValidator', null);
        formValidator();
    });
	
   /* 按钮关闭模态框*/
   function closeModel(){
	   $("#reseted").attr("disabled","true");	
	   $("#ok").attr("disabled","true");
	   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white;");
	   $("#ok").attr("style","background-color:grey;border-color:grey;color:white;");
	   $("#userId").val("");
	   $("#userForm")[0].reset();//使用dom的reset
   }
   
   
   /* 按钮重置模态框 */
   function resetHandler(){
	   //$("#userForm")[0].reset();//使用dom的reset
	   if($("#userId").val()==null || $("#userId").val()==""){
		   $("#userForm").data('bootstrapValidator').resetForm();
		   $("#reseted").attr("disabled","true");	
		   $("#ok").attr("disabled","true");
		   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white;");
		   $("#ok").attr("style","background-color:grey;border-color:grey;color:white;");
		   userForm.reset();
	   }
	   if($("#userId").val()!=null && $("#userId").val()!=""){
		   $("#userId").val(userId);
		   $("#userPhone").val(userPhone);
		   $("#userName").val(userName);
		   $("#addr").val(addr);
		   $("#createTime").val(createTime);
		   $("#updateTime").val(updateTime);
		   $("#remark").val(remark);
		   $("#userForm").data('bootstrapValidator').destroy();
	       $('#userForm').data('bootstrapValidator', null);
	       formValidator(); 
	   }
	   
   }
   
   
   /**新增信息*/
	function addFun() {
		$('#ok').removeAttr("disabled");
		$("#ok").removeAttr("style");
		$('#reseted').removeAttr("disabled");
		$("#reseted").removeAttr("style");
		$("#ok").attr("style","display: block;");
		$("#reseted").attr("style","display: block;");
		$('#closeModel').removeAttr("disabled");
		$("#userForm")[0].reset();//使用dom的reset
		$("#userId").val("");	//避免hidden出现不能reset的情况
		$('#userPhone').attr("disabled",false);
		$('#userName').attr("disabled",false);
	    $('#addr').attr("disabled",false);
	    $('#createTime').attr("disabled",false);
	    $('#updateTime').attr("disabled",false);
	    $('#remark').attr("disabled",false);
		$('#myModal').modal('show');
		console.info("111111111"+$("#userId").val());
	}
   
   /* 查看信息*/
   function oemp_editsr(Row){
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#userId").val(data.userId);	//主键
	   $("#userPhone").val(data.userPhone);
	   $('#userPhone').attr("disabled",true);
	   $("#userName").val(data.userName);
	   $('#userName').attr("disabled",true);
	   $("#addr").val(data.addr);
	   $('#addr').attr("disabled",true);
	   $("#createTime").val(getMyDate(data.createTime));
	   $('#createTime').attr("disabled",true);
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $('#updateTime').attr("disabled",true);
	   $("#remark").val(data.remark);
	   $('#remark').attr("disabled",true);
	   $('#ok').attr("disabled",true);
	   $("#ok").attr("style","background-color:grey;border-color:grey;color:white;");
	   $('#reseted').attr("disabled",true);
	   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white;");
	   $('#closeModel').removeAttr("disabled");
	   
   }
   /* 修改 */
	 function oemp_editmn(Row){
	   
	   $('#ok').removeAttr("disabled");
	   $("#ok").removeAttr("style");
	   $('#reseted').removeAttr("disabled");
	   $("#reseted").removeAttr("style");
	   $("#ok").attr("style","display: block;");
	   $("#reseted").attr("style","display: block;");
	   $('#closeModel').removeAttr("disabled");
	   $('#userPhone').attr("disabled",false);
	   $('#userName').attr("disabled",false);
	   $('#addr').attr("disabled",false);
	   $('#createTime').attr("disabled",false);
	   $('#updateTime').attr("disabled",false);
	   $('#remark').attr("disabled",false);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#userId").val(data.userId);
	   $("#userPhone").val(data.userPhone);
	   $("#userName").val(data.userName);
	   $("#addr").val(data.addr);
	   $("#createTime").val(getMyDate(data.createTime));
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $("#remark").val(data.remark);
	   userId=$("#userId").val();
	   userPhone=data.userPhone;
	   userName=data.userName;
	   addr=data.addr;
	   createTime=getMyDate(data.createTime);
	   updateTime=getMyDate(data.updateTime);
	   remark=data.remark;
	   console.info("222222222222"+userId);
	 }
		/* 删除  */
	 function oemp_editzt(id){
		 $.confirm({
	            title: '提示',
	            content: '您确认需要删除选中的数据吗？',
	            type:'red',
	            icon:'glyphicon glyphicon-question-sign',
	            buttons: {
	                ok: {
	                    text: '确认',
	                    btnClass: 'btn-primary',
	                    action: function(){ //确认按钮回调
	                        deleteUser(id);
	                    }
	                },
	                cancel: {
	                    text: '取消',
	                    btnClass: 'btn-primary',
	                    action: function(){ //取消按钮回调
	                    }
	                }
	            },
	        });
	 }
	
	 /* 删除数据 */
	 function deleteUser(userId){
	 var delUrl = $("#deleteInfoUser").val();
	 $.post(delUrl,  {"userId": userId},function(data) {
	 			if (data || data=='true') {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除成功！',
	 	                type:'green',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        }
	 	                    }
	 	                }
	 	            });
	 				searchDatas(); //刷新列表
	 			} else {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除失败,如有问题请联系管理员！',
	 	                type:'red',             //一般危险操作用red,保存成功操作green
	 	                buttons: {              //定义按钮
	 	                    confirm: {
	 	                        text: '确认',
	 	                        btnClass: 'btn-primary',
	 	                        action: function(){ //这里写点击按钮回调函数
	 	                        }
	 	                    }
	 	                }
	 	            });
	 			}
	 		}, 'json');
	 }
	 
	 
		
	 /* 批量删除 */
	  function deleteFun(){
		  var selectLoans = [];
          $('.checkbox_select').each(function () {
              if($(this).is(':checked')){
            	   selectLoans.push($(this).val());                  
              }
          });
         if(selectLoans.length == 0){ 
        	 $.alert({
 			    title: '提示',
 			    content: '请选择一行数据进行删除！',
 			    type:'red',				//一般危险操作用red,保存成功操作green
 			    buttons: {				//定义按钮
 			        confirm: {
 			        	text: '确认',
 			        	btnClass: 'btn-primary',
 			        	action: function(){	//这里写点击按钮回调函数
 			        		
 			        	}
 			        }
 			    }
 			});           
         }else{
        	 $.confirm({
 	            title: '提示',
 	            content: '您确认需要删除选中的数据吗？',
 	            type:'red',
 	            icon:'glyphicon glyphicon-question-sign',
 	            buttons: {
 	                ok: {
 	                    text: '确认',
 	                    btnClass: 'btn-primary',
 	                    action: function(){ //确认按钮回调
 	                       var idListStr ='';
 	                       for (var i = 0; i < selectLoans.length; i++) { 
 	                           if(i!=selectLoans.length-1){
 	                               idListStr = idListStr + selectLoans[i] +",";
 	                           }else{
 	                               idListStr = idListStr + selectLoans[i];
 	                           } 
 	                       }  
 	                       console.info("id:"+idListStr);
 	                       var deleteInfoUrl = $("#deleteListUser").val();
 	                  	   $.post(deleteInfoUrl,  {"idListStr": idListStr},function(data) {
 	                  	 			if (data || data=='true') {
 	                  	 				$.alert({
 	                  	 	                title: '提示',
 	                  	 	                content: '删除成功！',
 	                  	 	                type:'green',             //一般危险操作用red,保存成功操作green
 	                  	 	                buttons: {              //定义按钮
 	                  	 	                    confirm: {
 	                  	 	                        text: '确认',
 	                  	 	                        btnClass: 'btn-primary',
 	                  	 	                        action: function(){ //这里写点击按钮回调函数
 	                  	 	                        }
 	                  	 	                    }
 	                  	 	                }
 	                  	 	            });
 	                  	 				searchDatas(); //刷新列表
 	                  	 			} else {
 	                  	 				$.alert({
 	                  	 	                title: '提示',
 	                  	 	                content: '删除失败,如有问题请联系管理员！',
 	                  	 	                type:'red',             //一般危险操作用red,保存成功操作green
 	                  	 	                buttons: {              //定义按钮
 	                  	 	                    confirm: {
 	                  	 	                        text: '确认',
 	                  	 	                        btnClass: 'btn-primary',
 	                  	 	                        action: function(){ //这里写点击按钮回调函数
 	                  	 	                        }
 	                  	 	                    }
 	                  	 	                }
 	                  	 	            });
 	                  	 			}
 	                  	 		}, 'json');
 	                    }
 	                },
 	                cancel: {
 	                    text: '取消',
 	                    btnClass: 'btn-primary',
 	                    action: function(){ //取消按钮回调
 	                    }
 	                }
 	            },
 	        });
         }
	  	
	 }
	 
	 
	 
	/**表单提交事件*/
	function submitHandler() {
		var bootstrapValidator = $("#userForm").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertOrUpdateUser").val();
			$.post(createUrl, $("#userForm").serialize(), function(data) {
				if (data.result==true) {
					$.alert({
		                title: '提示',
		                content: '客户保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#userForm").data('bootstrapValidator').resetForm();
							         $('#userForm')[0].reset();
							         searchDatas(); //刷新列表
		                      	     $('#myModal').modal('hide');
					        		 $('#ok').removeAttr("disabled");
		                        }
		                    }
		                }
		            });
				}
				else {
					$.alert({
		                title: '提示',
		                content: '客户保存失败！',
		                type:'red',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数 
		                        }
		                    }
		                }
		            });
				}
				
				}, 'json' );
		}else {
            $.alert({
                title: '提示',
                content: '请按照相关提示修改！',
                type:'red',             //一般危险操作用red,保存成功操作green
                buttons: {              //定义按钮
                    confirm: {
                        text: '确认',
                        btnClass: 'btn-primary',
                        action: function(){ //这里写点击按钮回调函数
                        }
                    }
                }
            });
        }
	}
	
</script>
</html>

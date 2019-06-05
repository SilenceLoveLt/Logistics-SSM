<%--
  User: YYK
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
    <script src="<%=basePath%>static/js/jquery.js"></script> 
    <script src="<%=basePath%>static/js/jquery.min.js"></script> 
   <%--  <script src="<%=basePath%>static/js/jquery-3.2.1.min.js"></script> --%>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href=" http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.css">
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrap-table-zh-CN.js"></script>
    <script src="<%=basePath%>static/bootstrap/jquery-confirm/js/jquery-confirm.js"></script>
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
<body>
<input type="hidden" id="jobPageList" value="<%=basePath%>jobManageList/selectListByPage" />
<input type="hidden" id="insertOrUpdateJob" value="<%=basePath%>jobManageList/insertOrUpdateInfo" />
<input type="hidden" id="deleteInfoJob" value="<%=basePath%>jobManageList/deleteInfo" />
<input type="hidden" id="deleteListJob" value="<%=basePath%>jobManageList/deleteList" />

<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>系统管理</a></li>
	    <li class="active">职位列表</li>
	</ol>
</div>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
       <div class="container-fluid">
            <form id="searchJobForm" name="searchJobForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">职位名称:</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm "  oninput="checkInput()" name="search_jobName" id="search_jobName"
                                       placeholder="请输入职位名称">
                            </div>

                            <label class="control-label col-md-1 ">职位编码:</label>
                             <div class="col-md-3 ">
                                <input type="text" class="form-control  input-sm " oninput="checkInput()" name="search_jobCode" id="search_jobCode"
                                       placeholder="请输入职位编码">
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="jobForm" name="jobForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="jobId" id="jobId" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span style="color:red; font-weight:bold;">*</span>职位姓名:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="jobName" id="jobName" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                        <label class="control-label col-sm-2 "><span style="color:red; font-weight:bold;">*</span>职位编码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="jobCode" id="jobCode"oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')"  placeholder="请输入..."/>
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

<div class="btn-group" style="margin-top:10px; " >
   <button type="button" class="btn btn-default" onclick="addFun()" style="margin-left:16px"> <i class="fa fa-plus-square-o fa-lg"></i>&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
	<button class="btn btn-default" onclick="deleteFun()" ><i class="fa fa-trash-o fa-lg"></i>&nbsp;批量删除</button>
</div>
<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
	<thead>
		<tr class="text-c">
		    <th>
                <input type="checkbox" id="checkall" class="checkall" name="checkBoxs" />
            </th>
			<th></th> 
			<th>职位名称</th>
			<th>职位编码</th>
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
var userCode=null;
var userPhone=null;
var userName=null;
var password=null;
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
		var searchJobForm = $('#searchJobForm').serializeArray();
		$.each(searchJobForm, function() {
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
   $("#ok").attr("style","background-color:grey;border-color:grey");
   
   function check()
   {
     $("#ok").removeAttr("disabled");
     $("#reseted").removeAttr("disabled");
     $("#reseted").removeAttr("style","border-color:grey;background-color:grey");
     $("#ok").removeAttr("style","border-color:grey;background-color:grey");
   }
   function checkInputing(){
		var  jobCode=$("#userForm #userCode").val();
		var  jobName=$("#userForm #userName").val();
		var  createTime=$("#userForm #createTime").val();
		var  updateTime=$("#userForm #updateTime").val();
		var  remark=$("#userForm #remark").val();
		if((jobCode=='')&& (jobName=='' )&&(createTime=='')&&(updateTime=='')&&(remark==''))
		{
			$("#ok").attr("disabled","true");
			$("#reseted").attr("disabled","true");	
			$("#ok").attr("style","background-color:grey;border-color:grey");
			$("#reseted").attr("style","background-color:grey;border-color:grey");
	    }else{
	    	check();
	    }
	}
   //表单验证配置
   function formValidator(){
   $('#jobForm').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            }, 
      fields: {
    	  jobName: {
              validators: {
                  notEmpty: {
                      message: '职位名称不能为空'
                  }
              }
          },
          jobCode: {
              validators: {
                  notEmpty: {
                      message: '职位编码不能为空'
                  }
              }
          },
      }
    });
   }  
   var urlStr = $("#jobPageList").val();
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
                        return '<input class="checkbox_select" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.jobId).html() + '">';
                  
                       }
                  }],  
     aoColumns:[//列表元素  支持多种属性 
                      { "mData": ""}, 
					  {
					     "mData": "jobId",
					     "visible": false
					  },
                      { "mData": "jobName"},
                      { "mData": "jobCode"},
					  { "mData" : "createTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  },
					  { "mData" : "updateTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  } ,
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.jobId+"')\">删除</button>"
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
	 var jobNameSearch = {
	   "name":"jobNameSearch",
	   "value":$("#search_jobName").val()
	 }
	 var jobCodeSearch = {
	   "name":"jobCodeSearch",
	   "value":$("#search_jobCode").val()
	 }
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	 aoData.push(jobNameSearch);
	 aoData.push(jobCodeSearch);
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
		$("#searchJobForm")[0].reset();
		var table = $('#dutyListTable').DataTable();
		table.draw(true);
		changeBtndisable();
	}
   
	/* 关闭模态框*/
	$('#myModal').on('hidden.bs.modal', function() {
		$("#jobForm")[0].reset();//使用dom的reset
		$("#jobId").val("");
        $("#jobForm").data('bootstrapValidator').destroy();
        $('#jobForm').data('bootstrapValidator', null);
        formValidator();
    });
	
   /* 按钮关闭模态框*/
   function closeModel(){
	   $("#reseted").attr("disabled","true");	
	   $("#ok").attr("disabled","true");
	   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white");
	   $("#ok").attr("style","background-color:grey;border-color:grey;color:white");
	   $("#jobId").val("");
	   $("#jobForm")[0].reset();//使用dom的reset
   }
   
   
   /* 按钮重置模态框 */
   function resetHandler(){
	   if($("#jobId").val()==null || $("#jobId").val()==""){
		   $("#jobForm").data('bootstrapValidator').resetForm();
		   $("#reseted").attr("disabled","true");	
		   $("#ok").attr("disabled","true");
		   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white");
		   $("#ok").attr("style","background-color:grey;border-color:grey;color:white");
		   jobForm.reset();
	   }
	   if($("#jobId").val()!=null && $("#jobId").val()!=""){
		   $("#jobId").val(jobId);
		   $("#jobCode").val(jobCode);
		   $("#jobName").val(jobName);
		   $("#createTime").val(createTime);
		   $("#updateTime").val(updateTime);
		   $("#remark").val(remark);
		   $("#jobForm").data('bootstrapValidator').destroy();
	       $('#jobForm').data('bootstrapValidator', null);
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
		$("#jobForm")[0].reset();//使用dom的reset
		$("#jobId").val("");	//避免hidden出现不能reset的情况
		$('#jobCode').removeAttr("readonly");
		$('#jobCode').removeAttr("disabled");
		$('#jobName').attr("disabled",false);
	    $('#createTime').attr("disabled",false);
	    $('#updateTime').attr("disabled",false);
	    $('#remark').attr("disabled",false);
		$('#myModal').modal('show');
	}
   
   /* 查看信息*/
   function oemp_editsr(Row){
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#jobId").val(data.jobId);	//主键
	   $("#jobCode").val(data.jobCode);
	   $('#jobCode').attr("disabled",true);
	   $("#jobName").val(data.jobName);
	   $('#jobName').attr("disabled",true);
	   $("#createTime").val(getMyDate(data.createTime));
	   $('#createTime').attr("disabled",true);
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $('#updateTime').attr("disabled",true);
	   $("#remark").val(data.remark);
	   $('#remark').attr("disabled",true);
	   $('#ok').attr("disabled",true);
	   $("#ok").attr("style","background-color:grey;border-color:grey;color:white");
	   $('#reseted').attr("disabled",true);
	   $("#reseted").attr("style","background-color:grey;border-color:grey;color:white");
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
	   $('#jobCode').attr("readonly",true);
	   $('#jobName').attr("disabled",false);
	   $('#createTime').attr("disabled",false);
	   $('#updateTime').attr("disabled",false);
	   $('#remark').attr("disabled",false);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#jobId").val(data.jobId);
	   $("#jobCode").val(data.jobCode);
	   $("#jobName").val(data.jobName);
	   $("#createTime").val(getMyDate(data.createTime));
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $("#remark").val(data.remark);
	   jobId=$("#jobId").val();
	   jobCode=data.jobCode;
	   jobName=data.jobName;
	   createTime=getMyDate(data.createTime);
	   updateTime=getMyDate(data.updateTime);
	   remark=data.remark;
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
	                        deleteJob(id);
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
	 function deleteJob(jobId){
	 var delUrl = $("#deleteInfoJob").val();
	 $.post(delUrl,  {"jobId": jobId},function(data) {
	 			if (data.result=='true') {
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
	 			} 
	 			if (data.result=='false') {
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
	 			if (data.result=='repeat') {
	 				$.alert({
	 	                title: '提示',
	 	                content: '删除失败,该职位正在使用！',
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
 	                       var deleteInfoUrl = $("#deleteListJob").val();
 	                  	   $.post(deleteInfoUrl,  {"idListStr": idListStr},function(data) {
 	                  		console.info("data.result:"+data.result);
 	                  	 			if (data.result=='true') {
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
 	                  	 			}
 	                  	 			if (data.result=='false'){
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
 	                  	 		if (data.result=='repeat'){
	                  	 				$.alert({
	                  	 	                title: '提示',
	                  	 	                content: '删除失败,该职位正在使用！',
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
		var bootstrapValidator = $("#jobForm").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertOrUpdateJob").val();
			$.post(createUrl, $("#jobForm").serialize(), function(data) {
				if (data.result=='true') {
					$.alert({
		                title: '提示',
		                content: '职位保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#jobForm").data('bootstrapValidator').resetForm();
							         $('#jobForm')[0].reset();
							         searchDatas(); //刷新列表
		                      	     $('#myModal').modal('hide');
					        		 $('#ok').removeAttr("disabled");
		                        }
		                    }
		                }
		            });
				}
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content: '职位保存失败！',
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
				if (data.result=='repeat') {
					$.alert({
		                title: '提示',
		                content: '职位编码不可重复！',
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

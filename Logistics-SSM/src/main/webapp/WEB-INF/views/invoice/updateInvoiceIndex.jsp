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
<input type="hidden" id="invoicePageList" value="<%=basePath%>invoiceManageList/selectListByPage" />
<input type="hidden" id="updateInvoice" value="<%=basePath%>invoiceManageList/updateAddrNow" />

<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>配送管理</a></li>
	    <li class="active">配送单管理</li>
	</ol>
</div>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
       <div class="container-fluid">
            <form id="searchInvoiceForm" name="searchInvoiceForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">订单编号:</label>
                            <div class="col-md-3 ">
                             <input type="text" class="form-control" oninput="checkInput()" name="search_orderId" id="search_orderId"  onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                            </div>
                            
                                                      
		                   <div class="col-md-4">
									<button class="btn btn-primary" style="margin-left:200px"
										type="button" id="searchBtn" onclick="searchDatas();"
										>
										<span class="glyphicon glyphicon-zoom-in"> </span>查&nbsp;&nbsp;&nbsp;询
									</button>
							</div>

							<div class="col-md-4">
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
        <form class="form-horizontal" role="form" id="invoiceForm" name="invoiceForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="invoiceId" id="invoiceId" />
                	<div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span style="color:red; font-weight:bold;">*</span>派送员:</label>
                         <div class="col-sm-4">
	                         <input type="text" class="form-control" style=" width: 250px;" name="empId" id="empId"  onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />						</div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span style="color:red; font-weight:bold;">*</span>订单编号:</label>
                        <div class="col-sm-4">
                            <input type="text"  style=" width: 250px;" class="form-control" name="orderId" id="orderId"  onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
                    </div>  
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="addrNow" id="addrNow" style="resize:none; height: 70px"
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
<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
	<thead>
		<tr class="text-c">
			<th></th>
			<th>订单编号</th>
			<th>线路用时</th>
			<th>车牌号</th>
			<th>收货人姓名</th>
			<th>收货人电话</th>
			<th>派送员</th>
			<th>当前地址</th>
			<th></th>
			<th>配送状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</body>
<script type="text/javascript">
var invoiceId=null;
var orderId=null;
var empName=null;
var addrNow=null;

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
		var searchInvoiceForm = $('#searchInvoiceForm').serializeArray();
		$.each(searchInvoiceForm, function() {
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
	
	
	   //表单验证配置
	   function formValidator(){
	   $('#invoiceForm').bootstrapValidator({
		   message: '不可用的值',
	       feedbackIcons: {
		   valid: 'glyphicon glyphicon-ok',
		   invalid: 'glyphicon glyphicon-remove',
		   validating: 'glyphicon glyphicon-refresh'
	            }, 
	      fields: {
	    	  addrNow: {
	              validators: {
	                  notEmpty: {
	                      message: '收货地址不能为空'
	                  }
	              }
	          }
	      }
	    });
	   }  
	
   var urlStr = $("#invoicePageList").val();
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
     aoColumns:[//列表元素  支持多种属性 
                      { "mData": "invoiceId",
                    	   "visible": false
	   				  },
					  { "mData": "orderId"},
					  { "mData" : "lineTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  },
                      { "mData": "vehicleName"},
				      { "mData": "consigneeName"},
					  { "mData": "recePhone"},
   					  { "mData": "empName"},
                      { "mData": "addrNow"},
                      { "mData": "invoiceStatus",
                    	   "visible": false
	   				  },
                      { "mData": "invoiceStatusName"},
					  {"mData":null,
					       render: function (data, type, row, meta){
					    	   /**
						    	 *  InvoiceStatus:1  代表 已发货
						    	 *  InvoiceStatus:2  代表 运输中
						    	 *  InvoiceStatus:3  代表 派送中
						    	 *  InvoiceStatus:4  代表 已签收 
						    	 *  
						    	 */
					    	   if(row.invoiceStatus==1){
					    		   var html="<button type='button'   class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">更新地址</button>"
					    	   }
					    	   if(row.invoiceStatus==2){
					    		   var html="<button type='button'   class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">更新地址</button>"
					    	   }
					    	   if(row.invoiceStatus==3){
					    		   var html="<button type='button'    class='btn btn-primary btn-sm oemp-privbtn'  onclick=\"oemp_editsr('"+meta.row+"')\">更新地址</button>"
					    	   }
					    	   if(row.invoiceStatus==4){
					    		   var html="<button type='button' style='background-color:grey;border-color:grey'  disabled='true' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">更新地址</button>"
					    	   }
					        
					          return html;  
					       }
					 },
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
	 var orderIdSearch = {
	   "name":"orderIdSearch",
	   "value":$("#search_orderId").val()
	 }
	 aoData.push(orderIdSearch);
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
	     /* oYear = oDate.getFullYear(),  
	     oMonth = oDate.getMonth()+1,  
	     oDay = oDate.getDate(),   */
	     oHour = oDate.getHours(),  
	     oMin = oDate.getMinutes(),  
	     oSen = oDate.getSeconds(),  
	    // oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间  
	      oTime= getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);
	     return oTime;  
	    }
	    
	     //补0操作,当时间数据小于10的时候，给该数据前面加一个0  
	    function getzf(num){  
	        if(parseInt(num) < 10){  
	            num = '0'+num;  
	        }  
	        return num;  
	    }
   
   
   /* 查询查询条件 */
   function searchDatas(){
	   var table = $('#dutyListTable').DataTable();
	   table.draw(true);
    }
   
   /**重置查询条件*/
	function resetSearchConditions() {
		$("#searchInvoiceForm")[0].reset();
		var table = $('#dutyListTable').DataTable();
		table.draw(true);
		changeBtndisable();
	}
   
   
	 /* 按钮重置模态框 */
	   function resetHandler(){
		   $("#invoiceId").val(invoiceId);
		   $("#orderId").val(orderId);
		   $("#empId").val(empName);
		   $("#addrNow").val(addrNow);
		   $("#invoiceForm").data('bootstrapValidator').destroy();
		   $('#invoiceForm').data('bootstrapValidator', null);
		   formValidator(); 
		   
	   }
   
   /* 更新地址 */
	 function oemp_editsr(Row){
	   $('#ok').removeAttr("disabled");
	   $("#ok").removeAttr("style");
	   $('#reseted').removeAttr("disabled");
	   $("#reseted").removeAttr("style");
	   $("#ok").attr("style","display: block;");
	   $("#reseted").attr("style","display: block;");
	   $('#closeModel').removeAttr("disabled");
	   $('#orderId').attr("readonly",true);
	   $('#empId').attr("readonly",true);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#invoiceId").val(data.invoiceId);
	   $("#orderId").val(data.orderId);
	   console.info("data.empName"+data.empName);
	   $("#empId").val(data.empName);
	   $("#addrNow").val(data.addrNow);
	   invoiceId=$("#invoiceId").val();
	   orderId=data.orderId;
	   empName=data.empName;
	   addrNow=data.addrNow;
	 }
   
   
	 
		/**表单提交事件*/
		function submitHandler() {
			var bootstrapValidator = $("#invoiceForm").data('bootstrapValidator');
			//获取表单验证结果
			var validateResult = bootstrapValidator.validate().isValid();
			if(validateResult){
				var createUrl = $("#updateInvoice").val();
				$.post(createUrl, $("#invoiceForm").serialize(), function(data) {
					if (data.result=='true') {
						$.alert({
			                title: '提示',
			                content: '地址更新成功！',
			                type:'green',             //一般危险操作用red,保存成功操作green
			                buttons: {              //定义按钮
			                    confirm: {
			                        text: '确认',
			                        btnClass: 'btn-primary',
			                        action: function(){ //这里写点击按钮回调函数
			                        	 $("#invoiceForm").data('bootstrapValidator').resetForm();
								         $('#invoiceForm')[0].reset();
								         searchDatas(); //刷新列表
			                      	     $('#myModal').modal('hide');
						        		 $('#ok').removeAttr("disabled");
			                        }
			                    }
			                }
			            });
					}
					if (data.result=='false'){
						$.alert({
			                title: '提示',
			                content: '地址更新失败！',
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

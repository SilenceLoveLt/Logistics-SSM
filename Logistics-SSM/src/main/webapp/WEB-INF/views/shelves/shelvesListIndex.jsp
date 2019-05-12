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
<input type="hidden" id="shelvesPageList" value="<%=basePath%>shelvesManageList/selectListByPage" />
<input type="hidden" id="insertOrUpdateShelves" value="<%=basePath%>shelvesManageList/insertOrUpdateInfo" />
<input type="hidden" id="deleteInfoShelves" value="<%=basePath%>shelvesManageList/deleteInfo" />
<input type="hidden" id="selectInGoods" value="<%=basePath%>shelvesManageList/selectInGoods" />
<input type="hidden" id="selectOutGoods" value="<%=basePath%>shelvesManageList/selectOutGoods" />
<input type="hidden" id="inGoodsShelves" value="<%=basePath%>goodsShelvesManageList/inGoodsShelves" />
<input type="hidden" id="outGoodsShelves" value="<%=basePath%>goodsShelvesManageList/outGoodsShelves" />


<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>货架管理</a></li>
	    <li class="active">货架列表</li>
	</ol>
</div>
<!-- 查询框 start -->
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
    <div class="panel-heading">查询条件</div>
    <div class="panel-body">
       <div class="container-fluid">
            <form id="searchShelvesForm" name="searchShelvesForm" class="form-horizontal">
                <div class="form-group">
                        <div class="row">
                            <label class="control-label col-md-1 ">货架名称:</label>
                            <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_shelvesName" id="search_shelvesName"
                                       placeholder="请输入货架名称">
                            </div>

                            <label class="control-label col-md-1 ">货架编码:</label>
                             <div class="col-md-2 ">
                                <input type="text" class="form-control  input-sm " name="search_shelvesCode" id="search_shelvesCode"
                                       placeholder="请输入货架编码">
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
        <form class="form-horizontal" role="form" id="shelvesForm" name="shelvesForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="shelvesId" id="shelvesId" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">货架名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="shelvesName" id="shelvesName" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                        
                        <label class="control-label col-sm-2">货架编码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="shelvesCode" id="shelvesCode" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..."/>
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span>*</span>货架类型:</label>
                         <div class="col-sm-4">
	                        <select name="shelvesType" id="shelvesType" class="form-control" oninput="check()" onmouseleave="checkInputing()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
										<option value="">请选择</option>
										<option value="1">是</option>
										<option value="0">否</option>
							</select>
						</div>
                    </div>
                  
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label>
                    </div>
                    <div class="form-group form-group-sm" style="padding-left: 10px">
                        <div class="col-sm-12 ">
                            <textarea class="form-control" name="remark" id="remark" style="resize:none; height: 70px"
                                      rows="3" placeholder="请输入..." oninput="check()" onmouseleave="checkInputing()"
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

<!-- 入库操作start -->    
	<div class="modal fade " id="inGoodsModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog  modal-lg" role="document">
				<div class="modal-content">
				<div class="modal-header " style="color: #333; background-color: #f5f5f5; border-color: #ddd;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
					<div class="modal-body">
							<input type="hidden" name="shelvesId" id="inGoodsId" />
							<div id='table-div1' >
							<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="inGoodsTable" style="white-space:nowrap">
							<thead>
								<tr class="text-c">
								    <th></th>
								    <th></th>
								    <th>所属订单</th>
									<th>货物编码</th>
									<th>货物名称</th>
									<th>货物类型</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<button class="btn btn-default" onclick="inGoodsFun()" style="margin-left:314px">保存</button>
						</div>
				</div>
			</div>
		</div>
	</div>
<!-- 入库操作 end -->

<!-- 出库操作start -->    
	<div class="modal fade " id="outGoodsModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog  modal-lg" role="document">
				<div class="modal-content">
				<div class="modal-header " style="color: #333; background-color: #f5f5f5; border-color: #ddd;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
					<div class="modal-body">
							<input type="hidden" name="shelvesId" id="outGoodsId" />
							<div id='table-div1' >
							<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="outGoodsTable" style="white-space:nowrap">
							<thead>
								<tr class="text-c">
								    <th></th>
								    <th></th>
								    <th>所属订单</th>
									<th>货物编码</th>
									<th>货物名称</th>
									<th>货物类型</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<button class="btn btn-default" onclick="outGoodsFun()" style="margin-left:314px">保存</button>
						</div>
				</div>
			</div>
		</div>
	</div>
<!-- 出库操作 end -->


<div class="btn-group" style="margin-top:10px; " >
   <button type="button" class="btn btn-default" onclick="addFun()" style="margin-left:16px"> <i class="fa fa-plus-square-o fa-lg"></i>&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
   <button class="btn btn-default" onclick="inFun()" ><i class="fa fa-trash-o fa-lg"></i>&nbsp;货物入库</button>
   <button class="btn btn-default" onclick="outFun()" ><i class="fa fa-trash-o fa-lg"></i>&nbsp;货物出库</button>
</div>
<table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
	<thead>
		<tr class="text-c">
		    <th>
                <input type="checkbox" id="checkall" class="checkall" name="checkBoxs" />
            </th>
			<th></th> 
			<th>货架名称</th>
			<th>货架编码</th>
			<th>货架类型</th>
			<th>操作</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</body>
<script type="text/javascript">
var shelvesId=null;
var shelvesCode=null;
var shelvesName=null;
var shelvesType=null;
var remark=null;


   $(document).ready(function() {
	   //默认加载dataTable
	   dataTableDraw();
	   
	   //入库操作
	   inTableDraw();
	   
	   //出库操作
	   outTableDraw(); 
	   
	   //表单验证
	   formValidator();
   });
   
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
		var  shelvesCode=$("#shelvesForm #shelvesCode").val();
		var  shelvesName=$("#shelvesForm #shelvesName").val();
		var  shelvesType=$("#shelvesForm #shelvesType").val();
		var  remark=$("#shelvesForm #remark").val();
		if((shelvesCode=='')&& (shelvesName=='' )&&(shelvesType=='')&&(remark==''))
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
   $('#shelvesForm').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            }, 
      fields: {
    	  shelvesName: {
              validators: {
                  notEmpty: {
                      message: '货架名称不能为空'
                  }
              }
          },
          shelvesCode: {
              validators: {
                  notEmpty: {
                      message: '货架编码不能为空'
                  }
              }
          },
          shelvesType: {
              validators: {
                  notEmpty: {
                      message: '货架类型不能为空'
                  }
              }
          },
      }
    });
   }  
   var urlStr = $("#shelvesPageList").val();
   function dataTableDraw(){
	   console.info("urlStr"+urlStr);
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
                        return '<input class="checkbox_select" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.shelvesId).html() + '">';
                  
                       }
                  }],  
     aoColumns:[//列表元素  支持多种属性 
                      { "mData": ""}, 
					  {
					     "mData": "shelvesId",
					     "visible": false
					  },
                      { "mData": "shelvesName"},
                      { "mData": "shelvesCode"},
                      { "mData": "shelvesType"},
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.shelvesId+"')\">删除</button>"
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
  
}  
 
	
   
   //对应上边的回调函数 参数个数不变 名字可改 第一个为请求url  第二个为上送数据 第三个为回调函数
	function retrieveData(sSource,aoData,fnCallback) {
	 var shelvesNameSearch = {
	   "name":"shelvesNameSearch",
	   "value":$("#search_shelvesName").val()
	 }
	 var shelvesCodeSearch = {
	   "name":"shelvesCodeSearch",
	   "value":$("#search_shelvesCode").val()
	 }
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	 aoData.push(shelvesNameSearch);
	 aoData.push(shelvesCodeSearch);
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
	  
        /* 模态框理数据对齐 */
  	   function inModelStyle(){
  		  $('#inGoodsModel').on('shown.bs.modal', function (e) {
  	        	var table1 = $('#inGoodsTable').DataTable();
  	        	table1.columns.adjust();
  	        
  	        });
  	   }
        
  	  /* 模态框理数据对齐 */
  	   function outModelStyle(){
  		  $('#outGoodsModel').on('shown.bs.modal', function (e) {
  	        	var table1 = $('#outGoodsTable').DataTable();
  	        	table1.columns.adjust();
  	        
  	        });
  	   }

  	    /* 刷新货物入库 */
  		function onGoodsTable(){
  			var table1 = $('#inGoodsTable').DataTable();
  			table1.draw(true);
  		}
  		
  		/* 刷新货物出库*/
  		function offGoodsTable(){
  			var table2 = $('#outGoodsTable').DataTable();
  			table2.draw(true);
  		}
        /* 入库操作 */
    	function inFun(){
    		 var selectLoans = [];
             $('.checkbox_select').each(function () {
                 if($(this).is(':checked')){
               	   selectLoans.push($(this).val());                  
                 }
             });
    		 if(selectLoans.length <= 0) {
    				$.alert({
    				    title: '提示',
    				    content: '请选择一行数据进行入库操作！',
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
    		 }
    		 if(selectLoans.length == 1) {
    			inModelStyle();
    			var idStr = selectLoans[0] ;
    			console.info("idStr"+idStr);
    			$('#inGoodsId').val(idStr);
    			$('#inGoodsModel').modal('show');
    			onGoodsTable();
    			inTableDraw();
    		    
    		 }
    		 if(selectLoans.length>1){
    			 $.alert({
    				    title: '提示',
    				    content: '请选择一行数据进行入库操作！',
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
    		 }
    	}
    	var inurlStr = $("#selectInGoods").val();
        function inTableDraw(){
	    	    $("#inGoodsTable").dataTable({
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
	    	     sAjaxSource:inurlStr, //请求url
	    	     bLengthChange:false, //支持变更页面显示数据行数
	    	     sPaginationType: "bootstrap", //翻页风格
	    	     bPaginate:true,  //显示翻页按钮
	    	     iDisplayLength : 5,
	    	     iDisplayStart :0,
	    	     fnServerData: retrieveData1, //执行函数
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
                        return '<input class="checkbox_select1" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.goodsId).html() + '">';
                  
                       }
                  }],   
	    	     aoColumns:[//列表元素  支持多种属性 
		    	                  { "mData": ""}, 
								  {
								     "mData": "goodsId",
								     "visible": false
								  },
	    	                      { "mData": "orderId"}, 
	    						  { "mData": "goodsCode"},
	    	                      { "mData": "goodsName"},
	    	                      { "mData": "goodsType"},
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
        }   
        
        function retrieveData1(sSource,aoData,fnCallback) {
        	 var shelvesIdSearch = {
        	   "name":"shelvesIdSearch",
        	   "value":$('#inGoodsId').val()
        	 }
        	 aoData.push(shelvesIdSearch);
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
        
        /** 入库保存*/
    	function inGoodsFun(){
    		var selectLoans = [];
            $('.checkbox_select1').each(function () {
                if($(this).is(':checked')){
              	   selectLoans.push($(this).val());                  
                }
            });
            var idListStr ='';
             for (var i = 0; i < selectLoans.length; i++) { 
                 if(i!=selectLoans.length-1){
                     idListStr = idListStr + selectLoans[i] +",";
                 }else{
                     idListStr = idListStr + selectLoans[i];
                 } 
             }  
             
    		var inGoodsUrl = $("#inGoodsShelves").val();
    		$.post(inGoodsUrl,{"shelvesId" : $('#inGoodsId').val(), "idListStr": idListStr}, function(data) {
    			console.info("data"+data);
    			if (data || data=='true') {
    				$.alert({
    				    title: '提示',
    				    content: '货物入库成功！',
    				    type:'green',				//一般危险操作用red,保存成功操作green
    				    buttons: {				//定义按钮
    				        confirm: {
    				        	text: '确认',
    				        	btnClass: 'btn-primary',
    				        	action: function(){	//这里写点击按钮回调函数
    				        		onGoodsTable();
    				        		 $('#inGoodsId').val();
    				        	}
    				        }
    				    }
    				});
    			} 
    			else{
    				$.alert({
    				    title: '提示',
    				    content: '货物入库失败！',
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
    			} 
    		}, 'json');
    	}
        /* 出库操作 */
    	function outFun(){
    		 var selectLoans = [];
             $('.checkbox_select').each(function () {
                 if($(this).is(':checked')){
               	   selectLoans.push($(this).val());                  
                 }
             });
    		 if(selectLoans.length <= 0) {
    				$.alert({
    				    title: '提示',
    				    content: '请选择一行数据进行出库操作！',
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
    		 }
    		 if(selectLoans.length == 1) {
    			outModelStyle();
    			var idStr = selectLoans[0] ;
    			console.info("idStr"+idStr);
    			$('#outGoodsId').val(idStr);
    			$('#outGoodsModel').modal('show');
    			offGoodsTable();
    			outTableDraw();
    		 }
    		 if(selectLoans.length>1){
    			 $.alert({
    				    title: '提示',
    				    content: '请选择一行数据进行入库操作！',
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
    		 }
    	}
    	var outurlStr = $("#selectOutGoods").val();
    	console.info("outurlStr"+outurlStr);
        function outTableDraw(){
	    	    $("#outGoodsTable").dataTable({
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
	    	     sAjaxSource:outurlStr, //请求url
	    	     bLengthChange:false, //支持变更页面显示数据行数
	    	     sPaginationType: "bootstrap", //翻页风格
	    	     bPaginate:true,  //显示翻页按钮
	    	     iDisplayLength : 5,
	    	     iDisplayStart :0,
	    	     fnServerData: retrieveData2, //执行函数
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
                        return '<input class="checkbox_select2" type="checkbox" data-status="'+ row.status + '"name="id[]" value="' + $('<div/>').text(row.goodsId).html() + '">';
                  
                       }
                  }],   
	    	     aoColumns:[//列表元素  支持多种属性 
		    	                  { "mData": ""}, 
								  {
								     "mData": "goodsId",
								     "visible": false
								  },
	    	                      { "mData": "orderId"}, 
	    						  { "mData": "goodsCode"},
	    	                      { "mData": "goodsName"},
	    	                      { "mData": "goodsType"},
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
	    
        function retrieveData2(sSource,aoData,fnCallback) {
        	 var shelvesIdSearch = {
        	   "name":"shelvesIdSearch",
        	   "value":$('#outGoodsId').val()
        	 }
        	 aoData.push(shelvesIdSearch);
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
        
        
        /** 出库保存*/
    	function outGoodsFun(){
    		var selectLoans = [];
            $('.checkbox_select2').each(function () {
                if($(this).is(':checked')){
              	   selectLoans.push($(this).val());                  
                }
            });
            var idListStr ='';
             for (var i = 0; i < selectLoans.length; i++) { 
                 if(i!=selectLoans.length-1){
                     idListStr = idListStr + selectLoans[i] +",";
                 }else{
                     idListStr = idListStr + selectLoans[i];
                 } 
             }  
             
    		var outGoodsUrl = $("#outGoodsShelves").val();
    		$.post(outGoodsUrl,{"shelvesId" : $('#outGoodsId').val(), "idListStr": idListStr}, function(data) {
    			console.info("data"+data);
    			if (data || data=='true') {
    				$.alert({
    				    title: '提示',
    				    content: '货物出库成功！',
    				    type:'green',				//一般危险操作用red,保存成功操作green
    				    buttons: {				//定义按钮
    				        confirm: {
    				        	text: '确认',
    				        	btnClass: 'btn-primary',
    				        	action: function(){	//这里写点击按钮回调函数
    				        		 offGoodsTable();
    				        		 $('#outGoodsId').val();
    				        	}
    				        }
    				    }
    				});
    			} 
    			else{
    				$.alert({
    				    title: '提示',
    				    content: '货物出库失败！',
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
    			} 
    		}, 'json');
    	}
    	
   /* 查询查询条件 */
   function searchDatas(){
	   var table = $('#dutyListTable').DataTable();
	   table.draw(true);
    }
   
   /**重置查询条件*/
	function resetSearchConditions() {
		$("#searchShelvesForm")[0].reset();
		var table = $('#dutyListTable').DataTable();
		table.draw(true);
	}
   
	/* 关闭模态框*/
	$('#myModal').on('hidden.bs.modal', function() {
		$("#shelvesForm")[0].reset();//使用dom的reset
		$("#shelvesId").val("");
        $("#shelvesForm").data('bootstrapValidator').destroy();
        $('#shelvesForm').data('bootstrapValidator', null);
        formValidator();
    });
	
   /* 按钮关闭模态框*/
   function closeModel(){
	   $("#reseted").attr("disabled","true");	
	   $("#ok").attr("disabled","true");
	   $("#reseted").attr("style","background-color:grey;border-color:grey");
	   $("#ok").attr("style","background-color:grey;border-color:grey");
	   $("#shelvesId").val("");
	   $("#shelvesForm")[0].reset();//使用dom的reset
   }
   
   
   /* 按钮重置模态框 */
   function resetHandler(){
	   //$("#userForm")[0].reset();//使用dom的reset
	   if($("#shelvesId").val()==null || $("#shelvesId").val()==""){
		   $("#shelvesForm").data('bootstrapValidator').resetForm();
		   $("#reseted").attr("disabled","true");	
		   $("#ok").attr("disabled","true");
		   $("#reseted").attr("style","background-color:grey;border-color:grey");
		   $("#ok").attr("style","background-color:grey;border-color:grey");
		   shelvesForm.reset();
	   }
	   if($("#shelvesId").val()!=null && $("#shelvesId").val()!=""){
		   $("#shelvesId").val(shelvesId);
		   $("#shelvesCode").val(shelvesCode);
		   $("#shelvesName").val(shelvesName);
		   $("#shelvesType").val(shelvesType);
		   $("#remark").val(remark);
		   $("#shelvesForm").data('bootstrapValidator').destroy();
	       $('#shelvesForm').data('bootstrapValidator', null);
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
		$("#shelvesForm")[0].reset();//使用dom的reset
		$("#shelvesId").val("");	//避免hidden出现不能reset的情况
		$('#shelvesCode').removeAttr("disabled");
		$('#shelvesCode').removeAttr("readonly");
		$('#shelvesType').attr("disabled",false);
		$('#shelvesName').attr("disabled",false);
	    $('#remark').attr("disabled",false);
		$('#myModal').modal('show');
	}
   
   /* 查看信息*/
   function oemp_editsr(Row){
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#shelvesId").val(data.shelvesId);	//主键
	   $("#shelvesCode").val(data.shelvesCode);
	   $('#shelvesCode').attr("disabled",true);
	   $("#shelvesType").val(data.shelvesType);
	   $('#shelvesType').attr("disabled",true);
	   $("#shelvesName").val(data.shelvesName);
	   $('#shelvesName').attr("disabled",true);
	   $("#remark").val(data.remark);
	   $('#remark').attr("disabled",true);
	   $('#ok').attr("disabled",true);
	   $("#ok").attr("style","background-color:grey;border-color:grey");
	   $('#reseted').attr("disabled",true);
	   $("#reseted").attr("style","background-color:grey;border-color:grey");
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
	   $('#shelvesCode').attr("readonly",true);
	   $('#shelvesName').attr("disabled",false);
	   $('#shelvesType').attr("disabled",false);
	   $('#remark').attr("disabled",false);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#shelvesId").val(data.shelvesId);
	   $("#shelvesCode").val(data.shelvesCode);
	   $("#shelvesName").val(data.shelvesName);
	   $("#shelvesType").val(data.shelvesType);
	   $("#remark").val(data.remark);
	   shelvesId=$("#shelvesId").val();
	   shelvesType=data.shelvesType;
	   shelvesCode=data.shelvesCode;
	   shelvesName=data.shelvesName;
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
	                        deleteShelves(id);
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
	 function deleteShelves(shelvesId){
	 var delUrl = $("#deleteInfoShelves").val();
	 $.post(delUrl,  {"shelvesId": shelvesId},function(data) {
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
	 	                content: '删除失败,该货架正在使用不可删除！',
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
	 
	 
	
	 
	 
	/**表单提交事件*/
	function submitHandler() {
		var bootstrapValidator = $("#shelvesForm").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertOrUpdateShelves").val();
			$.post(createUrl, $("#shelvesForm").serialize(), function(data) {
				if (data.result=='true') {
					$.alert({
		                title: '提示',
		                content: '货架保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#shelvesForm").data('bootstrapValidator').resetForm();
							         $('#shelvesForm')[0].reset();
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
		                content: '货架保存失败！',
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
		                content: '货架编码重复，请重新输入！',
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

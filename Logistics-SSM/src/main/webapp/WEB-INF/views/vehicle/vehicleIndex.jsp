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
	    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-treeview/css/bootstrap-treeview.min.css">
	    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-treeview/css/zx.css">
	    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.css">
	   <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet"> 
	    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
	    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
	    <script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
	    <script src="<%=basePath%>static/bootstrap/js/bootstrap.js"></script>
	    <script src="<%=basePath%>static/bootstrap/bootstrap-table/bootstrap-table.js"></script>
	     <script src="<%=basePath%>static/bootstrap/bootstrap-treeview/js/bootstrap-treeview.js"></script>
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
        .lk-header .btn-button
		{
			font-size:18px;
			color:#000;
			text-decoration: none;
			line-height: 50px;
		}
		.lk-header a:hover
		{
			color:#000;
			text-decoration: none;
		}
		.lk-header .col-sm-2 .btn-primary
		{
		
			height: 50px;
			width:115px;
		}
		.lk-header .col-sm-2 .btn-button
		{
			padding-left:20px;
		}
		.lk-header .col-sm-10 .btn-button
		{
			padding-left: 10px;
		}
		.lk-header .col-sm-2 .btn-style1
		{
		    color:black;
			height: 50px;
			width:115px;
		}
		
		.lk-header .col-sm-2 .btn-style1 .btn-link
		{
			 color:black;
			 width:115px;
			 font-size:18px;
			 border:0;
			 outline:none;
			 text-decoration: none;
		}
		
		.lk-header .col-sm-2 .btn-style .btn-link
		{
		     color:black;
			 width:115px;
			 font-size:18px;
			 border:0;
			 outline:none;
			 text-decoration: none;
			 
		} 
		
		.row .margin_sty
		{
			width:210px;
		}
		.dropdown-toggle {
			height: 28px;
		}
		
		.btn-group.pull-right {
			position: relative;
			left: 0px;
			top: 6px;
		}
		
		#newquestionUpdate {
			overflow-x: hidden;
			overflow-y: auto;
		}
			.lk-header .btn-button
		{
			font-size:18px;
			color:#000;
			text-decoration: none;
			line-height: 50px;
		}
		.lk-header a:hover
		{
			color:#000;
			text-decoration: none;
		}
		.lk-header .col-sm-2 .btn-style
		{
			height: 50px;
			width:115px;
		}
		.lk-header .col-sm-2 .btn-button
		{
			padding-left:20px;
		}
		
		.form-horizontal
		{
		    margin-top:30px;
			margin-right: 130px;
		}
		.form-group .row .col-sm-2 input,.form-group .row .col-sm-2 select
		{
			width:210px;
		}
		#newquestionUpdate .title
		{
		    font-size:18px;
			font-weight: bold;
			margin-top: 20px;
			padding-left: 470px;
		}
		.form-group .row .btn-margin
		{
			margin-top: 35px;
		}
		.bootstrap-table .fixed-table-container tr {
			/*行高*/
			height: 40px !important;
		}
		.list-group-item:first-child {
		    border-top-left-radius: 0px;
		    border-top-right-radius: 0px;
		}
		.list-group-item {
		    position: relative;
		    display: block;
		    padding: 10px 15px;
		    margin-bottom: -1px;
		    background-color: #fff;
		    border: 0px ;
		}
    </style>
</head>
<body>
<input type="hidden" id="backIndexUrl" value="<%=basePath%>vehicleManageList/" />
<input type="hidden" id="addPageUrl" value="<%=basePath%>vehicleManageList/addVehiclePage" />
<input type="hidden" id="vehicleTypeTree" value="<%=basePath%>vehicleManageList/selectLeftTree" />
<input type="hidden" id="vehicleListPage" value="<%=basePath%>vehicleManageList/selectListByPage" />
<input type="hidden" id="updateVehicle" value="<%=basePath%>vehicleManageList/updateInfo" />
<input type="hidden" id="deleteInfoVehicle" value="<%=basePath%>vehicleManageList/deleteInfo" />





<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>车辆管理</a></li>
	    <li class="active">车辆列表</li>
	</ol>
</div>



     <!--下面展示的题目两颗树  -->  
<div class="container-fluid">
		<div class="row" >
			<div class="col-sm-3 margin_sty">
			     <div id="treeview-checkable1" ></div>
			</div>
			<div class="col-sm-9 rightTable" style="visibility: hidden;margin-left: 50px;" >
		   <table class="display table table-striped table-bordered table-hover table-checkable text-center" id="dutyListTable" style="white-space:nowrap">
			    <thead>
					<tr class="text-c">
						<th></th> 
						<th>车牌号</th>
						<th>车辆编码</th>
						<th></th>
						<th>车辆类型</th>
						<th>承重量(kg)</th>
						<th>承重体积(cm³)</th>
						<th>操作</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
          </table>
		  </div>
		</div>
</div>
    
   <!--模态框 start-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <form class="form-horizontal" role="form" id="vehicleForm" name="vehicleForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
                </div>
                <div class="modal-body" style="margin-right: 30px">
                <input type="hidden" name="vehicleId" id="vehicleId" />
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">车辆编码:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="vehicleCode" id="vehicleCode"  onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
                        </div>
                        
                        <label class="control-label col-sm-2">车辆类型:</label>
                        <div class="col-sm-4">
						      	<select name="vehicleType" id="vehicleType" class="form-control"  onkeyup="this.value=this.value.replace(/\s+/g,'')">
									<option value="">请选择</option>
								</select>
						 </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 "><span>*</span>车牌号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="vehicleName" id="vehicleName" onkeyup="this.value=this.value.replace(/\s+/g,'')"  placeholder="请输入..."/>
                        </div>
                        <label class="control-label col-sm-2">承重量:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="weight" id="weight"  onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..."/>
                            <span class="form-control-feedback">(kg)</span>
                        </div>
                    </div>
                   
                    <div class="form-group form-group-sm">
                        <label class="control-label col-sm-2 ">承重体积:</label>
                        <div class="col-sm-4">
                             <input type="text" class="form-control" name="volume" id="volume" onkeyup="this.value=this.value.replace(/\s+/g,'')"  placeholder="请输入..."/>
                             <span class="form-control-feedback">(cm³)</span>
                        </div>
						 <label class="control-label col-sm-2">适用类别:</label>
                         <div class="col-sm-4">
						      	<select name="applyType" id="applyType" class="form-control"   onkeyup="this.value=this.value.replace(/\s+/g,'')">
									<option value="">请选择</option>
								</select>
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
    
	
</body>


<script type="text/javascript">
var parentCode=null;
var childerCode=null;
var vehicleId=null;
var vehicleCode=null;
var vehicleName=null;
var vehicleType=null;
var weight=null;
var volume=null;
var applyType=null;
var remark=null;
var applyTypeList = ${applyTypeList};     //使用类别
var vehicleTypeList = ${vehicleTypeList};     //车辆类别



   $(document).ready(function() {
	   //默认加载表格
	   dataTableDraw();
	   
	   //表单验证
	   formValidator();
	  //默认加载类别数
	   var vehicleTypeTreeUrl=$("#vehicleTypeTree").val();
       $.ajax({
	            url: vehicleTypeTreeUrl,    // 提交到controller的url路径
	            type: "post",    // 提交方式
	            // data: {"xxx":xxx},  // data为String类型，必须为 Key/Value 格式。
                dataType: "json",    // 服务器端返回的数据类型
	            success: function (data) { 
	            	$('#treeview-checkable1').treeview({
	            	    data: data,
	            	    showIcon: false,
	            	    showCheckbox: false,
	            	    levels: 0,
	            	    selectedBackColor: '#fffccc',
	            	    selectedColor: '#000000',
	            	    showTags: true,
	            	    onNodeSelected: addRightTree
	 				  });
	            }
        });
       
       initSelectOptions(applyTypeList, "code", "dataName", "applyType");
	   initSelectOptions(vehicleTypeList, "code", "dataName", "vehicleType");
	   
   });
   
   

   /**初始化下拉框, 参数：json数据，value用到的属性名，text用到的显示值，select的id*/
	 function initSelectOptions(jsonArr, valPro, textPro, domid) {
		var opt = '';
		for(var i=0; i<jsonArr.length; i++) {
			opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
		}
		$("#" + domid).append(opt);
	} 
   
   
	//跳转到题目新增页面
	function addFun(){
		var url=$("#addPageUrl").val();
		$("#addForm").attr("action",url);
		$("#addForm").submit();
	}
	
	
	//返回题目管理页面
	function returnFun(){
		var url=$("#backIndexUrl").val();
		$("#addForm").attr("action",url);
		$("#addForm").submit();
		
	}
   
	//点击按钮改变背景颜色
	function changeColor(btn)
	{
		btn.style.backgroundColor = "darkgrey";
	}
	function changeColor2(btn)
	{
		$("#btnstyle").removeAttr("style");
		btn.style.backgroundColor = "darkgrey";
	}
	
	
	
	//表单验证配置
	   function formValidator(){
	   $('#vehicleForm').bootstrapValidator({
		   message: '不可用的值',
	       feedbackIcons: {
		   valid: 'glyphicon glyphicon-ok',
		   invalid: 'glyphicon glyphicon-remove',
		   validating: 'glyphicon glyphicon-refresh'
	            }, 
	      fields: {
	    	  vehicleCode: {
	              validators: {
	                  notEmpty: {
	                      message: '车辆编码不能为空'
	                  }
	              }
	          },
	          vehicleType: {
	              validators: {
	                  notEmpty: {
	                      message: '车辆类别不能为空'
	                  }
	              }
	          },
	          weight: {
	              validators: {
	                  notEmpty: {
	                      message: '承重量不能为空'
	                  },
	                  regexp: {
	                      regexp: "^\\d+$",
	                      message: '只能录入正整数'
	                  }
	              }
	          },
	         volume: {
	              validators: {
	                  notEmpty: {
	                      message: '承重体积不能为空'
	                  },
	                  regexp: {
	                      regexp: "^\\d+$",
	                      message: '只能录入正整数'
	                  }
	              }
	          },
	          vehicleName: {
	              validators: {
	            	  notEmpty: {
	                      message: '车牌号不能为空'
	                  }
	              }
	          },
	          applyType: {
	              validators: {
	            	  notEmpty: {
	                      message: '适用类别不能为空'
	                  }
	              }
	          },
	      }
	    });
	   } 
   
	 //点击左边树触发事件
	  function addRightTree (event, node) 
    {
		  parentCode=node.partentCode;
		  childerCode=node.childerCode;
	      /* 加载右边的表格 */
	      var tableTwo = $('#dutyListTable').DataTable();
   	      tableTwo.draw(true); 
	      $('.rightTable').css("visibility", "visible");
	  }
	 
	 
	 
   var vehicleListUrl=$("#vehicleListPage").val();
   function dataTableDraw(){
    $("#dutyListTable").dataTable({
	 pagingType: 'full_numbers',
	 scrollY:"275px",
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
     sAjaxSource:vehicleListUrl, //请求url
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
     aoColumns:[//列表元素  支持多种属性 
					  {
					     "mData": "vehicleId",
					     "visible": false
					  },
					  { "mData": "vehicleName"},
                      { "mData": "vehicleCode"},
                      { "mData": "vehicleType",
	   					"visible": false},
   					  { "mData": "vehicleTypeName"},
                      { "mData": "weight"},
                      { "mData": "volume"},
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.vehicleId+"')\">删除</button>"
				               return html;  
				            }
				      },
				      { "mData": "applyType",
				        "visible": false
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
	 var parentCodeSearch = {
	   "name":"parentCode",
	   "value":parentCode
	 }
	 var childerCodeSearch = {
	   "name":"childerCode",
	   "value":childerCode
	 }
	 //我这里按照请求数据的格式增加了自己的查询条件 请求数据格式固定为 name-value的格式 可以使用
	 //alert打印查看 包含了基本的页码、页面数据元素、等信息以及新增的查询条件
	console.info("parentCodeSearch"+parentCodeSearch.value);
	 aoData.push(parentCodeSearch);
	 aoData.push(childerCodeSearch);
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
   
	 /* 刷新Table */
    function searchDatas(){
	 	var table = $('#dutyListTable').DataTable();
	 	table.draw(true);
	}
   
	/* 关闭模态框*/
	$('#myModal').on('hidden.bs.modal', function() {
		$("#vehicleForm")[0].reset();//使用dom的reset
		$("#vehicleId").val("");
        $("#vehicleForm").data('bootstrapValidator').destroy();
        $('#vehicleForm').data('bootstrapValidator', null);
        formValidator();
    });
	
   /* 按钮关闭模态框*/
   function closeModel(){
	   $("#reseted").attr("disabled","true");	
	   $("#ok").attr("disabled","true");
	   $("#reseted").attr("style","background-color:grey;border-color:grey");
	   $("#ok").attr("style","background-color:grey;border-color:grey");
	   $("#vehicleId").val("");
	   $("#vehicleForm")[0].reset();//使用dom的reset
   }
   
   
   /* 按钮重置模态框 */
   function resetHandler(){
		 $("#vehicleId").val(vehicleId);
		 $("#vehicleCode").val(vehicleCode); 
		 $("#vehicleName").val(vehicleName);
		 $("#vehicleType").val(vehicleType);
		 $("#weight").val(weight);
		 $("#volume").val(volume);
		 $("#applyType").val(applyType);
		 $("#remark").val(remark);
		 $("#vehicleForm").data('bootstrapValidator').destroy();
	     $('#vehicleForm').data('bootstrapValidator', null);
	     formValidator(); 
	   
   }
   
   
   /* 查看信息*/
   function oemp_editsr(Row){
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#vehicleId").val(data.vehicleId);	//主键
	   $("#vehicleCode").val(data.vehicleCode);
	   $('#vehicleCode').attr("disabled",true);
	   $("#vehicleType").val(data.vehicleType);
	   $('#vehicleType').attr("disabled",true);
	   $("#vehicleName").val(data.vehicleName);
	   $('#vehicleName').attr("disabled",true);
	   $("#weight").val(data.weight);
	   $('#weight').attr("disabled",true);
	   $("#applyType").val(data.applyType);
	   $('#applyType').attr("disabled",true);
	   $("#volume").val(data.volume);
	   $('#volume').attr("disabled",true);
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
	   $("#vehicleCode").attr("readonly",true);
	   $('#vehicleType').attr("disabled",false);
	   $('#vehicleName').attr("disabled",false);
	   $('#weight').attr("disabled",false);
	   $('#volume').attr("disabled",false);
	   $('#applyType').attr("disabled",false);
	   $('#remark').attr("disabled",false);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#vehicleId").val(data.vehicleId);
	   $("#vehicleCode").val(data.vehicleCode);
	   $("#vehicleType").val(data.vehicleType);
	   $("#vehicleName").val(data.vehicleName);
	   $("#weight").val(data.weight);
	   $("#applyType").val(data.applyType);
	   $("#volume").val(data.volume);
	   $("#remark").val(data.remark);
	   vehicleId=$("#vehicleId").val();
	   vehicleCode=data.vehicleCode;
	   vehicleType=data.vehicleType;
	   weight=data.weight;
	   vehicleName=data.vehicleName;
	   applyType=data.applyType;
	   volume=data.volume;
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
	                    	deleteVehicle(id);
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
	 function deleteVehicle(vehicleId){
		 console.info("vehicleId::::::::"+vehicleId);
	 var delUrl = $("#deleteInfoVehicle").val();
	 $.post(delUrl,  {"vehicleId": vehicleId},function(data) {
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
	 	                content: '删除失败,该车辆正在使用！',
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
			var bootstrapValidator = $("#vehicleForm").data('bootstrapValidator');
			//获取表单验证结果
			var validateResult = bootstrapValidator.validate().isValid();
			if(validateResult){
				var createUrl = $("#updateVehicle").val();
				$.post(createUrl, $("#vehicleForm").serialize(), function(data) {
					if (data.result==true) {
						$.alert({
			                title: '提示',
			                content: '车辆修改成功！',
			                type:'green',             //一般危险操作用red,保存成功操作green
			                buttons: {              //定义按钮
			                    confirm: {
			                        text: '确认',
			                        btnClass: 'btn-primary',
			                        action: function(){ //这里写点击按钮回调函数
			                        	 $("#vehicleForm").data('bootstrapValidator').resetForm();
								         $('#vehicleForm')[0].reset();
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
			                content: '车辆修改失败！',
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

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
<input type="hidden" id="lineTypeTree" value="<%=basePath%>lineManageList/selectLeftTree" />
<input type="hidden" id="lineListPage" value="<%=basePath%>lineManageList/selectListByPage" />
<input type="hidden" id="insertOrUpdateUser" value="<%=basePath%>userManageList/insertOrUpdateInfo" />
<input type="hidden" id="deleteInfoUser" value="<%=basePath%>userManageList/deleteInfo" />
<input type="hidden" id="deleteListUser" value="<%=basePath%>userManageList/deleteList" />





<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>线路管理</a></li>
	    <li class="active">线路列表</li>
	</ol>
</div>


<!-- 导航栏开始 -->
<!-- 题目管理和新增题目 -->
	<div class="container-fluid" style="background-color: lightgrey;margin-bottom: 20px;">
		<div class="row" >
		    <div class="lk-header">
		    <form method="post" id="addForm">
				<div class="col-sm-2" style="background-color:lightgrey;">
				   <div class="btn-style" onclick="changeColor(this)" >
				    <input type="button" id="btnstyle" style="background-color:darkgrey;line-height:50px;border-radius: 15px;" role="button" class="btn  btn-link" onclick="returnFun()" value="题目管理">
				   </div> 
				</div>
				<div class="col-sm-2" style="background-color:lightgrey ;" >	
				   <div	 class="btn-style1" onclick="changeColor2(this)">
					 <input type="button"  role="button" class="btn  btn-link" onclick="addFun()"  style="background-color:darkgrey; line-height:50px;border-radius: 15px;"  value="新增题目">
				   </div> 
				</div>

			</form>
			</div>
		</div>
	</div>
<!-- 导航栏结束 -->

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
						<th>线路编码</th>
						<th>线路类型</th>
						<th>应缴价格</th>
						<th>线路长度</th>
						<th>线路用时</th>
						<th>操作</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
          </table>
			</div>
			
			
			<!-- 无题目时会显示出来 -->
			<div class="col-sm-9 " id="noQues" style="padding-right:0px;padding-left:0px; display:none">
			       <p style="font-size:20px;color:red;padding-left:145px;padding-top:100px">该类别暂无线路设置，请先点击上方的“新增线路”进行新增！</p>
			</div>
		</div>
		
		
		<div class="page_style" style="height:55px; margin-bottom: 20px; margin-left:500px" >
		
        <div id="btn_look"  style="display:none;border:none; "><button  class="btn btn-default" style="outline: none;border:none;color:blue" onclick="btnPage()">查看更多题目</button></div>
        <div id="btn_nolook"  style="display:none;border:none;"><button class="btn btn-default" disabled="disabled" style="outline: none;border:none;" >无更多题目</button></div>
		</div>
</div>
    
   
    <!-- 用于跳转修改页面所需传的数据 -->
    <div id="DivId">
       	<form id="FormId" method="post">
       		<!-- 选择当前节点的id -->
       		<input type="hidden" id="updateTopicId" name="updateTopicId" >
       		<!-- 当前所选的适应类别 -->
       		<input type="hidden" id="updateApplyType" name="updateApplyType" >
       		<!-- 当前所选的题目类型 -->
       		<input type="hidden" id="updateTopicType" name="updateTopicType" >
       	</form>
    </div>
	
</body>


<script type="text/javascript">
var parentCode=null;
var childerCode=null;


   $(document).ready(function() {
	   //默认加载表格
	   dataTableDraw();
	   
	  //默认加载类别数
	   var lineTypeTreeUrl=$("#lineTypeTree").val();
       $.ajax({
	            url: lineTypeTreeUrl,    // 提交到controller的url路径
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
	   
   });
   
   
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
	 
	 
   var lineListUrl=$("#lineListPage").val();
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
     sAjaxSource:lineListUrl, //请求url
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
					     "mData": "lineId",
					     "visible": false
					  },
                      { "mData": "lineCode"},
                      { "mData": "lineType"},
                      { "mData": "linePrice"},
                      { "mData": "lineLength"},
					  { "mData" : "lineTime",render : function(obj) {  
					       return (getMyDate(obj));
					  }  },
					  {"mData":null,
				            render: function (data, type, row, meta){
				              var html="<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editsr('"+meta.row+"')\">查看</button>"+
				            	       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editmn('"+meta.row+"')\">修改</button>"+
				                       "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-sm oemp-privbtn' onclick=\"oemp_editzt('"+row.lineId+"')\">删除</button>"
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
	      oTime= getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen)
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
	   $("#reseted").attr("style","background-color:grey;border-color:grey");
	   $("#ok").attr("style","background-color:grey;border-color:grey");
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
		   $("#reseted").attr("style","background-color:grey;border-color:grey");
		   $("#ok").attr("style","background-color:grey;border-color:grey");
		   userForm.reset();
	   }
	   if($("#userId").val()!=null && $("#userId").val()!=""){
		   $("#userId").val(userId);
		   $("#pwd").val(password); 
		   $("#userCode").val(userCode);
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
		$("#pwd").attr("style","display:block;");
		$('#userCode').attr("disabled",false);
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
	   $("#pwd").attr("style","display:none;");
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#userId").val(data.userId);	//主键
	   $("#userCode").val(data.userCode);
	   $('#userCode').attr("disabled",true);
	   $("#userPhone").val(data.userPhone);
	   $('#userPhone').attr("disabled",true);
	   $("#userName").val(data.userName);
	   $('#userName').attr("disabled",true);
	   $("#password").val(data.password);
	   $('#password').attr("disabled",true);
	   $("#addr").val(data.addr);
	   $('#addr').attr("disabled",true);
	   $("#createTime").val(getMyDate(data.createTime));
	   $('#createTime').attr("disabled",true);
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $('#updateTime').attr("disabled",true);
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
	   $('#userCode').attr("disabled",true);
	   $("#pwd").attr("style","display:none;");
	   $('#userPhone').attr("disabled",false);
	   $('#userName').attr("disabled",false);
	   $('#addr').attr("disabled",false);
	   $('#createTime').attr("disabled",false);
	   $('#updateTime').attr("disabled",false);
	   $('#remark').attr("disabled",false);
	   $('#myModal').modal('show');
	   var data= $('#dutyListTable').DataTable().rows(Row).data()[0];
	   $("#userId").val(data.userId);
	   $("#userCode").val(data.userCode);
	   $("#userPhone").val(data.userPhone);
	   $("#userName").val(data.userName);
	   $("#password").val(data.password);
	   $("#addr").val(data.addr);
	   $("#createTime").val(getMyDate(data.createTime));
	   $("#updateTime").val(getMyDate(data.updateTime));
	   $("#remark").val(data.remark);
	   userId=$("#userId").val();
	   userCode=data.userCode;
	   userPhone=data.userPhone;
	   userName=data.userName;
	   password=data.password;
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

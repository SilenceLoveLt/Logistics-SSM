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
		.form-horizontal
		{
			margin-top: 30px;
			margin-right: 130px;
			
		}
		.form-group .row .col-sm-2 input,.form-group .row .col-sm-2 select
		{
			width:190px;
		}
		.form-group .row .btn-margin
		{
		   margin-top: 35px;
		}
		#researchTopic .form-group .row .control-label
		{
			width:100px;
		}
		#researchTopic .form-group .row .topicMargin
		{
			margin-left: 80px;
		}
		
		.btnnone{
				visibility:  hidden;
			}
		.btnlook{
				visibility:  visible;
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
		
		.restbtn
		{
			padding-right:45px;
		}
		
		.substyle
		{
		   margin-left:80px;
		}
    </style>
</head>
<body>
<input type="hidden" id="backIndexUrl" value="<%=basePath%>lineManageList/" />
<input type="hidden" id="addPageUrl" value="<%=basePath%>lineManageList/addLinePage" />
<input type="hidden" id="insertLine" value="<%=basePath%>lineManageList/insertInfo" />





<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>线路管理</a></li>
	    <li class="active">新增线路</li>
	</ol>
</div>


<!-- 导航栏开始 -->
<!-- 线路管理和新增线路 -->
	<div class="container-fluid" style="background-color: lightgrey;margin-bottom: 20px;">
		<div class="row" >
		    <div class="lk-header">
		    <form method="post" id="returnForm">
				<div class="col-sm-2" style="background-color:lightgrey;">
				   <div class="btn-style" onclick="changeColor(this)" >
				    <input type="button" id="btnstyle" style="background-color:darkgrey;line-height:50px;border-radius: 15px;" role="button" class="btn  btn-link" onclick="returnFun()" value="线路管理">
				   </div> 
				</div>
				<div class="col-sm-2" style="background-color:lightgrey ;" >	
				   <div	 class="btn-style1" onclick="changeColor2(this)">
					 <input type="button"  role="button" class="btn  btn-link" onclick="addFun()"  style="background-color:darkgrey; line-height:50px;border-radius: 15px;"  value="新增线路">
				   </div> 
				</div>

			</form>
			</div>
		</div>
	</div>
<!-- 导航栏结束 -->
<form class="form-horizontal" role="form" id="infoFormLine" name="infoFormLine" method="POST">
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineCode" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>线路代码：</label>
				<div class="col-sm-4">
					 <input type="text" class="form-control" name="lineCode" id="lineCode" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>适用类别：</label>
				<div class="col-sm-4">
					<select name="applyType" id="applyType" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
					
					</select>
				</div>
			</div>
		</div>
		<div class="container-fluid form-group">
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		</div>
		<div class="container-fluid form-group">
		<div class="row">
				<label for="lineType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>线路类型：</label>
				<div class="col-sm-4">
					<select name="lineType" id="lineType" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
						
					</select>
				</div>
				<label for="linePrice" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>线路缴费：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="linePrice" id="linePrice" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
					<span class="form-control-feedback">(元)</span>
				</div>
		</div>
		</div>
		<div class="container-fluid form-group">
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineTime" class="col-sm-2 control-label">线路用时：</label>
				<div class="col-sm-4">
					<input  name="lineTime" id="lineTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  
							onclick="WdatePicker({ dateFmt: 'HH:mm:ss ' })"  onkeyup="this.value=this.value.replace(/\s+/g,'')" oninput="check()" onmouseleave="checkInputings()" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>
				
				<label for="lineLength" class="col-sm-2 control-label">线路长度：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="lineLength" id="lineLength" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
					<span class="form-control-feedback">(km)</span>
				</div>
			</div>
		</div>
		<div class="container-fluid form-group">
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		<div class="row">
		</div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="remark" class="col-sm-2 control-label">描述：</label>
				<div class="col-sm-9">
					<textarea class="form-control" style="resize:none;"  name="remark" id="remark" onkeyup="this.value=this.value.replace(/\s+/g,'')"
						rows="2" placeholder="请输入..." oninput="check()" onmouseleave="checkInputings()"></textarea>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="row">
			<div class="btn-margin">
				<button type="button" id="resetForm" style="background-color: grey; border-color: grey;"
						class="btn btn-primary col-xs-offset-4 col-sm-2" onclick="resetLineForm()">重置</button>
				<button type="button" id="saveForm" style="background-color: grey; border-color: grey;"
						class="btn btn-primary col-xs-offset-1 col-sm-2"
					    onclick="saveLineForm();">保存</button>
			</div>	
			</div>
		</div>
		
	</form>
	
</body>


<script type="text/javascript">
var parentCode=null;
var childerCode=null;
var lineId=null;
var lineCode=null;
var lineName=null;
var lineType=null;
var linePrice=null;
var lineLength=null;
var lineTime=null;
var applyType=null;
var remark=null;
var lineTypeList = ${lineTypeList}; //车辆类型
var applyTypeList = ${applyTypeList};     //适用类型

   $(document).ready(function() {
	   
	   //表单验证
	   checkform();
	   initSelectOptions(lineTypeList, "code", "dataName", "lineType");
	   initSelectOptions(applyTypeList, "code", "dataName", "applyType");
   });
   
   /**初始化下拉框, 参数：json数据，value用到的属性名，text用到的显示值，select的id*/
	 function initSelectOptions(jsonArr, valPro, textPro, domid) {
		var opt = '';
		for(var i=0; i<jsonArr.length; i++) {
			opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
		}
		$("#" + domid).append(opt);
	} 
   
   
   //表单验证配置
   function checkform(){
   $('#infoFormLine').bootstrapValidator({
	   message: '不可用的值',
       feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
            }, 
      fields: {
    	  lineCode: {
              validators: {
                  notEmpty: {
                      message: '线路编码不能为空'
                  }
              }
          },
          lineType: {
              validators: {
                  notEmpty: {
                      message: '线路类别不能为空'
                  }
              }
          },
          linePrice: {
              validators: {
                  notEmpty: {
                      message: '线路缴费不能为空'
                  },
                  regexp: {
                      regexp: "^\\d+$",
                      message: '只能录入正整数'
                  }
              }
          },
          lineLength: {
              validators: {
                  notEmpty: {
                      message: '线路长度不能为空'
                  },
                  regexp: {
                      regexp: "^\\d+$",
                      message: '只能录入正整数'
                  }
              }
          },
          lineTime: {
              validators: {
            	  notEmpty: {
                      message: '线路用时不能为空'
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
   
   //返回题目管理页面
	function returnFun(){
	   console.info("回退");
		var url=$("#backIndexUrl").val();
		$("#returnForm").attr("action",url);
		$("#returnForm").submit();
	}
	
	//跳转到题目新增页面
	function addFun(){
		var url=$("#addPageUrl").val();
		$("#returnForm").attr("action",url);
		$("#returnForm").submit();
	}
	
	//设置跳转页面按钮置灰
	function changeColor(btn)
	{
		btn.style.backgroundColor = "darkgrey";
	}
	function changeColor2(btn)
	{
		$("#btnstyle").removeAttr("style");
		btn.style.backgroundColor = "darkgrey";
	}
    


    //重置、确定按钮置灰
    function check()
    {
      $("#saveForm").removeAttr("disabled");
      $("#saveForm").removeAttr("style");
      $("#resetForm").removeAttr("disabled");
      $("#resetForm").removeAttr("style");
    }
    function checkInputings(){
    	var lineCode=$("#lineCode").val();
		var lineType=$("#lineType").val();
		var linePrice=$("#linePrice").val();
		var lineLength=$("#lineLength").val();
		var applyType= $("#applyType").val();
		var remark=$("#remark").val();
		var lineTime=$('#lineTime').val();
		
    	if((lineCode=='')&& (linePrice=='' )&&(lineType=='')&&(lineLength=='') &&(applyType=='')&&(remark=='')&&(lineTime==''))
    	{
    		$("#saveForm").attr("disabled","true");
    	    $("#resetForm").attr("disabled","true");
    		 $("#resetForm").attr("style","background-color:grey;border-color:grey");
    		 $("#saveForm").attr("style","background-color:grey;border-color:grey");
    		
        }else{
        	check();
        }
    }
	
  //设置表单重置
	   function resetLineForm()
	   {
			$("#lineCode").val("");
			$("#lineType").val(""); 
			$("#lineTime").val("");
			$("#linePrice").val("");
			$("#lineLength").val("");
			$("#applyType").val("");
			$("#remark").val("");
			$("#saveForm").attr("disabled","true");
	 	    $("#resetForm").attr("disabled","true");
	 		$("#resetForm").attr("style","background-color:grey;border-color:grey");
	 		$("#saveForm").attr("style","background-color:grey;border-color:grey");
			//清除表单验证
			 $("#infoFormLine").data('bootstrapValidator').destroy();
			 $('#infoFormLine').data('bootstrapValidator',null);
			//表单验证配置
			 checkform();
	   }
	 
	 
	 
	/**表单提交事件*/
	function saveLineForm() {
		var bootstrapValidator = $("#infoFormLine").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertLine").val();
			$.post(createUrl, $("#infoFormLine").serialize(), function(data) {
				if (data.result=='true') {
					$.alert({
		                title: '提示',
		                content: '线路保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#infoFormLine").data('bootstrapValidator').resetForm();
							         $('#infoFormLine')[0].reset();
							         $("#saveForm").attr("disabled","true");
		                        }
		                    }
		                }
		            });
				}
				if (data.result=='repeat') {
					$.alert({
		                title: '提示',
		                content: '线路代码不能重复！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary'
		                    }
		                }
		            });
				}
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content: '线路保存失败！',
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

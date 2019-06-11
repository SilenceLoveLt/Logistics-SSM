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
		.myinput{
		    border: none;
		    background-color: lightgrey;
		    text-align: center;
		    margin-left: 0px;
		    line-height: 59px;
		    font-size: 18px;
		    font-family: fantasy;
		    width: 280px;
		}
		.form-group{
		margin-bottom: 30px;
		}
    </style>
</head>
<body>
<input type="hidden" id="insertInvoice" value="<%=basePath%>invoiceManageList/insertInfo" />
<input type="hidden" id="selectGoodsCode" value="<%=basePath%>goodsManageList/selectGoodsByOrder" />


<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>配送管理</a></li>
	    <li class="active">生成配送单 
	    </li>
	</ol>
</div>
<!-- 生成配送单start -->
<div class="container-fluid" style="background-color: lightgrey;margin-bottom: 20px;">
		<div class="row" >
		    <div class="lk-header">
				<div class="col-sm-2" style="background-color:lightgrey ;" >	
				   <div	 class="btn-style1" onclick="changeColor2(this)">
					 <input type="text" style="" class="myinput" value="请填写生成配送单信息   : ">
				   </div> 
				</div>
			</div>
		</div>
	</div>
<!-- 导航栏结束 -->


<form class="form-horizontal" role="form" id="infoFormInvoice" name="infoFormInvoice" method="POST">
		<div class="container-fluid form-group">
			<div class="row">
			    <label for="orderId" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>订单编号：</label>
				<div class="col-sm-4">
					 <input type="text" class="form-control" name="orderId" id="orderId" oninput="check()" onchange="selectGoods()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				
			    <label for="goodsId" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物编码：</label>
				<div class="col-sm-4">
					 <input type="text" class="form-control" readonly= "true "  name="goodsId" id="goodsId" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
		
		
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineId" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>所属线路：</label>
				<div class="col-sm-4">
					 <select name="lineId" id="lineId" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
					</select>
				</div>
				<label for="vehicleId" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>所属车辆：</label>
				<div class="col-sm-4">
					  <select name="vehicleId" id="vehicleId" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
					</select>
				</div>
				
			</div>
		</div>
		
		
		<div class="container-fluid form-group">
			<div class="row">
				
				<label for="empId" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>配送员：</label>
				<div class="col-sm-4">
				<select name="empId" id="empId" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
					</select>
				</div>
				<label for="addrNow" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>当前地址：</label>
				<div class="col-sm-4">
					 <input type="text" class="form-control" name="addrNow" id="addrNow" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
		
		<!-- 
		<div class="container-fluid form-group">
		    <div class="row">
				<label for="startTime" class="col-sm-2 control-label"><span style="color:red; font-weight:bold;">*</span>开始时间：</label>
				<div class="col-md-4  has-feedback"  >
							<input  name="startTime" id="startTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>
				
				<label for="endTime" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>结束时间：</label>
				<div class="col-sm-4  has-feedback">
					<input  name="endTime" id="endTime" type="text" placeholder="精确到年月日时分秒"  class="form-control Wdate input-sm "  
							onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })"  onkeyup="this.value=this.value.replace(/\s+/g,'')" oninput="check()" onmouseleave="checkInputings()" /> 
                            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
				</div>
		     </div>
		</div> -->
		
		
		<div class="container-fluid form-group"  style="margin-bottom: -5px">
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
						class="btn btn-primary col-xs-offset-4 col-sm-2" onclick="resetInvoiceForm()">重置</button>
				<button type="button" id="saveForm" style="background-color: grey; border-color: grey;"
						class="btn btn-primary col-xs-offset-1 col-sm-2"
					    onclick="saveInvoiceForm();">生成配送单</button>
			</div>	
			</div>
		</div>
		
	</form>
</body>
<script type="text/javascript">
var goodsId = null; 
var empList =${empList};             //配送员类型
var lineList =${lineList};           //线路类型
var vehicleList =${vehicleList};     //车辆类型


   $(document).ready(function() {
	   //表单验证
	   checkform();
	   
	   initSelectOptions(vehicleList, "vehicleId", "vehicleName", "vehicleId");
	   initSelectOptions(lineList, "lineId", "lineCode", "lineId");
	   initSelectOptions(empList, "empId", "empName", "empId");
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
 $('#infoFormInvoice').bootstrapValidator({
	   message: '不可用的值',
     feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
          }, 
    fields: {
    	orderId: {
            validators: {
                notEmpty: {
                    message: '订单编号不能为空'
                }
            }
        },
        goodsId: {
            validators: {
                notEmpty: {
                    message: '货物编码不能为空'
                }
            }
        },
        lineId: {
            validators: {
                notEmpty: {
                    message: '所属线路不能为空'
                }
            }
        },
        empId: {
            validators: {
                notEmpty: {
                    message: '配送员不能为空'
                }
            }
        },
        vehicleId: {
            validators: {
          	  notEmpty: {
                    message: '所属车辆不能为空'
                }
            }
        },
        addrNow: {
            validators: {
          	  notEmpty: {
                    message: '当前地址不能为空'
                }
            }
        }/* ,
        startTime: {
            validators: {
          	  notEmpty: {
                    message: '开始时间不能为空'
                }
            }
        },
        endTime: {
            validators: {
          	  notEmpty: {
                    message: '结束时间不能为空'
                }
            }
        }, */
    }
  });
 }  
 
	/* 动态获取货物编号信息 */
  function selectGoods(){
	  var orderId = document.getElementById("orderId").value;
	  var selectUrl = $("#selectGoodsCode").val();
		$.post(selectUrl, {"orderId": orderId}, function(data) {
			$("#infoFormInvoice #goodsId").val(data.goodsCode);
			}, 'json' );
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
  	    var orderId=$("#orderId").val();
		var goodsId=$("#goodsId").val();
		var lineId=$("#lineId").val();
		var empId=$("#empId").val();
		var vehicleId= $("#vehicleId").val();
		var addrNow=$("#addrNow").val();
		/* var startTime=$("#startTime").val();
		var endTime=$("#endTime").val(); */
		var remark=$('#remark').val();
		
  	if((orderId=='')&& (goodsId=='' )&&(lineId=='')&&(empId=='') &&(vehicleId=='')&&(addrNow=='')&&(remark==''))
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
	   function resetInvoiceForm()
	   {
			$("#orderId").val("");
			$("#goodsId").val(""); 
			$("#lineId").val("");
			$("#empId").val("");
			$("#vehicleId").val("");
			$("#addrNow").val("");
			/* $("#startTime").val("");
			$("#endTime").val("");  */
			$("#remark").val("");
			$("#saveForm").attr("disabled","true");
	 	    $("#resetForm").attr("disabled","true");
	 		$("#resetForm").attr("style","background-color:grey;border-color:grey");
	 		$("#saveForm").attr("style","background-color:grey;border-color:grey");
			//清除表单验证
			 $("#infoFormInvoice").data('bootstrapValidator').destroy();
			 $('#infoFormInvoice').data('bootstrapValidator',null);
			//表单验证配置
			 checkform();
	   }
	 
	 
	 
	/**表单提交事件*/
	function saveInvoiceForm() {
		var bootstrapValidator = $("#infoFormInvoice").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertInvoice").val();
			console.info("createUrl"+createUrl);
			$.post(createUrl, $("#infoFormInvoice").serialize(), function(data) {
				if (data.result=='true') {
					$.alert({
		                title: '提示',
		                content: '配送单已生成！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#infoFormInvoice").data('bootstrapValidator').resetForm();
							         $('#infoFormInvoice')[0].reset();
							         $("#saveForm").attr("disabled","true");
		                        }
		                    }
		                }
		            });
				}
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content: '配送单生成失败！',
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
		                content: '该订单已发货，清重新输入！',
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

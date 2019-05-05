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
<input type="hidden" id="insertOrder" value="<%=basePath%>orderManageList/insertInfo" />





<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li><a>订单管理</a></li>
	    <li class="active">新增订单</li>
	</ol>
</div>


<!-- 导航栏开始 -->
<!-- 新增订单 -->
	<div class="container-fluid" style="background-color: lightgrey;margin-bottom: 20px;">
		<div class="row" >
		    <div class="lk-header">
				<div class="col-sm-2" style="background-color:lightgrey ;" >	
				   <div	 class="btn-style1" onclick="changeColor2(this)">
					 <input type="text" style="" class="myinput" value="请填写以下需提交审核订单信息   : ">
				   </div> 
				</div>
			</div>
		</div>
	</div>
<!-- 导航栏结束 -->


<form class="form-horizontal" role="form" id="infoFormOrder" name="infoFormOrder" method="POST">
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineCode" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货人姓名：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="userName" id="userName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货地址：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="shippAddre" id="shippAddre" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				
				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货人电话：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="shippPhone" id="shippPhone" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineCode" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物编码：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="goodsCood" id="goodsCood" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物类型：</label>
				<div class="col-sm-2">
				<select name="goodsType" id="goodsType" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
						<option value="0">高速</option>
						<option value="1">弯路</option>
					</select>
				</div>
				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物名称：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="goodsName" id="goodsName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
	
		<div class="container-fluid form-group">
		<div class="row">
				<label for="lineType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物重量：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="goodsWeight" id="goodsWeight" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				<label for="linePrice" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物体积：</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="goodsVolume" id="goodsVolume" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				<label for="linePrice" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物数量：</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="goodsNum" id="goodsNum" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
		     </div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineCode" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货人姓名：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="consigneeName" id="consigneeName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货地址：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="receAddr" id="receAddr" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				
				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货人电话：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="recePhone" id="recePhone" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="lineCode" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>付款方式：</label>
				<div class="col-sm-2">
					<select name="payMethod" id="payMethod" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
						<option value="0">高速</option>
						<option value="1">弯路</option>
					</select>
				</div>

				<label for="applyType" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>合计运费：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="freight" id="freight" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
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
						class="btn btn-primary col-xs-offset-4 col-sm-2" onclick="resetOrderForm()">重置</button>
				<button type="button" id="saveForm" style="background-color: grey; border-color: grey;"
						class="btn btn-primary col-xs-offset-1 col-sm-2"
					    onclick="saveOrderForm();">保存</button>
			</div>	
			</div>
		</div>
		
	</form>
	
</body>


<script type="text/javascript">

   $(document).ready(function() {
	   
	   //表单验证
	   checkform();
	   
   });
   
   //表单验证配置
   function checkform(){
   $('#infoFormOrder').bootstrapValidator({
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
                      message: '发货人姓名不能为空'
                  }
              }
          },
          shippAddre: {
              validators: {
                  notEmpty: {
                      message: '发货地址不能为空'
                  }
              }
          },
          shippPhone: {
              validators: {
                  notEmpty: {
                      message: '发货人电话不能为空'
                  },
                  regexp: {
                      regexp: "^\\d+$",
                      message: '只能录入正整数'
                  }
              }
          },
          payMethod: {
              validators: {
                  notEmpty: {
                      message: '支付方式不能为空'
                  }
              }
          },
          goodsCood: {
              validators: {
            	  notEmpty: {
                      message: '货物代码不能为空'
                  }
              }
          },
          goodsName: {
              validators: {
            	  notEmpty: {
                      message: '货物名字不能为空'
                  }
              }
          },
          goodsType: {
              validators: {
            	  notEmpty: {
                      message: '货物类别不能为空'
                  }
              }
          },
          goodsWeight: {
              validators: {
            	  notEmpty: {
                      message: '货物重量不能为空'
                  }
              }
          },
          goodsVolume: {
              validators: {
            	  notEmpty: {
                      message: '货物体积不能为空'
                  }
              }
          },
          goodsNum: {
              validators: {
            	  notEmpty: {
                      message: '货物数量不能为空'
                  }
              }
          },
          consigneeName: {
              validators: {
            	  notEmpty: {
                      message: '收货人姓名不能为空'
                  }
              }
          },
          receAddr: {
              validators: {
            	  notEmpty: {
                      message: '收货地址不能为空'
                  }
              }
          },
          recePhone: {
              validators: {
            	  notEmpty: {
                      message: '收货人电话不能为空'
                  },
                  regexp: {
                      regexp: "^\\d+$",
                      message: '只能录入正整数'
                  }
              }
          },
      }
    });
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
    	var userName=$("#userName").val();
		var shippAddre=$("#shippAddre").val();
		var shippPhone=$("#shippPhone").val();
		var payMethod=$("#payMethod").val();
		var goodsCood= $("#goodsCood").val();
		var goodsName=$("#goodsName").val();
		var goodsType=$("#goodsType").val();
		var freight=$("#freight").val();
		var goodsWeight=$("#goodsWeight").val();
		var goodsVolume=$("#goodsVolume").val();
		var goodsNum=$("#goodsNum").val();
		var consigneeName=$('#consigneeName').val();
		var receAddr=$('#receAddr').val();
		var recePhone=$('#recePhone').val();
		var remark=$('#remark').val();
		
    	if((userName=='')&& (shippAddre=='' )&&(shippPhone=='')&&(payMethod=='') &&(goodsCood=='')&&(goodsName=='')&&(goodsType=='')&&
    		(freight=='')&& (goodsWeight=='' )&&(goodsVolume=='')&&(goodsNum=='') &&(consigneeName=='')&&(receAddr=='')&&(recePhone=='') &&(remark==''))
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
	   function resetOrderForm()
	   {
			$("#userName").val("");
			$("#shippAddre").val(""); 
			$("#shippPhone").val("");
			$("#payMethod").val("");
			$("#goodsCood").val("");
			$("#goodsName").val("");
			$("#goodsType").val("");
			$("#freight").val(""); 
			$("#goodsWeight").val("");
			$("#goodsVolume").val("");
			$("#goodsNum").val("");
			$("#consigneeName").val("");
			$("#recePhone").val("");
			$("#receAddr").val(""); 
			$("#remark").val("");
			$("#saveForm").attr("disabled","true");
	 	    $("#resetForm").attr("disabled","true");
	 		$("#resetForm").attr("style","background-color:grey;border-color:grey");
	 		$("#saveForm").attr("style","background-color:grey;border-color:grey");
			//清除表单验证
			 $("#infoFormOrder").data('bootstrapValidator').destroy();
			 $('#infoFormOrder').data('bootstrapValidator',null);
			//表单验证配置
			 checkform();
	   }
	 
	 
	 
	/**表单提交事件*/
	function saveOrderForm() {
		var bootstrapValidator = $("#infoFormOrder").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertOrder").val();
			$.post(createUrl, $("#infoFormOrder").serialize(), function(data) {
				if (data.result=='true') {
					$.alert({
		                title: '提示',
		                content: '下单成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ //这里写点击按钮回调函数
		                        	 $("#infoFormOrder").data('bootstrapValidator').resetForm();
							         $('#infoFormOrder')[0].reset();
							         $("#saveForm").attr("disabled","true");
		                        }
		                    }
		                }
		            });
				}
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content: '下单失败！',
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

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
		.pre-scrollable {
		    max-height: 550px;
		    overflow-y: scroll;
		    overflow-x: hidden;
		}
		.form-horizontal .has-feedback .form-control-feedback {
		    right: -4px;
		}
    </style>
</head>
<body >
<input type="hidden" id="insertOrder" value="<%=basePath%>orderManageList/insertInfo" />
<input type="hidden" id="insertGoods" value="<%=basePath%>goodsManageList/insertInfo" />




<div class="container-fluid">
	<ol class="breadcrumb">
	    <li><a>Home</a></li>
	    <li class="active">订单管理</li>
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

<div class="container-fluid form-group">
	<div class="row pre-scrollable">
		<form class="form-horizontal" role="form" id="infoFormOrder" name="infoFormOrder" method="POST">
		
		<input type="hidden" name="" id="orderId" class="orderId" /> 
		<input type="hidden" name="invoiceStatus" id="invoiceStatus"  /> 
	　　　<input type="hidden" name="status" id="status"  /> 
		<input type="hidden" name="createTime" id="createTime" />
		<input type="hidden" name="updateTime" id="updateTime" /> 
		<div class="container-fluid form-group">
			<div class="row ">
				<label for="userName" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货人姓名：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="userName" id="userName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="shippAddre" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货地址：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="shippAddre" id="shippAddre" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				
				<label for="shippPhone" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>发货人电话：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="shippPhone" id="shippPhone" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
	
		
		<div class="container-fluid form-group">
			<div class="row">
				<label for="consigneeName" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货人姓名：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="consigneeName" id="consigneeName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="receAddr" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货地址：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="receAddr" id="receAddr" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
				
				<label for="recePhone" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>收货人电话：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="recePhone" id="recePhone" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>
		<div class="container-fluid form-group">
			<div class="row">
				<label for="payMethod" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>付款方式：</label>
				<div class="col-sm-2">
					<select name="payMethod" id="payMethod" class="form-control"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
					</select>
				</div>

				<label for="freight" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>合计运费：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control" name="freight" id="freight" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				     <span class="form-control-feedback" style="padding-left: 30px;">(元)</span>
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
		
		
		
		<!--货物信息  -->
		  <div class="container" style="margin-left: -20px;">
		  
		  <!--  phone 属于每个选项的一个DIV-->
		  <div class="Goods phone" style="display:block; margin-left: -35px;" id="Goods">
		  
		  	<input type="hidden" name="goodsId" class="goodsId" /> 
		  
            <div class="container-fluid form-group">
				<div class="row">
					<label for="description" class="col-sm-2 control-label">请填写货物信息：</label>
				</div>
			</div>

		<div class="container-fluid form-group">
			<div class="row">
				<label for="goodsCood" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物编码：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control goodsCood" name="goodsCood" id="goodsCood" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>

				<label for="goodsType" class="col-sm-2 control-label" style=" margin-left: -32px;"><span
					style="color: red; font-weight: bold;">*</span>货物类型：</label>
				<div class="col-sm-2">
				<select name="goodsType" id="goodsType" class="form-control goodsType"    oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')">
						<option value="">请选择</option>
						<option value="1">食品类</option>
						<option value="2">服装类</option>
						<option value="3">鞋帽类</option>
						<option value="5">家具类</option>
						<option value="6">纺织品类</option>
						<option value="4">日用品类</option>
					</select>
				</div>
				<label for="goodsName" class="col-sm-2 control-label " style=" margin-left: -32px;"><span
					style="color: red; font-weight: bold;">*</span>货物描述：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control goodsName" name="goodsName" id="goodsName" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
			</div>
		</div>

			
	  <div class="container-fluid form-group">
		  <div class="row">
				<label for="goodsWeight" class="col-sm-2 control-label"><span
					style="color: red; font-weight: bold;">*</span>货物重量：</label>
				<div class="col-sm-2">
					 <input type="text" class="form-control goodsWeight" name="goodsWeight" id="goodsWeight" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
					 <span class="form-control-feedback">(g)</span>
				
				</div>
				<label for="goodsVolume" class="col-sm-2 control-label" style=" margin-left: -32px;"><span
					style="color: red; font-weight: bold;">*</span>货物体积：</label>
				<div class="col-sm-2">
					<input type="text" class="form-control goodsVolume" name="goodsVolume" id="goodsVolume" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
					 <span class="form-control-feedback">(cm³)</span>
				</div>
				<label for="goodsNum" class="col-sm-2 control-label" style=" margin-left: -32px;"><span
					style="color: red; font-weight: bold;">*</span>货物数量：</label>
				<div class="col-sm-2">
					<input type="text" class="form-control goodsNum" name="goodsNum" id="goodsNum" oninput="check()" onmouseleave="checkInputings()" onkeyup="this.value=this.value.replace(/\s+/g,'')" placeholder="请输入..." />
				</div>
		     </div>
		</div>
			 <div class="container-fluid form-group"> 
			<div class="row">
				<label for="remark" class="col-sm-2 control-label">货物备注：</label>
				<div class="col-sm-8">
					<textarea class="form-control goodsRemark" oninput="check()" id="goodsRemark"  onmouseleave="checkInputings()" style="resize:none;" name="remark" onkeyup="this.value=this.value.replace(/\s+/g,'')"
						rows="2" placeholder="请输入..."></textarea>
				</div>
			</div>	
			</div>
			
			
			
				<div class="col-sm-1 col-md-offset-1" style="margin-top: -83px;margin-left: 985;">
						 <button class="btn add" onclick="creDiv(this)" >添加</button>
			    </div>
				<div id="delnone" class="col-sm-1 col-md-offset-1" style="margin-top: -83px;margin-left: 985px;">
						 <button class="btn ddd" onclick="delDiv(this)" >删除</button>
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
					    onclick="saveOrderForm();">确认订单</button>
			</div>	
			</div>
		</div>
		
	</form>
</div>
</div>	
</body>


<script type="text/javascript">
var orderId=null;
var payMethodList = ${payMethodList};     //付款方式

   $(document).ready(function() {
	   
	   //表单验证
	   checkform();
	   initSelectOptions(payMethodList, "code", "dataName", "payMethod");
   });
   
   /**初始化下拉框, 参数：json数据，value用到的属性名，text用到的显示值，select的id*/
	 function initSelectOptions(jsonArr, valPro, textPro, domid) {
		var opt = '';
		for(var i=0; i<jsonArr.length; i++) {
			opt += '<option value="' + jsonArr[i][valPro] + '">' + jsonArr[i][textPro] + '</option>';
		}
		$("#" + domid).append(opt);
	} 
   
   
   
   /* 计算运费 */ 
   var infoFormOrder=document.forms['infoFormOrder'],
     goodsWeight=infoFormOrder.elements['goodsWeight'];
     goodsVolume=infoFormOrder.elements['goodsVolume'];
     goodsNum=infoFormOrder.elements['goodsNum'];
     //无需设置input的id属性，只设置name即可
     var weight="";
     var volume="";
     var num=""; 
     goodsWeight.onchange=function(){
    	 weight+=goodsWeight.value;
    	 console.log(weight);
     }
    /*  goodsVolume.onchange=function(){
    	 goodsVolume+=goodsVolume.value;
     }
     goodsNum.onchange=function(){
    	 goodsNum+=goodsNum.value;
     }  */
    
     
   
   
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
                  },
                	 regexp: {
                         regexp: "^[0-9]*[1-9][0-9]*$",
                         message: '只能录入非零正整数'
                     }
              }
          },
          goodsVolume: {
              validators: {
            	  notEmpty: {
                      message: '货物体积不能为空'
                  },
                	 regexp: {
                         regexp: "^[0-9]*[1-9][0-9]*$",
                         message: '只能录入非零正整数'
                     }
              }
          },
          goodsNum: {
              validators: {
            	  notEmpty: {
                      message: '货物数量不能为空'
                  },
                	 regexp: {
                         regexp: "^[0-9]*[1-9][0-9]*$",
                         message: '只能录入非零正整数'
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
		var goodsType=$(".goodsType").val();
		var freight=$("#freight").val();
		var consigneeName=$('#consigneeName').val();
		var receAddr=$('#receAddr').val();
		var recePhone=$('#recePhone').val();
		var remark=$('#remark').val();
    	if((userName=='')&& (shippAddre=='' )&&(shippPhone=='')&&(payMethod=='') &&(freight=='')&&(consigneeName=='')&&(receAddr=='')&&(recePhone=='') &&(remark==''))
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
			$("#freight").val(""); 
			$(".goodsCood").val("");
			$(".goodsName").val("");
			$(".goodsType").val("");
			$(".goodsWeight").val("");
			$(".goodsVolume").val("");
			$(".goodsNum").val("");
			$(".goodsRemark").val("");
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
	 
	 
	 
	/**表单提交事件——订单*/
	function saveOrderForm() {
		var bootstrapValidator = $("#infoFormOrder").data('bootstrapValidator');
		//获取表单验证结果
		var validateResult = bootstrapValidator.validate().isValid();
		if(validateResult){
			var createUrl = $("#insertOrder").val();
			$.post(createUrl,{"orderId":$("#orderId").val(),"userName":$("#userName").val(),"shippAddre":$("#shippAddre").val(),"shippPhone":$("#shippPhone").val(),
				"payMethod":$("#payMethod").val(),"freight":$("#freight").val(),"consigneeName":$('#consigneeName').val(),
				"recePhone":$('#recePhone').val(),"receAddr":$('#receAddr').val(),"remark":$('#remark').val()} , function(data) {
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
		                        	orderId=$("#infoFormOrder #orderId").val()//这里写点击按钮回调函数
			                        submitHandlerH(orderId);
		                        }
		                    }
		                }
		            });
					$("#infoFormOrder #orderId").val(data.orderId);
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
	/**表单提交事件——货物*/
	function submitHandlerH(orderId) {
		console.info("orderId:"+orderId);
    		var url=$("#insertGoods").val();
			var str="";
			console.info("url:"+url);	
		for(var l=0;l<$(".phone").length;l++)
		  {
				str=str+"orderId:"+orderId+
				",goodsCood:"+$($(".container").children(".phone")[l]).find(".goodsCood").val()+
				",goodsName:"+$($(".container").children(".phone")[l]).find(".goodsName").val()+
				",goodsType:"+$($(".container").children(".phone")[l]).find(".goodsType").val()+
				",goodsWeight:"+$($(".container").children(".phone")[l]).find(".goodsWeight").val()+
				",goodsVolume:"+$($(".container").children(".phone")[l]).find(".goodsVolume").val()+
				",goodsNum:"+$($(".container").children(".phone")[l]).find(".goodsNum").val()+
				",goodsRemark:"+$($(".container").children(".phone")[l]).find(".goodsRemark").val()+",;"
			}
			$.post(url, {"str":str}, function(data) {
				console.log(str);
			
				if (data.result == 'true') {
					$.alert({
		                title: '提示',
		                content: '货物保存成功！',
		                type:'green',             //一般危险操作用red,保存成功操作green
		                buttons: {              //定义按钮
		                    confirm: {
		                        text: '确认',
		                        btnClass: 'btn-primary',
		                        action: function(){ 
		                        
		                        }
		                    }
		                }
		            });
                        $("#infoFormOrder").data('bootstrapValidator').resetForm();
                        $('#infoFormOrder')[0].reset();
                        $("#saveForm").attr("disabled","true");
			}
				if (data.result == 'repeat'){
					$.alert({
	                    title: '提示',
	                    content: '该货物编码重复！取消以保存的货物',
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
				if (data.result=='false') {
					$.alert({
		                title: '提示',
		                content: '货物保存失败！',
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
				    $("#infoFormOrder").data('bootstrapValidator').resetForm();
                    $('#infoFormOrder')[0].reset();
                    $("#saveForm").attr("disabled","true");
			}
			
			}, 'json');
		   
}
	
	
	
	/* 货物添加删除 */
	//先设置  删除  选项为隐藏
	 $("#delnone").hide();
    function creDiv(that){
   	var divnew=  
   	"<div class=\"phone\" style=\"margin-left: -35px;\">\n"+ 
   	"<input type=\"hidden\" name=\"goodsId\" class=\"goodsId\" /> \n"+
   	"<div class=\"container-fluid form-group\" >\n"+
		"<div class=\"row\">\n"+
		"	<label for=\"description\" class=\"col-sm-2 control-label\">请填写货物信息：</label>\n"+
		"</div>\n"+
	"</div>\n"+
   	"     <div class=\" container-fluid form-group\">\n" +
   	"        <div class=\"row\">\n" +
   	"            <label for=\"goodsCood\" class=\"col-sm-2 control-label\" style=\" margin-left: -9px;\">货物编码:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t        <input type=\"text\" class=\"form-control goodsCood \" name=\"goodsCood\" oninput=\"check()\" onmouseleave=\"checkInputings()\" placeholder=\"请输入...\" aria-describedby=\"sizing-addon2\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
   	"\t\t\t      </div>\n" +
   	"            <label for=\"goodsType\" class=\"col-sm-2 control-label\" style=\" margin-left: -32px;\">货物类型:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t        <select name=\"goodsType\" id=\"goodsType\" class=\"form-control\" oninput=\"check()\" onmouseleave=\"checkInputings()\"  onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
	"\t\t\t             <option value=\"\">请选择</option>\n" +
	"\t\t\t				<option value=\"1\">食品类</option>\n"+
	"\t\t\t				<option value=\"1\">服装类</option>\n"+
	"\t\t\t				<option value=\"1\">鞋帽类</option>\n"+
	"\t\t\t				<option value=\"1\">家具类</option>\n"+
	"\t\t\t				<option value=\"1\">纺织品类</option>\n"+
	"\t\t\t				<option value=\"1\">日用品类</option>\n"+
	"\t\t\t\t        </select>\n" +
   	"\t\t\t      </div>\n" +
   	"            <label for=\"goodsName\" class=\"col-sm-2 control-label\" style=\" margin-left: -32px;\">货物描述:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t        <input type=\"text\" class=\"form-control goodsName \" name=\"goodsName\" oninput=\"check()\" onmouseleave=\"checkInputings()\"  placeholder=\"请输入...\" aria-describedby=\"sizing-addon2\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
   	"\t\t\t      </div>\n" +
   	"        </div>\n" +
   	"    </div>\n" +
   	"\n" +
   	
    "     <div class=\" container-fluid form-group\">\n" +
   	"        <div class=\"row\">\n" +
   	"            <label for=\"goodsWeight\" class=\"col-sm-2 control-label\" style=\" margin-left: -9px;\">货物重量:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t        <input type=\"text\" class=\"form-control goodsWeight \" name=\"goodsWeight\" oninput=\"check()\" onmouseleave=\"checkInputings()\" placeholder=\"请输入...\" aria-describedby=\"sizing-addon2\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
	"\t\t\t\t       <span class=\"form-control-feedback\">(g)</span>\n" +
   	"\t\t\t      </div>\n" +
   	"            <label for=\"goodsVolume\" class=\"col-sm-2 control-label\" style=\" margin-left: -32px;\">货物体积:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t       <input type=\"text\" class=\"form-control goodsVolume \" name=\"goodsVolume\" oninput=\"check()\" onmouseleave=\"checkInputings()\" placeholder=\"请输入...\" aria-describedby=\"sizing-addon2\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
   	"\t\t\t\t       <span class=\"form-control-feedback\">(cm³)</span>\n" +
   	"\t\t\t      </div>\n" +
   	"            <label for=\"goodsNum\" class=\"col-sm-2 control-label\" style=\" margin-left: -32px;\">货物数量:</label>\n" +
   	"            <div class=\"col-sm-2\">\n" +
   	"\t\t\t\t        <input type=\"text\" class=\"form-control goodsNum \" name=\"goodsNum\" oninput=\"check()\" onmouseleave=\"checkInputings()\" placeholder=\"请输入...\" aria-describedby=\"sizing-addon2\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\">\n" +
   	"\t\t\t      </div>\n" +
   	"        </div>\n" +
   	"    </div>\n" +
   	"\n" +
   	" <div class=\"container-fluid form-group\">\n"+
		"	<div class=\"row\">\n"+
		"	<label for=\"remark\" class=\"col-sm-2 control-label\" >货物备注：</label>\n"+
		"\t\t\t	<div class=\"col-sm-8\">\n"+
		"\t\t\t		<textarea class=\"form-control goodsRemark\" id=\"goodsRemark\" style=\"resize:none; width:764px;\" oninput=\"check()\" onmouseleave=\"checkInputings()\" name=\"remark\" rows=\"2\" placeholder=\"请输入...\" onkeyup=\"this.value=this.value.replace(/\s+/g,'')\"></textarea>\n"+
		"\t\t\t	</div>\n"+
		"</div>	\n"+
		"</div>\n"+
   	"<div class=\"col-sm-1 col-md-offset-1\" style=\"margin-top: -60px;margin-left: 985px;\">\n"+
		"<button class=\"btn add\" onclick=\"creDiv(this)\" >添加</button>\n"+
       "</div>\n"+
       "<div class=\"col-sm-1 col-md-offset-1\" style=\"margin-top:-105px;margin-left: 985px;\">\n"+
       "<button class=\"btn ddd\" onclick=\"delDiv(this)\" >删除</button>\n"+
        "</div>\n"+
       /* "</div>\n"+ */
   	"</div>"; 
   	//隐藏添加按钮
    	$(that).addClass("btnnone");
   	//设置添加按钮不可点击
 	    $(that).prop("disabled",true);
   	$(".container").append(divnew);
   	//删除按钮可见
   	$("#delnone").show();
   	//移除删除按钮不可见
   	$(".container").children(".phone:first").find(".ddd").removeClass("btnnone");

    
    
   	//选项值验证
   	$('#infoFormOrder').bootstrapValidator('addField', 'goodsCood',{
            validators: {
          	  notEmpty: {
                    message: '货物编码不能为空'
                }
            }
       });
		$('#infoFormOrder').bootstrapValidator('addField', 'goodsType',{
	            validators: {
	          	  notEmpty: {
	                    message: '货物类型不能为空'
	                }
	            }
	     
	 });
		
		$('#infoFormOrder').bootstrapValidator('addField', 'goodsWeight',{
			 validators: {
				 notEmpty: {
	                    message: '货物重量不能为空'
	                },
               	 regexp: {
                        regexp: "^[0-9]*[1-9][0-9]*$",
                        message: '只能录入非零正整数'
                    }
                }
	 });
		
		
		$('#infoFormOrder').bootstrapValidator('addField', 'goodsVolume',{
			 validators: {
					 notEmpty: {
		                    message: '货物体积不能为空'
		                },
               	 regexp: {
                        regexp: "^[0-9]*[1-9][0-9]*$",
                        message: '只能录入非零正整数'
                    }
                }
	 });
		
		
		$('#infoFormOrder').bootstrapValidator('addField', 'goodsNum',{
				 validators: {
						 notEmpty: {
			                    message: '货物数量不能为空'
			                },
               	 regexp: {
                        regexp: "^[0-9]*[1-9][0-9]*$",
                        message: '只能录入非零正整数'
                    }
                }
	 });
		
   
   }
       function delDiv(that){
       	 $(that).prop("disabled",true);
       	 $.alert({
               title: '提示',
               content: '是否要删除该货物信息数据？',
               type:'red',             //一般危险操作用red,保存成功操作green
               buttons: {              //定义按钮
                  ok: {
                       text: '确认',
                       btnClass: 'btn-primary',
                       action: function(){ //这里写点击按钮回调函数 
                       	$(that).parent().parent().remove();
           
                       			
                       	$(".container").children(".phone:last").find(".add").removeClass("btnnone");
                       	$(".container").children(".phone:last").find(".add").prop("disabled",false);
                       	
                       	 if($(".container").children(".phone").length==1){
                       		 $(".container").children(".phone:first").find(".ddd").addClass("btnnone");
                       	 }
                       },
                      
       	           error : function() {
							$.alert({
							    title: '提示',
							    content: '删除失败，如有问题请联系管理员！',
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
		              }	//error
                      
                   },
                   cancel: {
		                   text: '关闭',
		                   action: function(){ //取消按钮回调
		                	   $(that).prop("disabled",false);
		                   }
		               }
               }
       
           }); 
       }
</script>
</html>

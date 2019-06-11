<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="en">

    <head>
	    <base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>login</title>


		<script src="<%=basePath%>static/js/jquery.js"></script> 
		<!-- CSS -->
		<link rel="stylesheet" href="<%=basePath%>static/bootstrap/jquery-confirm/css/jquery-confirm.css">
		<script src="<%=basePath%>static/bootstrap/jquery-confirm/js/jquery-confirm.js"></script>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/css/form-elements.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/css/style.css">
        <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrapValidator/css/bootstrapValidator.min.css">
        <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
        
       <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=basePath%>static/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" type="text/css"  href="<%=basePath%>static/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-57-precomposed.png">

        <!-- Javascript -->
        <%-- <script type="text/javascript" src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js" ></script> --%>
        <script type="text/javascript" src="<%=basePath%>static/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>static/assets/js/jquery.backstretch.min.js"></script> 
        <script type="text/javascript" src="<%=basePath%>static/assets/js/scripts.js?ver=1"></script>
        <style type="text/css">
	        .button1{
	        padding-bottom: 15px;
	        margin-left: 0px;
	        }
	        .button2{
	        padding-top: 10px;
	        }
	        .inputcode{
	        display:block;
	        margin-right: 100px;
	        width:380px;
	        }
	        .form-control{
	        height:50px;
	        }
        </style>

    </head>

 <body>
<input type="hidden" id="loginUrl" value="<%=basePath%>loginManage/loginUrl" />
<input type="hidden" id="regisUrl" value="<%=basePath%>loginManage/regisUrl"/>
    
    
    
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                        	<span class="logo"></span>
                            <h1>Welcome to Logistics Management Platform</h1>
                            <div class="description">
                            	<p>
	                            	Please choose to register or login.
                            	</p>
                            </div>
                            <div class="top-big-link">
                            	<a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-sign-up">Sign Up</a>
                                 <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-sign-in">Sign In</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <!-- 注册——MODAL -->
        <div class="modal fade" id="modal-sign-up" tabindex="-1" role="dialog" aria-labelledby="modal-sign-up-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-sign-up-label">Sign up now</h3>
        				<p>Please fill in the registration information:</p>
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="" method="post" id="regisForm" class="registration-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-user-name">用户名</label>
	                        	<input type="text" name="loginName" placeholder="请输入用户名..." class="form-user-name form-control" id="regisName">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">密码</label>
	                        	<input type="password" name="loginPassword" placeholder="请输入密码..."  class="form-password form-control" id="regisPassword">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-confirm-password">确认密码</label>
	                        	<input type="password" name="rePassword" placeholder="请输入确认密码..."   class="form-confirm-password form-control" id="repestPassword">
	                        </div>
	                         <div class="form-group">
	                            <label class="sr-only" for="form-confirm-password">所属角色</label>
		                        <select name="roleid" id="regisRoleid"  class="form-control"  onkeyup="this.value=this.value.replace(/\s+/g,'')">
								 	<option value="" >请选择所属角色</option>
								 	<option value="1">超级管理员</option>
								 	<option value="3">普通管理员</option>
								 	<option value="2">客户</option>
								</select>
							</div>
	                    </form>
        			</div>
        			<div class="modal-footer">
        				<button type="submit" class="btn"  onclick="regisFun()">Sign me up!</button>
        			</div>
        			
        		</div>
        	</div>
        </div>


        <!-- 登录——MODAL -->
         <div class="modal fade" id="modal-sign-in" tabindex="-1" role="dialog" aria-labelledby="modal-sign-in-label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                        </button>
                        <h3 class="modal-title" id="modal-sign-in-label">Sign in now</h3>
                        <p>Please fill in the login information:</p>
                    </div>
                    
                    <div class="modal-body">
                        
                        <form role="form" action="" method="post" id="loginForm" class="registration-form">
                            <div class="form-group">
                                <label class="sr-only" for="form-user-name">用户名</label>
                                <input type="text" name="loginName" placeholder="请输入用户名..." class="form-user-name form-control" id="loginName">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="loginPassword" placeholder="请输入密码..." class="form-password form-control" id="loginPassword">
                            </div>
                            <div class="form-group">
	                            <label class="sr-only" for="form-confirm-password">所属角色</label>
		                        <select name="roleid" id="roleid"  class="form-control"   onkeyup="this.value=this.value.replace(/\s+/g,'')">
								 	<option value="" >请选择所属角色</option>
								 	<option value="1">超级管理员</option>
								 	<option value="3">普通管理员</option>
								 	<option value="2">客户</option>
								</select>
							</div>
                           <div class="form-group">
							<div class="col-sm-9 button1">
							    <label class="sr-only" for="form-verification-code">验证码</label>
								<input type="text"  style="margin-left: -14px;" name="verificationCode" class="form-verification-code form-control inputcode" id="verificationCode" placeholder="请输入...">
							</div>
							<div class="col-sm-3 button2">
								<img id="loginform:vCode" src="<%=request.getContextPath()%>/validatecode/validatecode.jsp"  onclick=  "changeImg()" />
							</div>
                           </div>
                            <button type="submit" class="btn" onclick="loginFun()">Sign me in!</button>
                        </form>
                        
                    </div>
                    
                </div>
            </div>
        </div>  
     
    </body>
</html>
<script>
$(document).ready(function() {
	   
	   //表单验证
	   loginFormValidator();
	   
	   regisFormValidator(); 
	   
});

function changeImg(){
	var imgUrl='<%=request.getContextPath()%>/validatecode/validatecode.jsp';
	document.getElementById('loginform:vCode').src = imgUrl+ "?" + Math.random();
}






//登录验证
 function loginFormValidator(){
$('#loginForm').bootstrapValidator({
	   message: '不可用的值',
    feedbackIcons: {
	   valid: 'glyphicon glyphicon-ok',
	   invalid: 'glyphicon glyphicon-remove',
	   validating: 'glyphicon glyphicon-refresh'
         }, 
   fields: {
 	   loginName: {
           validators: {
               notEmpty: {
                   message: '用户名不能为空'
               }
           }
       },
       roleid: {
           validators: {
               notEmpty: {
                   message: '所属角色不能为空'
               }
           }
       },
       verificationCode: {
           validators: {
         	  notEmpty: {
                   message: '验证码不能为空'
               }
           }
       },
       loginPassword: {
           validators: {
         	  notEmpty: {
                   message: '密码不能为空'
               }
           }  
       },
   }
 });
} 

/*注册  */
function regisFormValidator(){
	$('#regisForm').bootstrapValidator({
		   message: '不可用的值',
	    feedbackIcons: {
		   valid: 'glyphicon glyphicon-ok',
		   invalid: 'glyphicon glyphicon-remove',
		   validating: 'glyphicon glyphicon-refresh'
	         }, 
	   fields: {
	 	   loginName: {
	           validators: {
	               notEmpty: {
	                   message: '用户名不能为空'
	               }
	           }
	       },
	       roleid: {
	           validators: {
	               notEmpty: {
	                   message: '所属角色不能为空'
	               }
	           }
	       },
	       rePassword: {
	           validators: {
	         	  notEmpty: {
	                   message: '确认密码不能为空'
	               }
	           }
	       },
	       loginPassword: {
	           validators: {
	         	  notEmpty: {
	                   message: '密码不能为空'
	               }
	           }  
	       },
	   }
	 });
	} 

/* 关闭模态框*/
$('#modal-sign-in').on('hidden.bs.modal', function() {
	$("#loginForm")[0].reset();//使用dom的reset
    $("#loginForm").data('bootstrapValidator').destroy();
    $('#loginForm').data('bootstrapValidator', null);
    loginFormValidator();
});

/* 关闭模态框*/
$('#modal-sign-up').on('hidden.bs.modal', function() {
	$("#regisForm")[0].reset();//使用dom的reset
    $("#regisForm").data('bootstrapValidator').destroy();
    $('#regisForm').data('bootstrapValidator', null);
    regisFormValidator();
});



/* 登录 */
function loginFun(){
	
	 var loginUrl = $("#loginUrl").val();
	 console.info("loginUrl"+loginUrl);
     var flag = $("#loginForm").data('bootstrapValidator').validate().isValid();
     var verificationCode=$("#verificationCode").val();
     if(flag){
    		 $.post(loginUrl, $("#loginForm").serialize(), function(data) {
    				if (data.result=='true') {
    					window.location.href = '<%=basePath%>loginManage/welcomeUrl';
    				}
    				if (data.result=='false') {
    					$.alert({
    		                title: '提示',
    		                content: '登陆信息有误，登录失败！',
    		                type:'red',             //一般危险操作用red,保存成功操作green
    		                buttons: {              //定义按钮
    		                    confirm: {
    		                        text: '确认',
    		                        btnClass: 'btn-primary',
    		                        action: function(){ //这里写点击按钮回调函数 
    		                        	changeImg();
    		                        }
    		                    }
    		                }
    		            });
    				}
    				if (data.result=='repeat') {
    					$.alert({
    		                title: '提示',
    		                content: '验证码信息有误，登录失败！',
    		                type:'red',             //一般危险操作用red,保存成功操作green
    		                buttons: {              //定义按钮
    		                    confirm: {
    		                        text: '确认',
    		                        btnClass: 'btn-primary',
    		                        action: function(){ //这里写点击按钮回调函数 
    		                        	changeImg();
    		                        }
    		                    }
    		                }
    		            });
    				}
    				if (data.result=='roleIdFalse') {
    					$.alert({
    		                title: '提示',
    		                content: '管理身份错误，登录失败！',
    		                type:'red',             //一般危险操作用red,保存成功操作green
    		                buttons: {              //定义按钮
    		                    confirm: {
    		                        text: '确认',
    		                        btnClass: 'btn-primary',
    		                        action: function(){ //这里写点击按钮回调函数 
    		                        	changeImg();
    		                        }
    		                    }
    		                }
    		            });
    				}
    				
    				}, 'json' );
     }
     
}


/*注册*/
function regisFun() {
    var regisUrl=$("#regisUrl").val();
    var flag =$("#regisForm").data('bootstrapValidator').validate().isValid();
    var loginPassword=$("#regisPassword").val();
    console.info("loginPassword"+loginPassword);
    var rePassword=$("#repestPassword").val();
    console.info("rePassword"+rePassword);
   	 if(flag){
   	   if(loginPassword==rePassword){
   		$.post(regisUrl, $("#regisForm").serialize(), function(data) {
			if (data.result=='true') {
				$.alert({
	                title: '提示',
	                content: '用户注册成功，跳转到登录页面！',
	                type:'green',             //一般危险操作用red,保存成功操作green
	                buttons: {              //定义按钮
	                    confirm: {
	                        text: '确认',
	                        btnClass: 'btn-primary',
	                        action: function(){ //这里写点击按钮回调函数
	                        	 window.location.href = '<%=basePath%>loginManage/login/user';
	                        }
	                    }
	                }
	            });
			}
			if (data.result=='false') {
				$.alert({
	                title: '提示',
	                content: '用户注册失败！',
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
	                content: '用户名已存在，请重新输入！',
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
   	 }
   	 else if(loginPassword!=rePassword){
      	 $.alert({
   			    title: '提示',
   			    content: '两次密码不一致，请修改！',
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
   
}

</script>

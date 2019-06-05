<%--
  User: liting
  Date: 2019/3/26
  Time: 9:35 PM
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
    <title>header</title>
    <script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script> 
    <script src="<%=basePath%>static/js/jquery.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-theme.min.css">
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <style>
        .lee-h2{
           padding: 0;
           margin-top: 0px;
        }
        .lee-h1:hover{
            text-decoration: none;
            color: darkgrey;
        }
        .lee-h1:visited{
            text-decoration: none;
            color: white;
        }
        .lee-h3{
            color: white;
            font-size: 18px;
            padding-left: 30px;
            line-height: 50px;
            font-weight:30px;
        }
        .lee-h1{
        color: white;
        line-height: 50px;
        }
        .lee-h4{
        color: white;
        line-height: 50px;
        }
       .btn:focus,.btn:active:focus,.btn.active:focus,.btn.focus,.btn:active.focus,.btn.active.focus {
            outline: none;   
            border-color: transparent;  
            box-shadow:none;
        }
    </style>
</head>
<body>
<input type="hidden" id="updateUrl" value="<%=basePath%>loginManage/updateUserPsw" />

<div class="lee-h2">
    <div class="row">
        <div class="col-md-8 "><span class="lee-h3">Fast  物 流 管 理 平 台</span></div>
        <div class="col-md-2 lee-h4">&nbsp;<i class="fa fa-bullhorn fa-lg"></i>&nbsp;&nbsp;&nbsp;
	        <span class="lee-h4" id="role">
	                                欢迎   <%=session.getAttribute("loginName") %>  <%=session.getAttribute("roleName") %>  :
	         </span>
         </div>
       <%--  <div class="col-md-2">
            <span class="dropdown ">
                <a  role="button" class="dropdown-toggle lee-h1"   data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i> &nbsp;<%=session.getAttribute("loginName") %>
                    <i class="caret"></i>
                </a>
                <ul class="dropdown-menu" >
                    <li><a class="btn btn-link-1 launch-modal" tabindex="-1" data-modal-id="myModal" onclick="updatePassword()">修改密码</a></li>
                    <li class="divider "></li>
                    <li><a class="btn btn-link-1 launch-modal" tabindex="-1" href="<%=basePath%>loginManage/login/user">退出</a></li>
                </ul>
          </span>
        </div> --%>
        <div class="col-md-2">
        <a class="btn btn-link-1 launch-modal" tabindex="-1" data-modal-id="myModal" onclick="updatePassword()" style="color:white;outline:none;border: 0px solid #696969;padding-top: 15px;">修改密码</a>
        <a class="btn btn-link-1 launch-modal" tabindex="-1" href="<%=basePath%>loginManage/login/user" style="color:white;outline:none;border: 0px solid #696969;font-size: 13px;padding-top: 15px;">退出</a>
        </div>
    </div>
</div>

<!-- 修改密码 -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="modal-sign-up-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
        				</button>
        				<h3 class="modal-title" id="modal-sign-up-label">修改密码：</h3>
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="" method="post" id="updateForm" class="registration-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-user-name">用户名</label>
	                        	<input type="text" name="loginName" placeholder="请输入用户名..." class="form-user-name form-control" id="loginName">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">原密码</label>
	                        	<input type="password" name="oldPassword" placeholder="请输入原密码..."  class="form-password form-control" id="loginPassword">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-confirm-password">新密码</label>
	                        	<input type="password" name="loginPassword" placeholder="请输入新密码..."   class="form-confirm-password form-control" id="newPassword">
	                        </div>
	                        
	                    </form>
        			</div>
        			<div class="modal-footer">
        				<button type="submit" class="btn"  style="margin-right: 303px;"   onclick="updateFun()">保存</button>
        			</div>
        		</div>
        	</div>
        </div>

</body>
<script type="text/javascript">
var loginName="${sessionScope.loginName}";


$(document).ready(function() {
	updateFormValidator(); 
	$('.dropdown').dropdown();
});


function updateFormValidator(){
	$('#updateForm').bootstrapValidator({
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
	       oldPassword: {
	           validators: {
	         	  notEmpty: {
	                   message: '原密码不能为空'
	               }
	           }
	       },
	       loginPassword: {
	           validators: {
	         	  notEmpty: {
	                   message: '新密码不能为空'
	               }
	           }  
	       },
	   }
	 });
	} 

function updatePassword(){
	  $('#showModal').modal('show');
	  $('#loginName').val(loginName);
	  $('#loginName').attr("readonly",true);
}





/*提交*/
function updateFun() {
    var updateUrl=$("#updateUrl").val();
    var flag =$("#updateForm").data('bootstrapValidator').validate().isValid();
   	 if(flag){
   		$.post(updateUrl, $("#updateForm").serialize(), function(data) {
			if (data.result=='true') {
				$.alert({
	                title: '提示',
	                content: '密码修改成功！',
	                type:'green',             //一般危险操作用red,保存成功操作green
	                buttons: {              //定义按钮
	                    confirm: {
	                        text: '确认',
	                        btnClass: 'btn-primary',
	                        action: function(){ //这里写点击按钮回调函数
	                        	$("#updateForm").data('bootstrapValidator').resetForm();
						         $('#updateForm')[0].reset();
	                      	     $('#showModal').modal('hide');
	                        }
	                    }
	                }
	            });
			}
			if (data.result=='false') {
				$.alert({
	                title: '提示',
	                content: '密码修改失败！',
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
	                content: '原密码输入错误，请重新输入！',
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
    }
   







</script>
</html>

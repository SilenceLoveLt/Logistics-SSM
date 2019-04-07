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

        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/css/form-elements.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>static/assets/css/style.css">
        <style>
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
        
        </style>

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=basePath%>static/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" type="text/css"  href="<%=basePath%>static/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" type="text/css" href="<%=basePath%>static/assets/ico/apple-touch-icon-57-precomposed.png">

        <!-- Javascript -->
        <script type="text/javascript" src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js" ></script>
        <script type="text/javascript" src="<%=basePath%>static/assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>static/assets/js/jquery.backstretch.min.js"></script> 
        <script type="text/javascript" src="<%=basePath%>static/assets/js/scripts.js?ver=1"></script>
        
        
    </head>

    <body>

        <!-- Content -->
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
        
        <!-- MODAL -->
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
        				
	                    <form role="form" action="" method="post" class="registration-form">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="form-user-name">UserName</label>
	                        	<input type="text" name="form-user-name" placeholder="UserName..." class="form-user-name form-control" id="form-user-name">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">Password</label>
	                        	<input type="text" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-confirm-password">Confirm  Password</label>
	                        	<input type="text" name="form-confirm-password" placeholder="Confirm  Password..." class="form-confirm-password form-control" id="form-confirm-password">
	                        </div>
	                       
	                        <button type="submit" class="btn">Sign me up!</button>
	                    </form>
	                    
        			</div>
        			
        		</div>
        	</div>
        </div>


        <!-- MODAL -->
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
                        
                        <form role="form" action="" method="post" class="registration-form">
                            <div class="form-group">
                                <label class="sr-only" for="form-user-name">UserName</label>
                                <input type="text" name="form-user-name" placeholder="UserName..." class="form-user-name form-control" id="form-user-name">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">Password</label>
                                <input type="text" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
                            </div>
                           <div class="form-group">
							<div class="col-sm-9 button1">
							    <label class="sr-only" for="form-verification-code">Verification Code</label>
								<input type="text" name="form-verification-code" class="form-verification-code form-control inputcode" id="form-verification-code" placeholder="Verification Code...">
							</div>
							<div class="col-sm-3 button2">
								<img id="loginform:vCode" src="<%=request.getContextPath()%>/validatecode/validatecode.jsp"  onclick="javascript:document.getElementById('loginform:vCode'). src='<%=request.getContextPath()%>/validatecode/validatecode.jsp?'+Math.random();" />
							</div>
                           </div>
                            <button type="submit" class="btn">Sign me in!</button>
                        </form>
                        
                    </div>
                    
                </div>
            </div>
        </div>
     
    </body>
</html>
<script>


</script>

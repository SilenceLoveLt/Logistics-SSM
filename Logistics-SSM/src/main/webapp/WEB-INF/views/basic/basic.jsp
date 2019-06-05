<meta name=”viewport” content=”width=device-width, initial-scale=1″ />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
           <title><tiles:getAsString name="title" /></title>
           <meta name="viewport" content="width=device-width, initial-scale=1">
           <script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script>
           
           <style>
            .lee-ba{
	            background-color:#4F4F4F;
	            margin-left: 0px;
	            margin-bottom: 0px;
	            height:726px;
            }
            .navbar1 {
			    position: relative; 
			    height: 50px; 
			    margin-bottom: 0px;
			    margin-top:-19px;
			    border: 0px solid transparent; 
			    background-color:#000000;
			}
			.navbar2 {
			    background-color:#000000;
			    position: relative; 
			    height: 50px; 
			    margin-top:-10px;
			    border: 0px solid transparent; 
			}
			.lee-ba1{
				padding-top: 0px;
				padding-bottom: 0px;
				margin-left: 0px;
				margin-bottom: 0px;
			}
			.container-fluid {
			   padding: 0px;
			   margin: 0px;
			}
           </style>
    </head>
    </center>
    <body style="overflow-y: hidden;">
	    
		 <nav class="navbar1" >
		  <div class="container-fluid">
		    <tiles:insertAttribute name="header" />
		  </div>
		</nav> 
 
       <div class="lee-ba1">
		<div class="container-fluid" >
			  <div class="row">
			    <div class="col-sm-2 lee-ba">
			      <tiles:insertAttribute name='menu' />
			    </div>
			    
			    <div class="col-sm-10 col-xs-offset-0.5">
			       <tiles:insertAttribute name='body' />
			  </div>
			 </div>
		</div>
		</div>
		
		
		<div class="navbar2 text-center" style="position: absolute; width: 100%; bottom: 0px;">
		 <div class="container-fluid">
		  <tiles:insertAttribute name="footer" />
		 </div>
		</div> 
    </body>
</html>

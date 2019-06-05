<%--
  User: liting
  Date: 2019/5/17
  Time: 1:54 PM
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
     <script src="<%=basePath%>static/assets/js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/css/bootstrap-theme.min.css">
    <script src="<%=basePath%>static/bootstrap/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <title>welcome</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .bg {
            background: url(static/images/welcome.jpg) no-repeat center center;
            background-size: 60% 70%;
        }
    </style>
</head>
<body>
<div style="height: 680px;" class="bg">

</div>
</body>
</html>

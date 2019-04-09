<%--
  User: liting
  Date: 2019/3/26
  Time: 9:36 PM
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
    <title>footer</title>
    <style>

    p{
    text-align: center;
    color: white;
   line-height: 50px
    }
    </style>
</head>
<body>
<p>如有任何问题请联系管理员！</p>
</body>
</html>

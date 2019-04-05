<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html xmlns:th="http://www.thymeleaf.org" xmlns="http://www.w3.org/1999/html">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
    <h1>Welcome</h1>
    
     <%-- <a href="${pageContext.request.contextPath }/login/showName"  target="_blank">点击跳转页面</a> --%>
    
  <form action="${pageContext.request.contextPath}/login/showName" method="post">
              用户名：<input type="text" name="adminId"/> <br><br>
              年龄：    <input type="text" name="adminPwd"/> <br><br>
            <input type="submit" value="提交"/>
   </form>

</body>
</html>
<%@ page contentType="text/html; charset=utf-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
    <title>show name</title>
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
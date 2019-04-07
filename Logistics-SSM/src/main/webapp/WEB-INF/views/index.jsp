<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<% 
	String contextPath = request.getContextPath();
	if (!contextPath.endsWith("/")) {
		contextPath += "/";
	}
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/";
	response.sendRedirect(basePath+"login/user");
%>
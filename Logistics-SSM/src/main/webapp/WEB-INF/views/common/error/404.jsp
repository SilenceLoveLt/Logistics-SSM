<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="/WEB-INF/views/common/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${cssBasePath }/global.css" rel="stylesheet" type="text/css" />
<link href="${cssBasePath }/layout_cn.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="errorInfo">
<div class="topbg">
<p class="title">系统提示</p>
</div>
<div class="midbg">
<div class="box">
<p><b>坏消息</b>是 系统 刚发生了一个错误。<br />
<b>好消息</b>是您帮我们发现了一个问题，我们会立刻对其进行调查。</p>
<p>对于由此造成的任何不便，我们深表歉意。<br />
同时，如果您希望了解有关此问题及其他问题的更新信息，请访问：<br />
<!--http://www.sipmall.com/help/qa</p>-->
<p><b>抱歉！同时谢谢您的帮助！</b></p>
<div class="btn"><a href="#" onclick="window.history.back();">返回</a></div>
</div>
</div>
<div class="btmbg"></div>
</div>
<!-- 404 -->
</body>
</html>
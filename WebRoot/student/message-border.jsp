<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message-border.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=path %>/css/message-border.css" />
	<link type="text/css" rel="stylesheet" href="<%=path %>/assets/css/dpl-min.css" />
  </head>
  
  <body>
    <div class="message-boeder">
		<table>
			<tr>
				<th>您的姓名</th>
				<td><input type="text" class="text"></td>
			</tr>
			<tr>
				<th>您的邮箱</th>
				<td><input type="text" class="text"></td>
			</tr>
			<tr>
				<th>您的手机号码</th>
				<td><input type="text" class="text"></td>
			</tr>
			<tr>
				<th>其他联系方式</th>
				<td><input type="text"><span style="font-size: 12px;">(如QQ、MSN等)</span></td>
			</tr>
			<tr>
				<th>留言内容<span style="color: red; font-size:12px ;">（200字以内）</span></th>
				<td><textarea style="min-height: 100px;"></textarea></td>
			</tr>
		</table>
		<li>
		<input type="button" value="提交" class="button button-primary"/>
		<input type="button" value="取消" class="button"/>
		</li>
		</div>
  </body>
</html>

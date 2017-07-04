<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'text-rule.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/text-rule.css" />
  </head>
  
  <body>
    <div class="text-rule">
		<li>
			<span style="font-weight: bold;color: red;">本次考试规则如下：</span><br /><br />
		</li>
		<li>1、考试过程中不得交头接耳、随意走动<br /></li>
		<li>2、拔掉考试机器电源，损坏计算机硬件、设备<br /></li>
		<li>3、夹带与考试内容有关材料<br /></li>
		<li>4、偷看、抄袭他人答案或者有意让人抄袭、传递信号、协助他人作弊<br /></li>
		<li>有以上行为之一的，取消该科目考试成绩，停考一年。<br /><br /></li>
		<li>1、喧哗取闹、扰乱考场秩序<br /></li>
		<li>2、请他人代考<br /></li>
		<li>3、利用无线通讯等现代工具作弊<br /></li>
		<li>有以上行为之一的，取消该考试科目成绩，停考三年<br /></li>
		</div>
  </body>
</html>

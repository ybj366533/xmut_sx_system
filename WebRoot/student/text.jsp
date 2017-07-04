<%@page import="com.test.model.Student"%>
<%@page import="com.test.model.Subject"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	if(session.getAttribute("currentsubject")==null){
			return;
		}
	Subject subject=(Subject)session.getAttribute("currentsubject");
	Student student=(Student)session.getAttribute("student");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考试页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" src="styles.css">
	-->

  </head>
  <link rel="stylesheet" type="text/css" href="css/text.css">
  <link rel="stylesheet" type="text/css" href="css/layer.css">
  <script type="text/javascript" src="<%=path %>/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="js/layer.js"></script>	
  <script type="text/javascript" src="js/text.js"></script>
  <body>
    <div class="text-top">
			<h2>在线考试系统</h2>
			<div id="remainTime" style="font-size:20px;font-weight:800;color:#FF9900; float:right; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> 
			<div id="remainTime" style="font-size:20px;font-weight:800;color:#FF9900;"></div> 
			<li >剩余时间为</li>
			<li>考试时间:<span style="font-size:20px;color:#FF9900">90分钟</span></span></li>
			<li>考试科目:<span style="font-size:20px;color:#FF9900"><%=subject.getName()%></span></li>
			
		<div style="clear: both;"></div>
		</div>
		<div class="text-left">
				<div class="information">
					<h4>考生信息</h4>
					<li>考生姓名 <span><%=student.getName() %></span></li>
					<li>准考证号<span><%=student.getTiketId()%></span></li>
				</div>
				<div id="text-nav">
					<h4>试题导航</h4>
					<p style="font-size:10px"><span style="color:blue">蓝色</span>部分表示未做，<span style="color:red">红色</span>表示已做</p>
			</div>
		</div>
		<div class="text-right">
				<h3><%=subject.getName()%></h3>
		</div>
		<div style="clear: both;"></div>
  </body>
</html>

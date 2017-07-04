<%@page import="com.test.model.Department"%>
<%@page import="com.test.model.Subject"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("student")==null)
return;
Student student=(Student)session.getAttribute("student");
Professional professional=(Professional)session.getAttribute("professional");
Department department=(Department)session.getAttribute("department");
List<Subject> subject=(List)session.getAttribute("subjects");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link type="text/css" rel="stylesheet" href="<%=path %>/assets/css/dpl-min.css" />
	<link type="text/css" rel="stylesheet" href="<%=path %>/css/stu-information.css" />
  </head>
  
  <body>
   <div class="stu">
		<li><span style="font-size: 26px; color: #0058B4;">考生信息</span></li>
		<li>
			<div class="table">
			<table>
				<tr>
					<td>姓名：<%=student.getName() %></td>
					<td>学号：<%=student.getXh() %></td>
				</tr>
				<tr>
					<td>性别：<%=student.getSex() %></td>
					<td>年龄：<%=student.getAge() %></td>
				</tr>
				<tr>
					<td>所在系：<%=department.getDname()%></td>
					<td>所学专业：<%=professional.getPname()%></td>
				</tr>
				<tr>
					<td>准考证号：<%=student.getTiketId() %></td>
					<td>考试科目：<%=subject.get(0).getName()%></td>
				</tr>
			</table>
			</div>
		</li>

		</div>
  </body>
</html>

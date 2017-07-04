<%@page import="com.test.model.Grade"%>
<%@page import="com.test.model.Department"%>
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
List<Grade> grades=Factory.getGradeManage().getGradeByUid(student.getUid());

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'history-grade.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=path %>/css/history-grade.css" />
  </head>
  
  <body>
    <div class="information">
			<table>
				<tr>
					<td>姓名：<%=student.getName() %></td>
					<td>学号：<%=student.getXh() %></td>
				</tr>
				<tr>
					<td>所在系：<%=department.getDname() %></td>
					<td>所读专业：<%=professional.getPname() %></td>
				</tr>				
			</table>
		</div>
		<div class="history-grade">
		<table summary="以下是该生所有课程成绩" >
			<tr>
				<th>课程代码</th>
				<th>课程名称</th>
				<th>课程性质</th>
				<th>学分</th>
				<th>成绩</th>
				<th>考试时间</th>
			</tr>
			<%
				if(grades.size()>0){
			 %>
			<%for(Grade grade :grades){ %>
			<tr>
				<td><%=grade.getId() %></td>
				<td><%=grade.getSubject().getName() %></td>
				<td><%=grade.getSubject().getNature()%></td>
				<td><%=grade.getSubject().getCredit() %></td>
				<td><%=grade.getScore()%></td>
				<td><%=grade.getTime()%></td>
			</tr>
			<%}}
			else{
			out.print("暂无成绩");
			}
			%>
		</table>
		</div>
  </body>
</html>

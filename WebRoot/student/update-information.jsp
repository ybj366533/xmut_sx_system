<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.test.model.Subject"%>
<%@page import="com.test.model.Department"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("student")==null)
return;
Student student=(Student)session.getAttribute("student");
Professional professional=(Professional)session.getAttribute("professional");
Department department=(Department)session.getAttribute("department");
List<Department> departments=Factory.getDepartmentManage().getDepartments();
List<Professional> professionals=Factory.getProfessionalManage().getProfessionalByDid(department.getDid());
List<Subject> subject=(List)session.getAttribute("subjects");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/layer.css">
	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>	
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>	

	<link rel="stylesheet" type="text/css" href="<%=path %>/css/update-information.css"/>
	<script type="text/javascript">
	$(document).ready(function(){						
	///// 购买提交按钮单击/////
	$('.update-btn').click(function(){		
		if($('#age').val() == '') {
			layer.tips('年龄不可以为空', '#age');
			return false;	
		}	
		$.post("../login.action?opt=updatestudent",
			        {
					  age: $("#age").val(),
					  department: $("#department").val(),
					  professional:$("#professional").val(),
			        },
			        function(data,status){			           
			        	
			        	if(data=="true")
			            {
			            	layer.msg("更新资料成功");
			        		location.reload();
			            }
			            else{
			            	layer.msg("更新资料失败");
			            }
			        },"html");
		return false;
	}
	);
});
	
	</script>
  </head>
  
  <body>
    <div class="update-stu">
			<li><span style="font-size: 26px; color: #0058B4;">个人信息</span></li><br />
			<dl>
				<dt>姓名:</dt>
				<dd><%=student.getName() %></dd>
				<dt>学号:</dt>
				<dd><%=student.getXh()%></dd>

			</dl>
			<dl>
				<dt>性别:</dt>
				<dd><%=student.getSex() %></dd>
				<dt>年龄</dt>
				<dd><input value="<%=student.getAge()%>" name="age" id="age"></dd>
				
			</dl>
			<dl>
				<dt>所在系：</dt>
				<dd><select name="department" id="department">
						<%
						for(Department department2:departments){
						 %>
						<option value="<%=department2.getDid()%>"><%=department2.getDname() %></option>
						<%
						} %>
						
				</select></dd>
				<dt>所学专业：</dt>
				<dd><select name="professional" id="professional">
						<%
							for(Professional professional2:professionals){
						 %>
						<option value="<%=professional2.getPid()%>"><%=professional2.getPname()%></option>
						<%} %>
				</select></dd>
			</dl>
			<input type="button"  value="保存" class="update-btn"/>
			
		</div>
  </body>
</html>

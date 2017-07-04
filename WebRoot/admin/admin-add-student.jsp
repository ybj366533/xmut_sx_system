<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Department> departments = Factory.getDepartmentManage().getDepartments();
	List<Professional> professionals = Factory.getProfessionalManage().getProfessionals();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生</title>

<!--[if lt IE 9]>
      <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap-theme.css" media="screen" />
<!-- FontAwesome -->
<link rel="stylesheet"
	href="../assets/Font-Awesome-3.2.1/css/font-awesome.css" />

<!-- JQuery -->
<script src="<%=path%>/assets/jquery-3.2.1.js"></script>
<!-- Bootstrap -->
<script src="../assets/bootstrap-3.3.7/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/layer.css">
<script type="text/javascript" src="<%=path%>/js/layer.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		///// 提交按钮单击/////
		$('#user-plus').click(function() {
			$.post("../login.action?opt=addstudent",
				{
					name:$("#username").val(),
			        xh:$("#loginId").val(),
			        sex:$("#user-sex").val(),
					age: $("#user-age").val(),
					department: $("#department").val(),
					professional:$("#professional").val(),
					mobile : $("#mobile").val(),
					email : $("#email").val(),
					mtype : $("#mtype").text(),
					tiketId: $("#loginId").val(),
					loginId:$("#loginId").val(),
					password:$("#password").val(),
					
				},
				function(data, status) {
					if (data == "true") {
						layer.msg("更新资料成功");
						if (top.topManager) {
							top.topManager.openPage({
								id : 'users',
								text : '用户管理',
								href : 'admin/admin-users.jsp',
								isClose : true,
							});
						}
					} else {
						layer.msg("更新资料失败");

					}
				}, "html");
			return false;
		}
		);
	});
</script>
</head>

<body>


	<div class="container-fluid">
		<br />
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="row-fluid" id="div-advanced-search">

					<form class="form-inline well">
						<span>用户名:</span> <input type="text" class="form-control"
							placeholder="学号／教工号" id="loginId" data-rules="{required:true}">
						<span>密码:</span> 
						<input type="password" class="form-control"
							placeholder="密码" id="password" >
						<div>
							<br>
						<span>手机号码:</span>
						<input type="text" class="form-control"
							placeholder="手机号码" id="mobile"> 
						<span>邮箱:</span> 
						<input type="email" class="form-control" placeholder="邮箱" id="email">
						</div>
						
						<div>
							<br /> <span>姓 名:</span> <input type="text" class="form-control"
								placeholder="姓名" id="username"> 
								<span>班级:</span> 
								 <select class="input-small" id="department"  name="department" >
               <%
                	for(Professional professional : professionals){
                 %>
              <option value="<%=professional.getPid()%>"><%=professional.getPname()%></option>
              <%} %>
              </select>
			
			<span>所属院系:</span> 
								<select id="professional" class="input-small" name="professional">
                <%
                	for(Department department : departments){
                 %>
                <option value="<%=department.getDid()%>"><%=department.getDname()%></option>
                <%} %>
              </select>
              
              <span>用户类别:</span>
						
						<span class="placeholder" id="mtype"> 学生</span>
              </div>
				<div>
					<br />
             			 <span>性别:</span> 
             			 <input type="text" class="form-control" placeholder="性别"
								id="user-sex">
					
			<span>年龄:</span> <input
								type="text" class="form-control" placeholder="年龄"
								id="user-age">
				</div>
			</div>
				<p>
					<br />
					<button type="submit" class="btn btn-primary" id="user-plus">
						<i class="icon-ok"></i> 确认
					</button>
					<input type="reset" class="btn btn-success" id="user-refresh" value="重置"/>
						
					
				</p>
				</form>

			</div>
		</div>
	</div>


	
</body>

</html>
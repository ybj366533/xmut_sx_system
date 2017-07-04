<%@page import="org.apache.struts2.components.Else"%>
<%@page import="com.test.model.Users"%>
<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Student"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UsersJson users=null;

if(request.getParameter("uid")!=null){
String uid=request.getParameter("uid");
users=Factory.getUserManageImp().selectUserByLoginId(uid);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>

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
<link rel="stylesheet" type="text/css" href="<%=path %>/css/layer.css">
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>
	
   <script type="text/javascript">
    $(document).ready(function(){
 	$('#user-plus').click(function(){
			$.post("../login.action?opt=updatesusers",
				{
					id: $("#loginId").attr("title"),
					loginId : $("#loginId").val(),
					password : $("#password").val(),
					mobile : $("#mobile").val(),
					email : $("#email").val(),
					role: $("#mtype").attr("title")
					
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
		});

 });
   
   </script>
</head>

<body>
	  

	<div class="container-fluid">
		<br />
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="row-fluid" id="div-advanced-search">
					<form class="form-inline well" method="post">
						<span>用户名:</span> <input type="text" value="<%=users.getUserName()%>" class="form-control"
							 id="loginId" disabled="true"  data-rules="{required:true}" title="<%=request.getParameter("uid") %>">
						<span>密码:</span> 
						<input type="password" class="form-control"
							placeholder="密码" id="password" >
						<span>手机号码:</span>
						<input type="text" class="form-control"
							id="mobile" value="<%=users.getMobile()%>"> 
						<span>邮箱:</span> 
						<input type="email" class="form-control"  id="email" value="<%=users.getEmail()%>">
						<span>用户类别:</span>
						<!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
						<span class="placeholder" id="mtype" title="users.getRole()" ><%
						if(users.getRole().equals("admin")){
						out.println("管理员");
						}else if(users.getRole().equals("teacher")){
						out.println("老师");
						}else{
						out.println("学生");
						}%></span>
				<p>
					<br />
					<button type="submit" class="btn btn-primary" id="user-plus">
						<i class="icon-ok"></i> 确认
					</button>
					<input type="reset" class="btn btn-success" id="user-refresh"
						value="重置" />
				</p>
				</form>
			</div>
		</div>
	</div>
</div>
</body>

</html>
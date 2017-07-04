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
			$.post("../test.action?opt=savesubject",
				{
					name:$("#name").val(),
			        pid:$("#pid").val(),
					uid: $("#uid").val(),
					nature: $("#nature").val(),
					credit: $("#credit").val()
				},
				function(data, status) {
					if (data == "true") {
						layer.msg("添加成功");
						if (top.topManager) {
							top.topManager.openPage({
								id:'class',text:'查询专业信息',href:'admin/admin-class.jsp',
								isClose : true,
							});
						}
					} else {
						layer.msg("添加失败");
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
						
						<span>所属院系:</span> 
								<select id="did" class="input-small" name="professional">
                <%
                	for(Department department : departments){
                 %>
                <option value="<%=department.getDid()%>"><%=department.getDname()%></option>
                <%} %>
              </select>
              			<span>所属专业:</span> 
								<select id="pid" class="input-small" name="professional">
                <%
                	for(Professional professional : professionals){
                 %>
                <option value="<%=professional.getPid()%>"><%=professional. getPname()%></option>
                <%} %>
              </select>
						<div>
							<br>
						<span>课程名:</span> 
						<input type="text" class="form-control" placeholder="课程名" id="name">
						<span>任课老师ID:</span> 
						<input type="text" class="form-control" placeholder="教工号" id="uid">
						
					
						</div>
						<div>
							<br>
							<span>课程类型:</span> 
								<select id="nature" class="input-small" name="professional">
             
                <option value="0">必修</option>
                <option value="1">选修</option>
              </select>
						
						<span>学分:</span>
						<input type="text" class="form-control"
							placeholder="学分" id="credit"> 
						</div>
						
				
			</div>
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
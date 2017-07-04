<%@page import="com.test.model.Grade"%>
<%@page import="com.test.model.Teacher"%>
<%@page import="com.test.model.Subject"%>
<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
if(session.getAttribute("teacher")==null)
return;
List<Subject> subjects = null;
UsersJson users=null;
Grade grade = null;
if(request.getParameter("gid")!=null){
int gid=Integer.parseInt(request.getParameter("gid"));
grade = Factory.getGradeManage().getGradeByid(gid);
}
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
			$.post("../test.action?opt=updateGrade",
				{
					sid:$(this).attr("title"),
			        uid:$("#uid").val(),
					count: $("#count").val(),
				},
				function(data, status) {
					if (data == "true") {
						layer.msg("修改成功");
						if (top.topManager) {
							top.topManager.openPage({
								id:'code',text:'查询学生成绩',href:'admin/score.jsp',
								isClose : true,
							});
						}
					} else {
						layer.msg("修改失败");
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
					
						<div>
						<span>课程名称:</span> 
						<%out.println(Factory.getSubjectManage().getSubjectByid(grade.getSubject().getId()).getName());
						 %>
						
						<div>
							<br>
						<span>姓名:</span> 
						<input type="text" class="form-control" disabled="true" id="name" value="<%=Factory.getUserManageImp().getstudentByUid(grade.getStudent().getUid()).getName()%>">
						<span>学号:</span> 
						<input type="text" class="form-control" disabled="true" id="uid" value="<%=Factory.getUserManageImp().selectUserByUId(grade.getStudent().getUid()).getUserName() %>">
						
						<span>分数:</span>
						<input type="text" class="form-control"
							placeholder="分值" id="count" value="<%=grade.getScore() %>"> 
						</div>
						
				
			</div>
						<p>
							<br />
							<button type="submit" class="btn btn-primary" id="user-plus" title="<%=grade.getId()%>">
								<i class="icon-ok"></i> 确认
							</button>
							


						</p>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
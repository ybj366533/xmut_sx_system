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
	List<Department> departments = Factory.getDepartmentManage().getDepartments();
	List<Professional> professionals = Factory.getProfessionalManage().getProfessionals();
	Professional professional = null;
	List<Subject> subjects = null;
	
	if (request.getParameter("pid") != null) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		professional = Factory.getProfessionalManage().getProFeProfessionalById(pid);
		subjects = Factory.getSubjectManage().getSubjectByPid(pid);
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
			$.post("../test.action?opt=saveprofessional", {
				pname : $("#pname").val(),
				did : $("#did").val(),
				puid : $("#puid").val(),
				count : $("#count").val(),
			},
				function(data, status) {
					if (data == "true") {
						layer.msg("添加成功");
						if (top.topManager) {
							top.topManager.openPage({
								id : 'class',
								text : '查询班级信息',
								href : 'admin/admin-class.jsp',
								isClose : true,
							});
						}
					} else {
						layer.msg("添加失败");
					}
				}, "html");
			return false;
		});
		$('#btn-add').click(function() {
			if (top.topManager) {
				top.topManager.openPage({
					id : 'addcourse',
					text : '添加专业课程',
					href : 'admin/admin-add-subject.jsp'
				});
			}

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

					<form class="form-inline well">
						<span>专业名称:</span> <input type="text" class="form-control"
							value="<%=professional.getPname()%>" placeholder="班级名称"
							id="pname" disabled="true" data-rules="{required:true}"
							title="<%=request.getParameter(" pid ")%>"> <span>所属院系:</span>
						<%=departments.get(professional.getDepartment().getDid() - 1).getDname()%>

						<div>
							<br> <span>负责人ID:</span> <input type="text"
								class="form-control" placeholder="教工号" id="puid"
								value="<%=professional.getPuid()%>"> <span>人数:</span> <input
								type="text" class="form-control"
								value="<%=professional.getCount()%>" placeholder="人数" id="count">
						</div>
				</div>

				<div class="alert alert-info">

					<button type="button" class="btn btn-primary" id="btn-add">
						<i class="icon-plus"></i> 添加
					</button>

					<div>
						<br /> 专业课程：

					</div>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%for(Subject subject : subjects){ %>
							<tr class="success">
								<td><%=subject.getName() %></td>
								<td><%String nature = subject.getNature();
								if(nature.equals("0")){
								out.println("必修");
								}else{
								out.println("选修");
								} %></td>
								<td><button type="button" class="delete btn btn-danger"
										id="delete">
										<i class="icon-trash"></i> 删除
									</button></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>


				<div class="input-group">
					<p>
						<br />
						<button type="button" class="btn btn-primary" id="user-plus">
							<i class="icon-ok"></i> 确认
						</button>
						<input type="reset" class="btn btn-success" id="user-refresh"
							value="重置" />
					</p>

				</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
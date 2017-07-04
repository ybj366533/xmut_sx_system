<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>自定义查询模版</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap-theme.css" media="screen" />
<!-- FontAwesome -->
<link rel="stylesheet"
	href="../assets/Font-Awesome-3.2.1/css/font-awesome.css" />
<!--[if IE 7]>
<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
<![endif]-->

<!-- JQuery -->
<script src="../assets/jquery-3.2.1.js"></script>
<!-- Bootstrap -->
<script src="../assets/bootstrap-3.3.7/js/bootstrap.js"></script>
</head>

<body>

	<div class="container-fluid">
		<br />

		<div class="row-fluid">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">用户ID:</a>
						</div>
						<ul class="nav navbar-nav navbar-right">
							<form class="navbar-form ">
								<button type="button" class="btn btn-primary" id="btn-add">
									<i class="icon-plus"></i> 添加
								</button>
							</form>
						</ul>

						<ul class="nav navbar-nav navbar-left">

							<form class="navbar-form navbar-left" role="search">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="学号／教工号">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default" tabindex="-1">确认</button>
										<button type="button"
											class="btn btn-default 
                        dropdown-toggle"
											data-toggle="collapse" data-target="#div-advanced-search"
											data-parent="#accordion">
											<i class="icon-reorder"></i>
										</button>

									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->

							</form>
						</ul>
					</div>
				</nav>
				<div class="row-fluid panel-collapse collapse"
					id="div-advanced-search">
					<div>
						<form class="form-inline well">
							<span>姓名:</span> <input type="text" class="form-control"
								placeholder="姓名" id="name-search"> <span>学院:</span> <input
								type="text" class="form-control" placeholder="学院"
								id="position-search"> <span>班级:</span> <input
								type="text" class="form-control" placeholder="班级"
								id="office-search"> <span>编号:</span> <input type="text"
								class="form-control" placeholder="学号／教工号" id="extn-search">
							<span>用户类别:</span>
							<div class="input-group">

								<div class="input-group-btn">
									<button type="button" class="btn btn-default"
										data-toggle="dropdown">
										学生 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right">
										<li><a href="#">管理员</a></li>
										<li><a href="#">教师</a></li>
										<li><a href="#">学生</a></li>

									</ul>
								</div>
								<!-- /btn-group -->
							</div>
							<button type="button" class="btn btn-default"
								id="btn-advanced-search">
								<i class="fa fa-search"></i> 查询
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
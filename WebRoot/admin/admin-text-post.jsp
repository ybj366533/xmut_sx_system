<%@page import="com.test.model.Users"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Users admin = (Users) session.getAttribute("admin");
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
<link href="../assets/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet"
	href="../assets/Font-Awesome-3.2.1/css/font-awesome.css" />
<script src="../assets/js/global.js"></script>
<!-- icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="http://classfoo.com/static/favicon.ico">
<link rel="apple-touch-icon"
	href="http://classfoo.com/static/apple-touch-icon-precomposed.png">


<script src="../assets/wysihtml5/main.js"></script>
<script src="../assets/wysihtml5/classfoo-editor.js"></script>
<!-- JQuery -->
<script src="<%=path%>/assets/jquery-3.2.1.js"></script>
<!-- Bootstrap -->
<script src="../assets/bootstrap-3.3.7/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/layer.css">
<script type="text/javascript" src="<%=path%>/js/layer.js"></script>
<style>
body {
	overflow-y: scroll;
	padding-top: 30px;
	background: #e5e5e5;
}

.well.cf, .panel.cf {
	border-color: #d8d8d8;
	-webkit-box-shadow: 0 1px 0 #cfcfcf;
	-moz-box-shadow: 0 1px 0 #cfcfcf;
	box-shadow: 0 1px 0 #cfcfcf
}

.transit {
	-webkit-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out
}

.cfeditor {
	padding: 10px;
	overflow: auto;
	width: 100%;
	height: 350px;
	border: 1px solid #cccccc;
	border-radius: 4px;
	outline: 0
}

div.cf-toolbar a.wysihtml5-command-active {
	background-image: none;
	-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	background-color: #E6E6E6;
	background-color: #D9D9D9;
	outline: 0
}

.change-label .label {
	font-size: 100%
}

.cf-toolbar .tb-bg ul li a, .cf-toolbar .tb-alert ul li a {
	padding: 0px 0px
}

.cf-toolbar .tb-bg ul {
	padding: 0px
}

.cf-toolbar .tb-bg ul li span {
	display: block;
	padding: 8px 10px;
	width: 100%
}

.cf-toolbar .tb-alert ul li p {
	margin: 6px
}

.cf-toolbar .showit {
	width: 66px
}

.cf-toolbar .result-wrap.showit {
	width: 39px
}

.cf-toolbar .hideit {
	width: 0px
}

.cf-toolbar .extra-part {
	overflow-x: hidden;
	display: block
}

.cf-toolbar .toggle-extra-part {
	padding: 6px;
	background-color: transparent
}

.cf-toolbar .extra-part.open {
	overflow-x: visible
}

.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger {
	padding: 8px 10px
}
</style>


<script type="text/javascript">
	$(document).ready(function() {
		///// 提交按钮单击/////
		$('#btn-push').click(function() {
			$.post("../test.action?opt=savePlacard", {
				title : $("#text-title").val(),
				content : $("#id-page-editor-a794381c").val()
			},
				function(data, status) {
					if (data == "true") {
						layer.msg("提交成功");
						if (top.topManager) {
							top.topManager.openPage({
								id : 'home',
								text : '公告',
								href : 'admin/admin-main.jsp',
								isClose : true,
							});
						}
					} else {
						layer.msg("提交失败");
					}
				}, "html");
			return false;
		});
		$('#btn-text').click(function() {
			var txt = $("#id-page-editor-a794381c").val();

			if (txt == "") {

				layer.msg("内容不能为空");

			} else {
				layer.msg("验证通过");
			}

		});
	});
</script>
</head>

<body class="wysihtml5-supported">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel cf">
					<div class="panel-body">

						<div class="input-group">
							<div class="input-group-btn">
								<button type="button"
									class="btn btn-default 
                     dropdown-toggle"
									data-toggle="dropdown">
									发布公告 <span class="caret"></span>
								</button>

							</div>
							<!-- /btn-group -->
							<input type="text" class="form-control" name="name" height="50%"
								id="text-title">

						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<!--############ content_left ############-->
			<div class="col-lg-9">

				<div class="section well cf">

					<div id="form-container-a794381c">
						<form method="post" class="do-page-edit">

							<div class="row">
								<div class="col-md-12">

									<div class="btn-toolbar cf-toolbar" id="page-toolbar-a794381c"
										style="margin-bottom:4px;">
										<div class="btn-group">
											<a class="btn btn-default" data-wysihtml5-command="bold"
												title="CTRL+B" target="_blank" unselectable="on"><i
												class="fa fa-bold"></i></a> <a class="btn btn-default"
												data-wysihtml5-command="italic" title="CTRL+I"
												target="_blank" unselectable="on"><i
												class="fa fa-italic"></i></a> <a class="btn btn-default"
												data-wysihtml5-command="underline" title="CTRL+U"
												target="_blank" unselectable="on"><i
												class="fa fa-underline"></i></a> <a class="btn btn-default"
												data-wysihtml5-command="strikethrough" target="_blank"
												unselectable="on"><i class="fa fa-strikethrough"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn btn-default"
												data-wysihtml5-command="formatInline"
												data-wysihtml5-command-value="code" title="文字、代码片段 "
												target="_blank" unselectable="on"><code>片段</code></a>
											<div class="btn-group transit extra-part hideit"
												id="page-toolbar-a794381c-s-text">
												<!--text-->
												<a class="btn btn-default dropdown-toggle"
													data-toggle="dropdown" target="_blank" unselectable="on">属性&nbsp;<span
													class="caret"></span></a>
												<ul class="dropdown-menu" role="menu">
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-muted"
														unselectable="on"><span class="text-muted">次要 /
																弱化</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-primary"
														unselectable="on"><span class="text-primary">首要
																/ 最佳</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-info" unselectable="on"><span
															class="text-info">信息 / 数据</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-warning"
														unselectable="on"><span class="text-warning">提醒
																/ 警告</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-success"
														unselectable="on"><span class="text-success">成功
																/ 好结果</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-text" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="text-danger"
														unselectable="on"><span class="text-danger">危险
																/ 坏结果</span></a></li>
													<li></li>
												</ul>
											</div>
											<div class="btn-group extra-part transit hideit"
												id="page-toolbar-a794381c-s-tag">
												<!--tag-->
												<a class="btn btn-default dropdown-toggle"
													data-toggle="dropdown" target="_blank" unselectable="on">标签&nbsp;<span
													class="caret"></span></a>
												<ul class="dropdown-menu cf change-label" role="menu">
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-default"
														unselectable="on"><span class="label label-default">默认
																/ 普通</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-primary"
														unselectable="on"><span class="label label-primary">首要
																/ 最佳</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-info"
														unselectable="on"><span class="label label-info">信息
																/ 数据</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-warning"
														unselectable="on"><span class="label label-warning">提醒
																/ 警告</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-success"
														unselectable="on"><span class="label label-success">成功
																/ 好结果</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-tag" target="_blank"
														data-wysihtml5-command="myClass"
														data-wysihtml5-command-value="label label-danger"
														unselectable="on"><span class="label label-danger">危险
																/ 坏结果</span></a></li>
												</ul>
											</div>
											<a class="btn btn-default toggle-extra-part" target="_blank"><i
												class="fa fa-caret-right"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn btn-default"
												data-wysihtml5-command="formatBlock"
												data-wysihtml5-command-value="blockquote" title=" 引用 "
												target="_blank" unselectable="on"><i
												class="fa fa-quote-left"></i></a> <a class="btn btn-default"
												data-wysihtml5-command="formatBlock"
												data-wysihtml5-command-value="pre" title=" 代码块 "
												target="_blank" unselectable="on"><i class="fa fa-code"></i></a>
											<a class="btn btn-default"
												data-wysihtml5-command="insertUnorderedList" title=" 无序列表 "
												target="_blank" unselectable="on"><i class="fa fa-list"></i></a>
											<a class="btn btn-default"
												data-wysihtml5-command="insertOrderedList" title=" 有序列表 "
												target="_blank" unselectable="on"><i
												class="fa fa-list-ol"></i></a>
											<div class="btn-group tb-bg extra-part transit hideit"
												id="page-toolbar-a794381c-s-bg">
												<!--bg-->
												<a class="btn btn-default dropdown-toggle"
													data-toggle="dropdown" target="_blank" unselectable="on">背景&nbsp;<span
													class="caret"></span></a>
												<ul class="dropdown-menu cf change-label" role="menu">
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-bg" target="_blank"
														data-wysihtml5-command="bgColor"
														data-wysihtml5-command-value="bg-primary"
														unselectable="on"><span class="bg-primary">首要 /
																最佳</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-bg" target="_blank"
														data-wysihtml5-command="bgColor"
														data-wysihtml5-command-value="bg-info" unselectable="on"><span
															class="bg-info">信息 / 数据</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-bg" target="_blank"
														data-wysihtml5-command="bgColor"
														data-wysihtml5-command-value="bg-success"
														unselectable="on"><span class="bg-success">成功 /
																好结果</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-bg" target="_blank"
														data-wysihtml5-command="bgColor"
														data-wysihtml5-command-value="bg-warning"
														unselectable="on"><span class="bg-warning">提醒 /
																警告</span></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-bg" target="_blank"
														data-wysihtml5-command="bgColor"
														data-wysihtml5-command-value="bg-danger" unselectable="on"><span
															class="bg-danger">危险 / 坏结果</span></a></li>
												</ul>
											</div>
											<div class="btn-group tb-alert extra-part transit hideit"
												id="page-toolbar-a794381c-s-alert">
												<!--alert-->
												<a class="btn btn-default dropdown-toggle"
													data-toggle="dropdown" target="_blank" unselectable="on">突显&nbsp;<span
													class="caret"></span></a>
												<ul class="dropdown-menu cf change-label" role="menu">
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-alert" target="_blank"
														data-wysihtml5-command="myAlert"
														data-wysihtml5-command-value="info" unselectable="on"><p
																class="alert alert-info">信息 / 数据</p></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-alert" target="_blank"
														data-wysihtml5-command="myAlert"
														data-wysihtml5-command-value="success" unselectable="on"><p
																class="alert alert-success">成功 / 好结果</p></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-alert" target="_blank"
														data-wysihtml5-command="myAlert"
														data-wysihtml5-command-value="warning" unselectable="on"><p
																class="alert alert-warning">提醒 / 警告</p></a></li>
													<li><a href="javascript:void(0);"
														selector="#page-toolbar-a794381c-s-alert" target="_blank"
														data-wysihtml5-command="myAlert"
														data-wysihtml5-command-value="danger" unselectable="on"><p
																class="alert alert-danger">危险 / 坏结果</p></a></li>
												</ul>
											</div>
											<div class="btn-group extra-part result-wrap transit hideit">
												<a class="btn btn-default" data-wysihtml5-command="myResult"
													data-wysihtml5-command-value="thumbnail" title=" 运行结果 "
													target="_blank" unselectable="on"><i
													class="fa fa-terminal"></i></a>
											</div>
											<a class="btn btn-default toggle-extra-part" target="_blank"><i
												class="fa fa-caret-right"></i></a>
										</div>


										<div class="btn-group">


											<a id="page-toolbar-a794381cLBID"
												dialog="#page-toolbar-a794381cLMID" class="btn btn-default"
												href="javascript:void(0);"
												data-wysihtml5-command="createLink" title="链接"
												unselectable="on"><i class="fa fa-link"></i></a>

										</div>
										<!-- btn-group-->
										<script>
										
											if (typeof jQuery != 'undefined') {
												$('#page-toolbar-a794381cLMID').appendTo('body');
											} else {
											}
										</script>
										<script>
											$('#page-toolbar-a794381cLBID').attr('data-wysihtml5-command', 'createLink').attr('title', '链接');
											$('#page-toolbar-a794381cLMID').attr('data-wysihtml5-dialog', 'createLink');
										</script>
									</div>

								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<textarea name="content" id="id-page-editor-a794381c"
										class="cfeditor" placeholder="请输入内容..."></textarea>
								</div>
							</div>
							<div class="form-group">
								
								<!-- enctype设置为multipart/form-data,该属性用来设置
  									浏览器采用二进制的方式来处理表单数据，上传文件时需要使用该属性 -->
								<form action="../upLoad" enctype="multipart/form-data"
									method="post">
									选择文件：<input type="file"
										name="upload" /> <input type="submit" value="上传" />
								</form>
							</div>
							<div class="modal-footer">

								<button type="button" class="btn btn-default"
									data-dismiss="modal" id="btn-text">验证</button>
								<button type="submit" class="btn btn-primary" id="btn-push">
									提交</button>
							</div>
					</div>
				</div>
			</div>
			</form>
		</div>

	</div>
	<!--########## content_left_end ##########-->



	<div class="modal fade noautofocus" id="page-toolbar-a794381cLMID"
		tabindex="-1" role="dialog"
		aria-labelledby="page-toolbar-a794381cLMIDLabel" aria-hidden="true"
		style="display:none" data-wysihtml5-dialog="createLink">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>

					<h3 class="modal-title" id="page-toolbar-a794381cLMIDLabel">链接</h3>

				</div>
				<div class="modal-body">

					<input class="form-control" data-wysihtml5-dialog-field="href"
						value="http://">

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-wysihtml5-dialog-action="cancel">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						data-wysihtml5-dialog-action="save">确定（Enter）</button>

				</div>


			</div>
		</div>
	</div>
</body>

</html>

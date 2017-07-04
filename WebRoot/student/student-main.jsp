<%@page import="com.test.model.Works"%>
<%@page import="com.test.model.Placard"%>
<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<Placard> placards = Factory.getPlacardManage().getPlacardByPid(23);
	List<Works> works = Factory.getWorksManage().getWorksByPid(2);
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
			$.post("../login.action?opt=addusers",
				{
					loginId : $("#loginId").val(),
					password : $("#password").val(),
					mobile : $("#mobile").val(),
					email : $("#email").val(),
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
			<div class="col-md-6 column">
<div id="myCarousel" class="carousel slide">
   <!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
   </ol>   
   <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
      <div class="item active">
         <img src="../img/xmut-1.jpg" alt="First slide">
         <div class="carousel-caption">最美理工湖</div>
      </div>
      <div class="item">
         <img src="../img/xmut-2.jpg" alt="Second slide">
         <div class="carousel-caption">通往课堂的马路</div>
      </div>
      <div class="item">
         <img src="../img/xmut-3.jpg" alt="Third slide">
         <div class="carousel-caption">体育馆</div>
      </div>
      <div class="item">
         <img src="../img/xmut-2.jpg" alt="Fourthly slide">
         <div class="carousel-caption">通往课堂的马路</div>
      </div>
      <div class="item">
         <img src="../img/xmut-3.jpg" alt="Fifth slide">
         <div class="carousel-caption">体育馆</div>
      </div>
      <div class="item">
         <img src="../img/xmut-1.jpg" alt="Sixth slide">
         <div class="carousel-caption">最美理工湖</div>
      </div>
   </div>
   <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev">&lsaquo;</a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next">&rsaquo;</a>
</div> 
</div>
<div class="col-md-4 sidebar">
  <h4>公告</h4>
  <ul class="nav nav-tabs nav-stacked">
  <%
  if(placards.size()>6){
  
  for(int i=placards.size()-1;i>placards.size()-7;i--){
  %>
	<li class=""><a href=""<%=placards.get(i).getId() %>><%=placards.get(i).getTitle() %></a></li>
	<%} 
 }else{
 for(int i=placards.size()-1;i>-1;i--){
  %>
	<li class=""><a href=""<%=placards.get(i).getId() %>><%=placards.get(i).getTitle() %></a></li>
	<%} 
  }
   %>
 
  
  </ul>

</div>

 <div>
 <br>
	<div class="row-fluid">
		<div class="col-md-10">
						<table class="table">
								<thead>
									<tr class="info">
										<th>
											序号
										</th>
										<th >
											标题
										</th>
										<th >
											内容
										</th>
										<th >
											发布时间
										</th>
										<th >
											作者
										</th>
										
									</tr>
								</thead>
								
									  <%
  if(works.size()>10){
  
  for(int i=works.size()-1;i>works.size()-11;i--){
  %>
  <tbody>
	<tr class="success">
										<td >
										<%=i %>
										</td>
										<td >
										<a href=""><%=works.get(i).getTitle() %></a>
										</td>
										<td>
										<%=works.get(i).getContent() %>
										</td>
										<td>
										<%=works.get(i).getTime() %>
										</td>
										<td>
										<%=works.get(i).getUid() %>
										</td>
									
									</tr>
									</tbody>
	<%} 
 }else{
 for(int i=works.size()-1;i>-1;i--){
  %>
  <tbody>
<tr class="success">
										<td >
										<%=i %>
										</td>
										<td >
										<a href=""><%=works.get(i).getTitle() %></a>
										</td>
										<td>
										<%=works.get(i).getContent() %>
										</td>
										<td>
										<%=works.get(i).getTime() %>
										</td>
										<td>
										<%=works.get(i).getUid() %>
										</td>
									
									</tr>
									</tbody>
	<%} 
  }
   %>

							</table>
						</div>	
		
	</div>
</div>
</div>
</div>
</body>

</html>
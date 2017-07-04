<%@page import="com.test.model.Student"%>
<%@page import="com.test.model.Teacher"%>
<%@page import="com.test.model.Users"%>
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
	List<Student> students=Factory.getUserManageImp().getAllStudents();
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
    $(document).ready(function(){
 	$('.delete').click(function(){
 		$.post("../test.action?opt=deleteprofessional",
	        				        {
	        						  id: $(this).attr("title"),
	        				        },
	        				        function(data,status){			           
	        				        	if(data=="true")
	        				            {
	        				        		layer.msg("删除成功");
	        				        		location.reload();
	        				            }
	        				            else{
	        				            	layer.msg("删除失败");
	        				            	location.reload();
	        				            }
	        				        },"html");
 	});
 	$('.edit').click(function(){
 		var uid=$(this).attr("title");
 		if(top.topManager){
  	top.topManager.openPage({
 	   id : 'his-grade',
 	   title:'查看学生信息',
  	   href:"admin/history-grade.jsp?uid="+uid,
  		});
} 
 	});
 	$('.classwork').click(function(){
 	var pid=$(this).attr("title");
 	layer.msg("!!"+pid);
 	if(top.topManager){
  	top.topManager.openPage({
 	   id : 'edittimetable',
 	   title:'编辑课表',
  	   href:"admin/school-timetable.jsp?pid="+pid,
  		});
 	}
 	});

 	$('#refresh').click(function(){
 	location.reload();
 	});
 
 	$('#btn-search').click(function(){
 	var txt=$("#txt-search").val();
 	if(txt=="")
	       {
	        layer.msg("查询数据不能为空");

	      }else{
	      	if(top.topManager){
  	top.topManager.openPage({
 	   id : 'editstudent',
 	   title:'查询',
  	   href:"admin/admin-search.jsp?txt="+txt,
  		});
} 
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
				<nav class="navbar navbar-default" role="navigation">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left">
							<form class="navbar-form ">
								<button type="button" class="btn btn-success" id="refresh" >
									<i class="icon-refresh"></i> 刷新
								</button>
							</form>
						</ul>
						
						<ul class="nav navbar-nav navbar-right">
							<form class="navbar-form navbar-left" role="search">
								<div class="input-group">

									<input type="text" class="form-control" id="txt-search">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default" tabindex="-1" id ="btn-search">
											<i class="icon-search"></i> 搜索
										</button>
									
									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->
							</form>
						</ul>
					</div>
				</nav>
				
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr class="active">
								<th>序号</th>
								<th>姓名</th>
								<th>学号</th>
								<th>部门</th>
								<th>专业</th>
								<th>性别</th>
								<th>年龄</th>
								<th></th>
							</tr>
						</thead>
						<%
						
							for (int i = 0; i < students.size(); i++) {
						%>
						<tbody>

							<tr>
								<td>
									<%=i+1%>
								</td>
								<td>
									<%=students.get(i).getName()%>
								</td>
								<td>
									<%=students.get(i).getXh()%>
								</td>
								<td>
									<%=Factory.getDepartmentManage().getDepartMentById(students.get(i).getDepartment()).getDname()%>
								</td>
								<td>
							   <%=Factory.getProfessionalManage().getProFeProfessionalById(students.get(i).getProfessionalId()).getPname()%>

								</td>
								<td>
									<%= students.get(i).getSex() %>
								</td>

								<td><%= students.get(i).getAge() %></td>
								<td><button type="button" class="edit btn btn-primary"
										title="<%=students.get(i).getUid() %>"  id="edit">
										<i class="icon-edit"></i> 查看成绩
									</button></td>
							</tr>

						</tbody>
						<%
							}
						%>
					</table>
				</div>

			</div>
		</div>
		<div class="footer">
			<div class="col-md-3 col-md-offset-5">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>
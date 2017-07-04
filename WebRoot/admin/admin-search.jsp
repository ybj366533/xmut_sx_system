<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String txt ="";
if(request.getParameter("txt")!=null){
	 txt=request.getParameter("txt");
}
 List<UsersJson> userslList = Factory.getUserManageImp().select_userList(txt);

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
<link rel="stylesheet" type="text/css" href="<%=path %>/css/layer.css">
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>
	
   <script type="text/javascript">
    $(document).ready(function(){
 	$('.delete').click(function(){
 		$.post("../login.action?opt=deleteusers",
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
 	   id : 'editstudent',
 	   title:'编辑学生',
  	   href:"admin/admin-update-users.jsp?uid="+uid,
  		});
} 
 	});
 	
 	$('#add').click(function(){
 	if(top.topManager){
  	top.topManager.openPage({id:'users-add',text:'添加用户',href:'admin/admin-add-users.jsp'});
 	}
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
						<ul class="nav navbar-nav navbar-right">
							<form class="navbar-form ">
								<button type="button" class="btn btn-primary" id="add" >
									<i class="icon-plus"></i> 添加
								</button>
							</form>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<form class="navbar-form navbar-left" role="search">
								<div class="input-group">

									<input type="text" class="form-control">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default" tabindex="-1" id="btn-search">
											<i class="icon-search"></i> 搜索
										</button>
										<button type="button"
											class="btn btn-default dropdown-toggle"
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
							<span>用户名:</span> 
							<input type="text" class="form-control"placeholder="用户名" id="name-search"> 
							<span>编号:</span> 
							<input type="text"class="form-control" placeholder="学号／教工号" id="extn-search">
							<span>用户类别:</span>
							<div class="input-group" id="dropdown">
									<div id="dropdown1" class="dropdown">
										<div class="btn-group">
											<button type="button" class="btn btn-default" data-toggle="dropdown" id="button-type"><!--选中option之后，要在这里显示选中值，类似原始select里面的文本框-->
												<span class="placeholder">学生</span>
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownmenu1">
												<li role="presentation" value="1">
													<a role="menuitem" tabindex="1" href="javascript:void(0);">学生</a>
												</li>
												<li role="presentation" value="2">
													<a role="menuitem" tabindex="2" href="javascript:void(0);">教师</a>
												</li>
												<li role="presentation" value="3">
													<a role="menuitem" tabindex="3" href="javascript:void(0);">管理员</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							<button type="button" class="btn btn-primary"
								id="btn-advanced-search">
								<i class="icon-search"></i> 查询
							</button>
						</form>
					</div>

				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr class="active">
								<th>序号</th>
								<th>用户ID</th>
								<th>用户名</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>权限</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<%
						
							for (int i = 0; i < userslList.size(); i++) {
						%>
						<tbody>

							<tr>
								<td>
									<%
										out.println(i);
									%>
								</td>
								<td>
									<%
										out.println(userslList.get(i).getUserName());
									%>
								</td>
								<td>
									<%
										out.println(userslList.get(i).getUid());
									%>
								</td>
								<td>
									<%
										out.println(userslList.get(i).getEmail());
									%>
								</td>
								<td>
									<%
										out.println(userslList.get(i).getMobile());
									%>
								</td>
								<td>
									<%
										out.println(userslList.get(i).getRole());
									%>
								</td>

								<td><button type="button" class="delete btn btn-danger"
										id="delete" title="<%=userslList.get(i).getUid()%>">
										<i class="icon-trash"></i> 删除
									</button></td>
								<td><button type="button" class="edit btn btn-primary"
										id="edit" title="<%=userslList.get(i).getUid()%>" >
										<i class="icon-edit"></i> 编辑
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

<script type="text/javascript">
			function customdropdown(ele) {
				this.dropdown = ele;
				this.placeholder = this.dropdown.find(".placeholder");
				this.options = this.dropdown.find("ul.dropdown-menu > li");
				this.val = '';
				this.index = -1; //默认为-1;
				this.initevents();
				
			}
			customdropdown.prototype = {
				initevents: function() {
					var obj = this;
					//这个方法可以不写，因为点击事件被bootstrap本身就捕获了，显示下面下拉列表
					obj.dropdown.on("click", function(event) {
						$(this).toggleclass("active");
					});

					//点击下拉列表的选项
					obj.options.on("click", function() {
						var opt = $(this);
						obj.text = opt.find("a").text();
						obj.val = opt.attr("value");
						obj.index = opt.index();
						obj.placeholder.text(obj.text);
					});
				},
				gettext: function() {
					return this.text;
				},
				getvalue: function() {
					return this.val;
				},
				getindex: function() {
					return this.index;
				}
			}
			$(document).ready(function() {
				var mydropdown = new customdropdown($("#dropdown1"));
			});
		</script>
</body>

</html>
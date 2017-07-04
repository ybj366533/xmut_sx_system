<%@page import="com.test.model.Subitem"%>
<%@page import="com.test.model.Subject"%>
<%@page import="com.test.model.SubitemJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Professional professional = null;
	List<Subject> subjects = null;
	List<SubitemJson> subitemJsons = null;
	if (request.getParameter("pid") != null) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		professional = Factory.getProfessionalManage().getProFeProfessionalById(pid);
		subjects = Factory.getSubjectManage().getSubjectByPid(pid);
		subitemJsons = Factory.getSubitemManage().getSubitemJsonByPid(pid);
	}
	Map<String, SubitemJson> sMap= new HashMap<String, SubitemJson>();
	if(subitemJsons!=null){
		for(int i =0;i<subitemJsons.size();i++){
			String mString = subitemJsons.get(i).getMkey();
			sMap.put(mString, subitemJsons.get(i));
		}
	}
%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

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

<link rel="stylesheet" href="../assets/css/style.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- JQuery -->
<script src="<%=path%>/assets/jquery-3.2.1.js"></script>
<!-- Bootstrap -->
<script src="../assets/bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		///// 提交按钮单击/////
		$('#btn-add').click(function() {
			$.post("../test.action?opt=savesubitem", {
				pid : $("#pid").attr("title"),
				sid : $("#sid").val(),
				days : $("#days").val(),
				number : $("#number").val(),
				address : $('#address').val()
			},
				function(data, status) {
					if (data == "true") {
						layer.msg("添加成功");
						location.reload();
					} else {
						layer.msg("添加失败");
					}
				}, "html");
			return false;
		});
		$('#refresh').click(function(){
 	location.reload();
 	});
		$('#delete').click(function() {
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
							<%if (professional != null) {%> value="<%=professional.getPname()%>"
							title="<%=request.getParameter("pid")%>" <%}%>
							placeholder="专业名称" id="pid" data-rules="{required:true}">
						<span>课程选择:</span> <select id="sid" class="input-small"
							name="professional">
							<%
								if (subjects != null) {
									for (Subject subject : subjects) {
							%>
							<option value="<%=subject.getId()%>">
								<%=subject.getName()%>
							</option>
							<%
								}
								}
							%>
						</select> <span>上课地址:</span> <input type="text" class="form-control"
							placeholder="上课地址" id="address">
						<div>
							<br> <span>星期:</span> <select id="days" class="input-small"
								name="professional">

								<option value="Monday">Monday</option>
								<option value="Tuesday">Tuesday</option>
								<option value="Wednesday">Wednesday</option>
								<option value="Thursday">Thursday</option>
								<option value="Friday">Friday</option>
								<option value="Saturday">Saturday</option>
								<option value="Sunday">Sunday</option>

							</select> <span>第:</span> <select id="number" class="input-small"
								name="professional">

								<option value="1">第一节</option>
								<option value="2">第二节</option>
								<option value="3">第三节</option>
								<option value="4">第四节</option>

							</select>
							<p>
								<br />
								<button type="button" class="btn btn-primary" id="btn-add"
									title="<%=request.getParameter("pid ")%>">
									<i class="icon-plus"></i> 添加
								</button>
								<button type="button" class="delete btn btn-danger" id="delete">
									<i class="icon-trash"></i> 删除
								</button>
								<button type="button" class="btn btn-success" id="refresh" >
									<i class="icon-refresh"></i> 刷新
								</button>

							</p>
						</div>
				</div>
				</form>

			</div>
		</div>
	</div>
	<div id="calendar">
		<div id="calcontainer">

			<div id="daysweek">
				<div class="dayweek">
					<p>Monday</p>
				</div>
				<div class="dayweek">
					<p>Tuesday</p>
				</div>
				<div class="dayweek">
					<p>Wednesday</p>
				</div>
				<div class="dayweek">
					<p>Thursday</p>
				</div>
				<div class="dayweek">
					<p>Friday</p>
				</div>
				<div class="dayweek">
					<p>Saturday</p>
				</div>
				<div class="dayweek brn">
					<p>Sunday</p>
				</div>
			</div>
			<div id="daysmonth">

				<!---------------------------------------- week  ---------------------------------------->
				<div class="week">
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="yellow"></li>
								<li class="green"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Monday1")!=null){
									SubitemJson subitemJson = sMap.get("Monday1");
									out.println("08:00"+"《"+subitemJson.getSubjectname()+"》:"+subitemJson.getAddress());
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Monday2")!=null){
									SubitemJson subitemJson = sMap.get("Monday2");
									out.println("10:00"+"《"+sMap.get("Monday2").getSubjectname()+"》:"+subitemJson.getAddress());
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Monday3")!=null){
									SubitemJson subitemJson = sMap.get("Monday3");
									out.println("14:00"+"《"+sMap.get("Monday3").getSubjectname()+"》:"+subitemJson.getAddress());
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Monday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Monday4").getSubjectname()+"》:");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="red"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Tuesday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Tuesday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Tuesday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Tuesday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Tuesday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Tuesday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Tuesday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Tuesday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="yellow"></li>
								<li class="yellow"></li>
								<li class="green"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Wednesday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Wednesday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Wednesday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Wednesday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Wednesday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Wednesday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Wednesday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Wednesday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="red"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Thursday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Thursday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Thursday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Thursday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Thursday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Thursday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Thursday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Thursday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="yellow"></li>
								<li class="blue"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Friday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Friday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Friday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Friday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Friday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Friday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Friday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Friday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="red"></li>
								<li class="blue"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Saturday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Saturday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Saturday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Saturday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Saturday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Saturday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Saturday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Saturday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
					<div class="day brn">
						<div class="daybar">
							<p></p>
						</div>
						<div class="dots">
							<ul>
								<li class="yellow"></li>
								<li class="green"></li>
							</ul>
						</div>
						<!-- slide open -->
						<div class="open">
							<ul>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Sunday1")!=null){
									
									out.println("08:00"+"《"+sMap.get("Sunday1").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="yellow l4 a1">
									<p><%if(sMap.get("Sunday2")!=null){
									
									out.println("10:00"+"《"+sMap.get("Sunday2").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a2">
									<p><%if(sMap.get("Sunday3")!=null){
									
									out.println("14:00"+"《"+sMap.get("Sunday3").getSubjectname()+"》");
									} %></p>
								</li>
								<li class="green l4 a1">
									<p><%if(sMap.get("Sunday4")!=null){
									
									out.println("16:00"+"《"+sMap.get("Sunday4").getSubjectname()+"》");
									} %></p>
								</li>
							</ul>
						</div>
						<!-- slide closed -->
					</div>
				</div>

			</div>
		</div>
		<div id="calcat">
			<div class="caldot blue"></div>
			<p></p>
			<div class="caldot yellow"></div>
			<p></p>
			<div class="caldot green"></div>
			<p></p>
			<div class="caldot red"></div>
			<p></p>
			<br>

		</div>
	</div>
	</div>

</body>

</html>
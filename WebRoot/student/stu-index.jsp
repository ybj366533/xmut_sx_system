<%@page import="com.test.model.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Student student=null;
if(session.getAttribute("student")!=null){
student=(Student)session.getAttribute("student");
}%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>厦门理工学院学生信息管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=path%>/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  	<link href="<%=path%>/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
  	<link href="<%=path%>/assets/css/main-min.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
   <body>

  <div class="header">
    
      <div class="dl-title">
         <span class="dl-title-text">厦门理工学院学生信息管理系统</span>
        </a>
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user"><%=student.getName()%></span>
    	<a href="login.action?opt=logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">个人资料</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="<%=path %>/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="<%=path %>/assets/js/bui.js"></script>
  <script type="text/javascript" src="<%=path %>/assets/js/config.js"></script>

  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'home', 
          homePage : 'home',
          menu:[{
              text:'公告',
              items:[
                {id:'home',text:'公告',href:'student/student-main.jsp',closeable : false},
                {id:'time',text:'课程表',href:'student/school-timetable.jsp'},
                {id:'his-grade',text:'成绩查询',href:'student/history-grade.jsp'},
                {id:'code',text:'学生资料',href:'student/stu-information.jsp'},
                {id : 'edit',text:'个人设置', href:"student/student-update-users.jsp"},
                //{id:'bbs',text:'留言板',href:'student/message-border.jsp'},
                //{id:'his-grade',text:'成绩查询',href:'student/history-grade.jsp'},
                //{id:'bbs',text:'留言板',href:'student/message-border.jsp'},
                //{id:'test-rule',text:'考试规则',href:'student/text-rule.jsp'},              
              ]
            }
             ]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
<div style="display:none">
<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='UTF-8'>
		
</script></div>
  </body>
</html>

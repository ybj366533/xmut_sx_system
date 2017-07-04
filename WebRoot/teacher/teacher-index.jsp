<%@page import="com.test.model.Teacher"%>
<%@page import="com.test.model.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher=null;
if(session.getAttribute("teacher")!=null){
teacher=(Teacher)session.getAttribute("teacher");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'tea-index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

   <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <body>

  <div class="header">
    
      <div class="dl-title">
         <span class="dl-title-text">厦门理工学院学生信息管理系统</span>
        </a>
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user"><%=teacher.getName()%></span><a href="login.action?opt=logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">学生信息管理</div></li>
        
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="./assets/js/bui.js"></script>
  <script type="text/javascript" src="./assets/js/config.js"></script>

  <script>
    BUI.use('common/main',function(){
      var config = [{
      
          id:'menu', 
          homePage : 'home',
          menu:[{
             text:'公告',
                items:[
                {id:'home',text:'公告',href:'teacher/teacher-main.jsp'},
                 {id:'pushwork',text:'发布作业',href:'teacher/teacher-works-post.jsp'},
                 {id:'time',text:'上课日程表',href:'teacher/school-timetable.jsp'},
                 {id:'update',text:'个人设置',href:'teacher/teacher-update-users.jsp'}, 
                ]
              }]
          },{
            id:'form',
            menu:[{
                text:'学生信息管理',
                items:[
                  
                 //{id:'introduce',text:'新增学生',href:'teacher/stu-add.jsp'},
                //{id:'stu-update',text:'修改学生信息',href:'teacher/stu-update.jsp'},
                	{id:'select',text:'查询学生资料',href:'teacher/teacher-select-users.jsp'},
                   {id:'code',text:'查询学生成绩',href:'teacher/score.jsp'},
                   {id:'sco-add',text:'新增学生成绩',href:'teacher/teacher-add-score.jsp'}
                ]
              }]
              },{
            id:'search',
            menu:[{
                text:'题库信息管理',
                items:[
                 {id:'add',text:'新增科目',href:'teacher/add.jsp'},
                {id:'revise',text:'修改试卷',href:'teacher/revise.jsp'},
                {id:'delete',text:'删除试卷',href:'teacher/delete.jsp'},
                {id:'examine',text:'查看试卷',href:'teacher/examine.jsp'} 
                ]
              },{
                text : '成绩管理',
                items : [
                   {id:'code',text:'查询学生成绩',href:'teacher/score.jsp',closeable : false},
                    {id:'add',text:'新增学生成绩',href:'teacher/add-sco.jsp'}
                ]
              }]
          },{
            id:'detail',
            menu:[{
                text:'详情页面',
                items:[
                  {id:'code',text:'详情页面代码',href:'detail/code.html'},
                  {id:'example',text:'详情页面示例',href:'detail/example.html'},
                  {id:'introduce',text:'详情页面简介',href:'detail/introduce.html'}
                ]
              }]
          
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
  </body>
</html>

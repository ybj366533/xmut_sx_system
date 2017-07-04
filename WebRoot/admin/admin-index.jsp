<%@page import="com.test.model.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Users user=null;
if(session.getAttribute("admin")!=null){
user=(Users)session.getAttribute("admin");
System.out.print(user.getLoginId());
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'admin-index.jsp' starting page</title>
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

    <div class="dl-log">欢迎您，<span class="dl-log-user" id="loginId"><%=user.getLoginId()%></span><a href="login.action?opt=logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">学生信息管理</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">用户信息管理</div></li>
        
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
     	var uid=$("#loginId").val();
    
      var config = [{
          id:'menu', 
          homePage : 'home',
          menu:[{
             text:'首页',
                items:[
                {id:'home',text:'公告',href:'admin/admin-main.jsp'},
                {id:'examine',text:'发布公告',href:'admin/admin-text-post.jsp'},
                {id:'update',text:'个人设置',href:'admin/update-users.jsp'},
                ]
              },{
                text : '专业信息管理管理',
                items : [
                   {id:'class',text:'查询专业信息',href:'admin/admin-class.jsp'},
                   {id:'addclass',text:'添加专业信息',href:'admin/admin-add-class.jsp'},
                   {id:'addcourse',text:'添加专业课程',href:'admin/admin-add-subject.jsp'}
              ]
           
            },
            {
                text : '成绩管理',
                items : [
                	{id:'code',text:'学生信息管理',href:'admin/stu-select.jsp'},
                   {id:'select',text:'查询学生资料',href:'admin/teacher-select-users.jsp'},
                   {id:'code',text:'查询学生成绩',href:'admin/score.jsp'},
                   {id:'sco-add',text:'新增学生成绩',href:'admin/admin-set-score.jsp'}
              ]
           
            }]
          },{
            id:'form',
            menu:[{
                text : '用户信息管理',
                items : [
                   {id:'users',text:'用户管理',href:'admin/admin-users.jsp'},
                 
                   {id:'users-add',text:'添加管理员用户',href:'admin/admin-add-users.jsp'},
                   {id:'users-add-teacher',text:'添加教师用户',href:'admin/admin-add-teacher.jsp'},
                   {id:'users-add-student',text:'添加学生用户',href:'admin/admin-add-student.jsp'}
              ]
            }]
              },{
            id:'search',
            menu:[{
                text:'题库信息管理',
                items:[
                 {id:'add',text:'新增科目',href:'admin/add.jsp'},
                {id:'revise',text:'修改试卷',href:'admin/revise.jsp'},
                {id:'delete',text:'删除试卷',href:'admin/delete.jsp'},
                {id:'examine',text:'查看试卷',href:'admin/examine.jsp'} 
                ]
              },{
                text : '成绩管理',
                items : [
                   {id:'code',text:'查询学生成绩',href:'admin/score.jsp',closeable : false},
                    {id:'add',text:'新增学生成绩',href:'admin/add-sco.jsp'}
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

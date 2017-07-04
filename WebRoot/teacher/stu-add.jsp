<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Department> departments=Factory.getDepartmentManage().getDepartments();
List<Professional> professionals=Factory.getProfessionalManage().getProfessionals();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加学生</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
   <link rel="stylesheet" type="text/css" href="<%=path %>/css/layer.css">
   	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>	
<script type="text/javascript" src="<%=path %>/js/layer.js"></script>
   <script type="text/javascript">
   	$(document).ready(function(){						
	///// 提交按钮单击/////
	$('#save').click(function(){		
		$.post("login.action?opt=addstudent",
			        {
			          name:$("#name").val(),
			          xh:$("#xh").val(),
			          sex:$("#sex").val(),
					  age: $("#age").val(),
					  department: $("#department").val(),
					  professional:$("#professional").val(),
					  tiketId: $("#tiketId").val(),
					  loginId:$("#loginId").val(),
					  password:$("#password").val(),
			        },
			        function(data,status){			           
			        	if(data=="true")
			            {
			            	layer.msg("更新资料成功");
				        		if(top.topManager){
						  	top.topManager.openPage({
						 	   id : 'select-student',
						 	   title:'查询学生资料',
						  	   href:"tea/stu-select.jsp",
						  	   isClose :true,
						  		});
	 						}
			            }
			            else{
			            	layer.msg("更新资料失败");
			            	
			            }
			        },"html");
		return false;
	}
	);
});
   
   </script>
 </head>
 <body>
  
  <div class="container">
    <div class="row">
      <form id="J_Form" class="form-horizontal span24">
      <div class="row">
     	 <div class="control-group span8">
            <label class="control-label"><s>*</s>登录名</label>
            <div class="controls">
              <input name="loginId" id="loginId" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
          <div class="control-group span8">
            <label class="control-label"><s>*</s>密码</label>
            <div class="controls">
              <input name="password" id="password" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
          
          
      </div>
        <div class="row">
          <div class="control-group span8">
            <label class="control-label"><s>*</s>姓名：</label>
            <div class="controls">
              <input name="name" id="name" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
          <div class="control-group span8">
            <label class="control-label"><s>*</s>学号：</label>
            <div class="controls">
              <input name="xh" id="xh" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
           <div class="control-group span8">
            <label class="control-label"><s>*</s>准考证号：</label>
            <div class="controls">
              <input name="tiketId" id="tiketId" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
          
        </div>
        <div class="row">
          <div class="control-group span15">
            <label class="control-label">所属院系：</label>
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select id="professional" class="input-small" name="professional">
                <%
                	for(Department department : departments){
                 %>
                <option value="<%=department.getDid()%>"><%=department.getDname()%></option>
                <%} %>
              </select>
              <select class="input-small" id="department"  name="department" >
               <%
                	for(Professional professional : professionals){
                 %>
              <option value="<%=professional.getPid()%>"><%=professional.getPname()%></option>
              <%} %>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>性别：</label>
            <div class="controls">
              <input name="sex" id="sex" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 
           <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>年龄：</label>
            <div class="controls">
              <input name="age" id="age" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 
        <div class="row form-actions actions-bar">
            <div class="span13 offset3 ">
              <button type="submit" id="save" class="button button-primary">保存</button>
              <button type="reset" class="button">重置</button>
            </div>
        </div>
      </form>
    </div>
  </div>
  </body>
</html>

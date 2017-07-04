<%@page import="com.test.service.Factory"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.test.model.Professional"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Professional> professionals=Factory.getProfessionalManage().getProfessionals();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aad.jsp' starting page</title>
    
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
		$.post("test.action?opt=saveSubject",
			        {
			          pid:$("#pid").val(),
			          name:$("#name").val(),
			          nature:$("#nature").val(),
					  credit: $("#credit").val(),
			        },
			        function(data,status){			           
			        	if(data=="true")
			            {
			            	layer.msg("更新资料成功");
			        		location.reload();
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
            <label class="control-label"><s>*</s>课程名称：</label>
            <div class="controls">
              <input name="name" id="name" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
        </div>
        <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>课程性质：</label>
            <div class="controls">
              <input name="nature" id="nature" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 
           <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>学分：</label>
            <div class="controls">
              <input name="credit" id="credit" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 
     <div class="row">
          <div class="control-group span15">
            <label class="control-label">所属院系：</label>
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select class="input-small"  name="pid" id="pid">
               <%
                	for(Professional professional : professionals){
                 %>
              <option value="<%=professional.getPid()%>"><%=professional.getPname()%></option>
              <%} %>
              </select>
              
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

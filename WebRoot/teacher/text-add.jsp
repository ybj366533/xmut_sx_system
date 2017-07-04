<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Subject"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Subject> subjects=Factory.getSubjectManage().getSubjectByPid(-1);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'text-add.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="css/text-add.css" />
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
		$.post("test.action?opt=savetest",
			        {
			          sid:$("#subject").val(),
			          content:$("#content").val(),
			          option:$("#option").val(),
					  a: $("#A").val(),
					  b: $("#B").val(),
					  c:$("#C").val(),
					  d: $("#D").val(),
			        },
			        function(data,status){			           
			        	if(data=="true")
			            {
			            	layer.msg("添加题目成功");
				        		if(top.topManager){
						  	top.topManager.openPage({
						 	   id : 'add-test',
						 	   title:'查询学生资料',
						  	   href:"tea/text-select.jsp",
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
            <label class="control-label"><s>*</s>科目：</label>
            <div class="controls">
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select id="subject" class="input-small" name="subject">
                <%
                	for(Subject subject : subjects){
                 %>
                <option value="<%=subject.getId()%>"><%=subject.getName()%></option>
                <%} %>
              </select>
            </div>
			</div>
          </div>
        </div>
        <div class="row">
          <div class="control-group span15">
            <label class="control-label">内容：</label>
            <div class="controls control-row4">
              <textarea name="content" id="content" class="input-large bui-form-field" data-tip="{text:'请填写备注信息！'}" type="text" aria-disabled="false" aria-pressed="false"></textarea>
          </div>
        </div>
        <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>正确答案选项</label>
            <div class="controls">
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select id="option" class="input-small" name="option">
                 <option value="0">A</option>
                 <option value="1">B</option>
                 <option value="2">C</option>
                 <option value="3">D</option>
              </select>
            </div>
			</div>
           </div>
           </div> 
           <div class="row">
         	<div class="control-group span8">
            <label class="control-label"><s>*</s>A：</label>
            <div class="controls">
              <input name="A" id="A" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           <div class="control-group span8">
            <label class="control-label"><s>*</s>B：</label>
            <div class="controls">
              <input name="B" id="B" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           <div class="control-group span8">
            <label class="control-label"><s>*</s>C：</label>
            <div class="controls">
              <input name="C" id="C" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           <div class="control-group span8">
            <label class="control-label"><s>*</s>D：</label>
            <div class="controls">
              <input name="D" id="D" type="text" data-rules="{required:true}" class="input-normal control-text">
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

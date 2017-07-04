<%@page import="com.test.model.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("teacher")==null)
return;

Teacher teacher=null;
if(session.getAttribute("teacher")!=null){
teacher=(Teacher)session.getAttribute("teacher");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add-sco.jsp' starting page</title>
    
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
 </head>
 <body>
  
  <div class="container">
    <div class="row">
      <form id="J_Form" class="form-horizontal span24">
        <div class="row">
          <div class="control-group span8">
            <label class="control-label"><s>*</s>姓名：</label>
            <div class="controls">
              <input name="id" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
          </div>
          <div class="control-group span8">
            <label class="control-label"><s>*</s>学号：</label>
            <div class="controls">
              <input name="id" type="text" data-rules="{required:true}" class="input-normal control-text">
                
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="control-group span15">
            <label class="control-label">所属院系：</label>
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select  class="input-small" name="province" value="信息系">
                <option>请选择部门</option>
              </select>
              <select class="input-small"  name="department" value="软件技术"><option>请选择专业</option></select>
              
            </div>
          </div>
        </div>
        <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>课程名称：</label>
            <div class="controls">
              <input name="id" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 
           <div class="row">
         <div class="control-group span8">
            <label class="control-label"><s>*</s>分数：</label>
            <div class="controls">
              <input name="id" type="text" data-rules="{required:true}" class="input-normal control-text">
            </div>
           </div>
           </div> 

        <div class="row">
          <div class="control-group span15">
            <label class="control-label">备注：</label>
            <div class="controls control-row4">
              <textarea name="memo" class="input-large" data-tip="{text:'请填写备注信息！'}" type="text"></textarea>
            </div>
          </div>
        </div>
        <div class="row form-actions actions-bar">
            <div class="span13 offset3 ">
              <button type="submit" class="button button-primary">保存</button>
              <button type="reset" class="button">重置</button>
            </div>
        </div>
      </form>
    </div>
    

  </div>
  
  </body>
</html>

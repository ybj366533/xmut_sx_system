<%@page import="com.test.model.Answer"%>
<%@page import="com.test.model.Test"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Subject"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Subject subject=null;
List<Test> tests=null;
int sid=-1;
if(request.getParameter("sid")!=null){
	 sid=Integer.parseInt(request.getParameter("sid"));
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'revise.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link href="css/text-update.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    code {
      padding: 0px 4px;
      color: #d14;
      background-color: #f7f7f9;
      border: 1px solid #e1e1e8;
    }
   </style>
      <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
      <script type="text/javascript" src="assets/js/bui-min.js"></script>
  <script type="text/javascript" src="assets/js/config-min.js"></script>
   <link rel="stylesheet" type="text/css" href="css/layer.css">
  <script type="text/javascript" src="js/layer.js"></script>	
  <script type="text/javascript">
 $(document).ready(function(){
 	var text;
	$.ajax(
			{url:"test.action?opt=gettestsbysid&sid=<%=sid%>",async:false,success: function(data, textStatus){
		        text=data;
		      },dataType:"json"}			
	);	
 	for(var j=0;j<text.length;j++){
			var answers="";
				for(var i=0;i<text[j]['answers'].length;i++){
					answers+='<td>'+text[j]['answers'][i]['content']+'</td>';
					if(text[j]['answers'][i]['id']==text[j]['answerid']){
						var answer='<td>'+text[j]['answers'][i]['content']+'</td>'
					}
				}
			var header='<td>'+(j+1)+'</td>'; 
			var content='<td>'+text[j]['content']+'</td>';
			var grade='<td>'+text[j]['grade']+'</td>';
			var button='<td><input id="edit" type="button" title="'+text[j]['id']+'" onclick="onedit('+text[j]['id']+')"  value="编辑"/><input type="button" title="'+text[j]['id']+'" id="delete" onclick="ondelete('+text[j]['id']+')"  value="删除"/></td>';
			var start='<tr>';
			var end='</tr>';
			$("table").append(start+header+content+grade+answer+answers+button+end);
		}
	
 	$('.delete').click(function(){
 		$.post("test.action?opt=deletetest",
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
 	
 	/*$('#edit').click(function(){
 		var tid=$(this).attr("title");
 		if(top.topManager){
  	top.topManager.openPage({
 	   id : 'editanswers',
 	   title:'编辑试题',
 	    isClose :true,
  	   href:"tea/answer-edit.jsp?tid="+tid,
  		});
} 		
 	});*/
 	
 	$('#addstudent').click(function(){
 	if(top.topManager){
  	top.topManager.openPage({
 	   id : 'addtext',
 	   title:'添加试卷',
 	    isClose :true,
  	   href:"tea/text-add.jsp",
  		});
 	}
 	});
 });
 function ondelete(tid){
 	$.post("test.action?opt=deletetest",
	        				        {
	        						  id: tid,
	        				        },
	        				        function(data,status){			           
	        				        	if(data=="true")
	        				            {
	        				        		layer.msg("删除成功");
	        				        		top.topManager.reloadPage();
	        				            }
	        				            else{
	        				            	layer.msg("删除失败");
	        				            	top.topManager.reloadPage();
	        				            }
	        				        },"html");
 }
 function onedit(tid){
 		if(top.topManager){
  	top.topManager.openPage({
 	   id : 'editanswers',
 	   title:'编辑试题',
 	    isClose :true,
  	   href:"tea/answer-edit.jsp?tid="+tid,
  		});
} 		
 	
 }
 </script>
 </head>
 <body>
  
  <div class="container">
    <form id ="J_Form" class="form-horizontal">
      <!--    -->
      <h3>基本信息</h3>
      <div class="row">
        <div class="control-group span12">
          <label class="control-label"><s>*</s>课程名称：</label>   
        </div>
      <div class="row">
          <div class="control-group span15">
            </div>
          </div>
        </div>
      <hr/>
      <div class="text-update">
      	<table>
      	<thead>
      		<td>题号</td>
      		<td>题目内容</td>
      		<td>分值</td>
      		<td>正确答案</td>
      		<td>A</td>
      		<td>B</td>
      		<td>C</td>
      		<td>D</td>
      		<td>修改</td>
      	</thead>
      	<tbody>
      		
      	</tbody>
      	</table>
      </div>
    </form>
  </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="assets/js/bui-min.js"></script>
  <script type="text/javascript" src="assets/js/config-min.js"></script>
  </body>
</html>

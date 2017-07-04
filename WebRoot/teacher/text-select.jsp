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
    
    <title>My JSP 'examine.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="assets/css/prettify.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="css/stu-select.css" />
   <style type="text/css">
	 <link rel="stylesheet" href="css/text-select.css" />
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
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
 	$('.delete').click(function(){
 		$.post("test.action?opt=deletesubject",
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
 		var sid=$(this).attr("title");
 		if(top.topManager){
  	top.topManager.openPage({
 	   id : 'editgrade',
 	   title:'编辑试卷',
  	   href:"tea/text-update.jsp?sid="+sid,
  		});
} 		
 	});
 	$('#addstudent').click(function(){
 	if(top.topManager){
  	top.topManager.openPage({
 	   id : 'addtext',
 	   title:'添加试卷',
  	   href:"tea/text-add.jsp",
  		});
 	}
 	});
 });
 
 </script>
  </head>
  
  <body>
  
  <div class="container">
    <div id="grid">
    <div class="bui-grid bui-simple-list bui-grid-width bui-grid-border bui-grid-strip"
    aria-disabled="false" aria-pressed="false">
        <div class="bui-grid-tbar" style="">
            <div class="bui-bar" role="toolbar" id="bar2" aria-disabled="false" aria-pressed="false">
                <ul class="bui-bar bui-grid-button-bar" role="toolbar" id="bar4" aria-disabled="false"
                aria-pressed="false">
                    <li class="bui-bar-item-button bui-bar-item bui-inline-block" aria-disabled="false"
                    id="bar-item-button1">
                        <button type="button" id="addstudent" class="button button-small">
                            <i class="icon-plus">
                            </i>
                            添加
                        </button>
                    </li>
                </ul>
            </div>
        </div>
        <div class="bui-grid-body" >
            <table cellspacing="0" cellpadding="0" class="bui-grid-table">
            <thead>
            	 <tr>
                            <th class="bui-grid-hd" aria-disabled="false" style="width: 109px;" aria-pressed="false">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        课程代码
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>
                            <th class="bui-grid-hd" aria-disabled="false" style="width: 109px;" aria-pressed="false">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        课程名称
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>
                            <th class="bui-grid-hd" aria-disabled="false" style="width: 109px;">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        课程性质
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>

                            <th class="bui-grid-hd" aria-disabled="false" style="width: 107px;">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        学分
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>
							<th class="bui-grid-hd" aria-disabled="false" style="width: 107px;">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        删除
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>
                            <th class="bui-grid-hd" aria-disabled="false" style="width: 107px;">
                                <div class="bui-grid-hd-inner">
                                    <span class="bui-grid-hd-title">
                                        编辑
                                    </span>
                                    <span class="bui-grid-sort-icon">
                                        &nbsp;
                                    </span>
                                </div>
                            </th>
                        </tr>
            
            </thead>
                <tbody>
                   <%for(Subject subject : subjects){
                    %>
                    <tr class="bui-grid-row bui-grid-row-odd">
                        <td class="  bui-grid-cell grid-td-col1" data-column-id="col1" data-column-field="name">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                   <%=subject.getId() %>
                                </span>
                            </div>
                        </td>
                        <td class="  bui-grid-cell grid-td-col2" data-column-id="col2" data-column-field="xh">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                    <%=subject.getName()%>
                                </span>
                            </div>
                        </td>
                        <td class="  bui-grid-cell grid-td-col3" data-column-id="col3" data-column-field="professionalId">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                <%=subject.getNature()%>
                                </span>
                            </div>
                        </td>
                        <td class="  bui-grid-cell grid-td-col4" data-column-id="col4" data-column-field="department">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                    <%=subject.getCredit()%>
                                </span>
                            </div>
                        </td>
                      
                        <td class="  bui-grid-cell grid-td-col5" data-column-id="col5" data-column-field="sex">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                     <button class="delete" title="<%=subject.getId()%>" href="">删除</button>
                                </span>
                            </div>
                        </td>
                        <td class="  bui-grid-cell grid-td-col5" data-column-id="col5" data-column-field="sex">
                            <div class="bui-grid-cell-inner">
                                <span class="bui-grid-cell-text " title="">
                                     <button class="edit" title="<%=subject.getId()%>" href="">编辑</button>
                                </span>
                            </div>
                        </td>
                    </tr>
                  <%} %> 
                </tbody>
            </table>
        </div>
        <div style="display:none" class="bui-grid-bbar">
        </div>
    </div>
</div>
    <p>
    </p>
    <div class="row">
    </div>
    </div>
  </body>
</html>

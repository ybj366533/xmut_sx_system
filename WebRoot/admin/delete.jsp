<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/delete.css" />
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <div class="header">
    <ul>
    <li class="lable">课程代码
    <li><input id="field" size=30 name=field>
    </li>
    </ul>
    <label for="submit">&nbsp;</label>
   <input class="submit" id="submit" type="submit" value="查询" name="submit">
    <table class="chart" summary="list of members in EE Studay">
   <tr>
   <th scope="col">课程代码</th>
   <th scope="col">课程名称</th>
   <th scope="col">课程性质</th>
   <th scope="col">学分</th>
   <th scope="col">题型</th>
   <th scope="col">命题人</th>
   </tr>
   <tr>
   <td>9954</td>
   <td>数据结构</td>
   <td>必修</td>
   <td>6</td>
   <td>单选、填空、简答</td>
   <td>郎川萍</td>
   </tr>
   </table>
    <input class="submit1" id="submit" type="submit" value="删除" name="submit">
    <input class="reset" type="reset" value="取消" name="reset">
    </div>
  </body>
</html>

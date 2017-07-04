<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sco-update.jsp' starting page</title>
    
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
    <form id ="J_Form" class="form-horizontal">
      <!--    -->
      
     
      <div class="row">
          <div class="control-group span15">
            <label class="control-label">系部专业：</label>
            <div class="controls bui-form-group-select"  data-type="professionalId">
              <select  class="input-small" name="province" value="信息系">
                <option>请选择部门</option>
              </select>
              <select class="input-small"  name="department" value="软件技术"><option>请选择专业</option></select>
              
            </div>
          </div>
        </div>
      <div class="row">
        <div class="span21 offset3 control-row-auto">
          <div id="grid"></div>
        </div>
      </div>
      
      <div class="row">
        <div class="form-actions offset3">
          <button type="submit" class="button button-primary">修改</button>
          <button type="reset" class="button">重置</button>
        </div>
      </div>
    </form>
  </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="assets/js/bui-min.js"></script>

  <script type="text/javascript" src="assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');
  </script>
  
<script type="text/javascript">
  BUI.use(['bui/grid','bui/data','bui/form'],function (Grid,Data,Form) {

    var columns = [ {title : '姓名',dataIndex :'name',editor : {xtype : 'text',rules:{required:true}}},
            {title : '学号',dataIndex :'xh',editor : {xtype : 'text',rules:{required:true}}},
           {title : '课程名称',dataIndex :'',editor : {xtype : 'text',rules:{required:true}}},
           {title : '分数',dataIndex :'score',editor : {xtype : 'text',rules:{required:true}}},
            {title : '时间',dataIndex :'time',editor : {xtype : 'text',rules:{required:true}}}
           
          ],
      //默认的数据
      data = [{"id":2,
        "time":{
            "nanos":0,
            "time":1433088000000,
            "minutes":0,
            "seconds":0,
            "hours":0,
            "month":5,
            "timezoneOffset":-480,
            "year":115,
            "day":1,
            "date":1
        },
        "student":{
            "id":3,
            "uid":11,
            "sex":"女",
            "xh":20131645,
            "professionalId":1,
            "department":1,
            "tiketId":10000002,
            "age":22,
            "name":"罗雪"
        },
        "score":90
    }
],
      store = new Data.Store({
        data:data
      }),
      editing = new Grid.Plugins.CellEditing(),
      grid = new Grid.Grid({
        render : '#grid',
        columns : columns,
        width : 700,
        forceFit : true,
        store : store,
        plugins : [Grid.Plugins.CheckSelection,editing],
        

      });
    grid.render();

   });
</script>
  </body>
</html>

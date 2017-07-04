<%@page import="com.test.model.UsersJson"%>
<%@page import="com.test.model.Professional"%>
<%@page import="com.test.service.Factory"%>
<%@page import="com.test.model.Department"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生</title>

<!--[if lt IE 9]>
      <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet"
	href="../assets/bootstrap-3.3.7/css/bootstrap-theme.css" media="screen" />
<!-- FontAwesome -->
<link rel="stylesheet"
	href="../assets/Font-Awesome-3.2.1/css/font-awesome.css" />
<link rel="stylesheet" href="../assets/bootstrap-3.3.7/css/index.css" type="text/css">
<!-- JQuery -->
<script src="<%=path%>/assets/jquery-3.2.1.js"></script>
<!-- Bootstrap -->
<script src="../assets/bootstrap-3.3.7/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/layer.css">
<script type="text/javascript" src="<%=path%>/js/layer.js"></script>

<script src="../assets/bootstrap-3.3.7/js//npm.js"></script>
<script src="../assets/bootstrap-3.3.7/js/bootstrap-wysiwyg.js" type="text/javascript"></script>
<script src="../assets/bootstrap-3.3.7/js/external/jquery.hotkeys.js" type="text/javascript"></script>
<link href="../assets/bootstrap-3.3.7/css/pill.css" rel="stylesheet" type="text/css">
<script src="../assets/bootstrap-3.3.7/js/jquery.scrollUp.min.js"></script>
<style type="text/css">
@import url('http://cdn.gbtags.com/summernote/0.5.2/summernote.css');

body {
	padding-top: 50px;
	padding-left: 50px;

}
#headdesc{
	position:relative;
}

#maincontent{
  position:relative;
}
 #editor {overflow:scroll; max-height:600px}
</style>
<!--[if lt IE 9]>
      <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->

</head>
<script>

		/* scrollUp Minimum setup */
		$(function () {
			$.scrollUp({
				scrollName: 'scrollUp',
				scrollText: '返回顶部',
				animationInSpeed: 200, 
		        animationOutSpeed: 200,
				});
		});
</script>
<body>

<form action="output.jsp?id=>" method="post">

<div class="col-lg-8">
  <div class="input-group">
    <div class="input-group-btn">
      <button type="button" class="btn btn-default 
                     dropdown-toggle" data-toggle="dropdown"> 
  
                   
                      <span class="caret"></span> 公告类型</button>
      <ul class="dropdown-menu">
        <li><a href="?id=1">管理员公告</a></li>
        <li><a href="?id=2">教师公告</a></li>
        <li><a href="?id=3">学生公告</a></li>
        <li class="divider"></li>
        <li><a href="?id=4">发布作业</a></li>
        <li><a href="?id=5">发布小吐槽</a></li>
      </ul>
    </div>
    <!-- /btn-group -->
    <input type="text" class="form-control" name="name" placeholder="标题">
      
       
  </div>
	


  <!-- /input-group --> 
  <br>
  

    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        </div>
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
          </ul>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
		  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
		    <div class="dropdown-menu input-append">
			    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
      </div>
      
      <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="" name="text">
    </div>
		<textarea class="form-control" rows="3" id="editor" name="tt">输入内容&hellip;</textarea>
    <div class="modal-footer">
       
        
        <button type="submit" class="btn btn-primary"> 提交 </button>
     </div>
  
  </div>
  </form>

     <script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings(); 
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
	
  });
 
</script>               
</body>
</html>
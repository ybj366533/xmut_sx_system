<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>厦门理工学院光电与通信工程学院</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<script type="text/javascript"
	src="<%=path%>/assets/js/jquery-1.8.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
<body onload="showImg">
	<script type="text/javascript">
		$(function() {
			//得到焦点
			$("#password").focus(function() {
				$("#left_hand").animate({
					left : "150",
					top : " -38"
				}, {
					step : function() {
						if (parseInt($("#left_hand").css("left")) > 140) {
							$("#left_hand").attr("class", "left_hand");
						}
					}
				}, 2000);
				$("#right_hand").animate({
					right : "-64",
					top : "-38px"
				}, {
					step : function() {
						if (parseInt($("#right_hand").css("right")) > -70) {
							$("#right_hand").attr("class", "right_hand");
						}
					}
				}, 2000);
			});
			//失去焦点
			$("#password").blur(function() {
				$("#left_hand").attr("class", "initial_left_hand");
				$("#left_hand").attr("style", "left:100px;top:-12px;");
				$("#right_hand").attr("class", "initial_right_hand");
				$("#right_hand").attr("style", "right:-112px;top:-12px");
			});
		});
		var i = 1;
		function showImg() {
			var imgObj = document.getElementById("myImg");
			imgObj.src = "img/" + i + ".jpg";
			i++;
			if (i > 3) {
				i = 1;
			}
			mytimer = setTimeout("showImg()", 2000);
		}
		function stoptime() {
			clearTimeout(mytimer);
		}
		
		
	/* 测试部分 */
		
		
		$(document).ready(function  () {
	   //初始的时候的验证码框的数据
		 var randomcode = "aAbB1CcDd2EeFf3GgHh4IiJj5KklL6mMnN7OoPpQq8RrSsTt9UuVvWw0XxYyZz"
         var value = "",i;
         for(j=1;j<=4;j++){
         i = parseInt(61*Math.random());
         	value = value + randomcode.charAt(i);
         }
         $("#answertext").val(value);
       //随机产生验证码
       $("#change_pic").click(function() {
       	 var randomcode = "aAbB1CcDd2EeFf3GgHh4IiJj5KklL6mMnN7OoPpQq8RrSsTt9UuVvWw0XxYyZz";
         var value = "",i;
         for(j=1;j<=4;j++){
       i = parseInt(61*Math.random());
         	value = value + randomcode.charAt(i);
         }
         $("#answertext").val(value);
       });
     //验证码框失去焦点时判断是否一致
     $("#codetext").blur(function  () {
     	var answertext = $("#answertext").val().toString();
     	var codetext = $("#codetext").val().toString();
     	if(answertext == codetext){
     		$("#code").removeClass("meg_err").addClass("meg_ok");
     		 $(".error_list").slideUp();
     	}else{
     		$("#code").removeClass("meg_ok").addClass("msseg_err");
     		 $("#errorTip").text("请输入正确的验证码");
		      $(".error_list").slideDown();
     	}
     });
     
     //点击立即登录界面的按钮后所发生的事件
     $("#btn log").click(function(){
    	 var username = $("#u_name").val().toString();
         var userpass = $("#password").val().toString();
         var codetext = $("#codetext").val().toString();
         var answertext = $("#answertext").val().toString();
         if(username == ""){
        	  $("#username").removeClass("meg_ok").addClass("meg_err");	
		      $("#errorTip").text("请输入手机号");
		      $(".error_list").slideDown();
         }else if(userpass == ""){
        	  $("#userpass").removeClass("meg_ok").addClass("meg_err");
	  	      $("#errorTip").text("请输入密码");
		      $(".error_list").slideDown();
         }else if(codetext == ""){
        	 $("#code").removeClass("meg_ok").addClass("msseg_err");
        	 $("#errorTip").text("请输入验证码");
		     $(".error_list").slideDown();
         }else if(codetext != answertext){
        	  $("#code").removeClass("meg_ok").addClass("msseg_err");
        	 $("#errorTip").text("请输入正确的验证码");
		     $(".error_list").slideDown();
         }else if(username != "" && userpass != "" && codetext!= ""){
        	 var loginname = $("#mlsUser").val().toString();
             var loginpass = $("#password").val().toString();
        	 $.post("login.action?opt=login",{
        	 u_name : $("#u_name").val(),
				password : $("#password").val(),
				number : $("#number").val(),
				role : $('#role').val()
        	 },function(data,status){
       		 if(data != ""){
        			 
        			
        		 }
        	 })
         }
     });
});
	</script>
	<body>
	<div class="page_container">
		<img alt="厦门理工光电与通信工程学院" src="img/1.jpg" id="myImg"
			onmouseenter="stoptime()" onmouseout="showImg()">
		<form class="log-infor" action="login.action?opt=login" method="post">
			<DIV
				style="background:url(img/1.png);margin:  auto auto;  border-image: none; width: 400px; height: 300px; text-align: center;">
				<DIV style="width: 165px; height: 96px; position: absolute;">
					<DIV class="tou"></DIV>
					<DIV class="initial_left_hand" id="left_hand"></DIV>
					<DIV class="initial_right_hand" id="right_hand"></DIV>
				</DIV>
				<P style="padding: 30px 0px 10px; position: relative;">
					<SPAN class="u_logo"></SPAN> <INPUT class="ipt" type="text"
						id="u_name" name="u_name" placeholder="请输入用户名" value="">
				</P>
				<P style="padding: 0px 0px 10px;position: relative;">
					<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="password"
						type="password" name="password" placeholder="请输入密码" value=""/>
				</P>
				<div>
				<P style="position: relative;">
					 <INPUT class="ipc" id="mycode" type="text" name="mycode" placeholder="请输入验证码" value=""/>
					<div id="anpic"> 
					<input class="codeanswer" id="answertext" name="answertext" type="text" disabled="true"/>
					<a id="change_pic" class="change_pic" href="javascript:;">看不清，换一组</a>
					</div>
				</P>
					
				</div>
				<ul>
					<li><input type="radio" name="role" value="2" class="role" />学生&nbsp;&nbsp;
						<input type="radio" name="role" value="1" class="role" />教师&nbsp;&nbsp;
						<input type="radio" name="role" value="0" class="role" />管理员&nbsp;&nbsp;
					</li>

				</ul>
				<div class="btn_two">
					<input type="submit" value="登录" class="btn log"> <input
						type="reset" value="重置" class="btn cannel">
				</div>
				<input name="rem_pwd" type="checkbox" value="remember" /> <span class="pwd_word">记住密码</span><br />
				<a href="forget.jsp" class="forget_num">忘记密码?</a>
			</DIV>
		</form>
		<div style="text-align:center;"></div>
	</div>
</BODY>
</html>

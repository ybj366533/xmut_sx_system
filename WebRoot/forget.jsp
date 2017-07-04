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
<script type="text/javascript">
	$(document).ready(function() {
		///// 提交按钮单击/////
		$('#user-plus').click(function() {
			$.post("login.action?opt=forget",
				{
					name : $("#name").val(),
					password : $("#password").val(),
					ctext : $("#ctext").val(),
				},
				function(data, status) {
					if (data == "true") {
						layer.msg("更改成功");
						
					} else {
						layer.msg("更改失败");
					}
				}, "html");
			return false;
		}
		);
	});
</script>
<body onload="showImg">
	<SCRIPT type="text/javascript">
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
         if(username == ""){
        	  $("#username").removeClass("meg_ok").addClass("meg_err");	
		      $("#errorTip").text("请输入手机号");
		      $(".error_list").slideDown();
         }else if(userpass == ""){
        	  $("#userpass").removeClass("meg_ok").addClass("meg_err");
	  	      $("#errorTip").text("请输入密码");
		      $(".error_list").slideDown();
         }else if(username != "" && userpass != "" && codetext!= ""){
        	 var loginname = $("#mlsUser").val().toString();
             var loginpass = $("#password").val().toString();
        	 $.post("LoginRegistServlet",{"op":'login',"loginname":loginname,"loginpass":loginpass},function(data,status){
       		 if(data != ""){
        			   location.href = 'index.html';
                     //将文本对象转换成成json对象
        			 var customer = JSON.parse(data);
        			 //遍历json对象里里面的数据
        			 $.each(customer,function(index,c){
        				 
        			 });
        			
        		 }
        	 })
         }
     });
});
	</SCRIPT>
	<body>
	<div class="page_container">
		<img alt="厦门理工光电与通信工程学院" src="img/1.jpg" id="myImg"
			onmouseenter="stoptime()" onmouseout="showImg()">
		<form class="log-infor">
			<DIV
				style="background:url(img/1.png);margin:  auto auto;  border-image: none; width: 400px; height: 300px; text-align: center;">
				<DIV style="width: 165px; height: 96px; position: absolute;">
					<DIV class="tou"></DIV>
					<DIV class="initial_left_hand" id="left_hand"></DIV>
					<DIV class="initial_right_hand" id="right_hand"></DIV>
				</DIV>
				<P style="padding: 30px 0px 10px; position: relative;">
					<SPAN class="u_logo"></SPAN> <INPUT class="ipt" type="text"
						id="name" name="name" placeholder="请输入用户名" value="">
				</P>
				<P style="padding: 0px 0px 10px;position: relative;">
					<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="password"
						type="password" name="password" placeholder="请输入新密码" value=""/>
						
				</P>
				<P style="padding: 0px 0px 10px;position: relative;">
					<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="ctext"
						type="text" name="mobile" placeholder="请输入手机号码" value=""/>
					
				</P>
				<ul>
			
				</ul>
				<div class="btn_two">
					<input type="submit" value="提交" class="btn log" id="user-plus"> <input
						type="reset" value="重置" class="btn cannel">
				</div>
			</DIV>
		</form>
		<div style="text-align:center;"></div>
	</div>
</body>>
</html>

<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>厦门理工光电与通信工程学院</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/ckform.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form action="" method="post" class="definewidth m20">
	<input type="hidden" name="id" value="{$user.id}" />
    <table class="table table-bordered table-hover definewidth m10">
	    <tr>
	        <td width="10%" style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">账户名</td>
	        <td><input type="text" name="name" value="${name } " readonly="readonly"/></td>
	    </tr>
	    <tr>
	        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">当前密码</td>
	        <td><input type="password" id="oldpassword" name="oldpassword" value=""/><span id="oldpasswordtip" style="color:red; margin-left: 10px;"></span></td>
	    </tr>
	    <tr>
	        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">新密码</td>
	        <td><input type="password" id="password" name="password" value=""/><span id="passwordtip" style="color:red; margin-left: 10px;"></span></td>
	    </tr>
	    <tr>
	        <td style="text-align:center;background-color:#f5f5f5;vertical-align:middle;">重复密码</td>
	        <td><input type="password" id="repassword" name="repassword" value=""/><span id="repasswordtip" style="color:red; margin-left: 10px;"></span></td>
	    </tr>
    
        <tr>
            <td class="tableleft"></td>
            <td>
                <button id="submit_btn" class="btn btn-primary" style="margin-left:150px;" type="button">保存</button>&nbsp;&nbsp;<span id="msg" style="color:red; margin-left: 10px;"></span>
            </td>
        </tr>
    </table>
</form>
</body>
<script>

   $(function(){
		//提交表单
		$('#submit_btn').click(function(){
			if($('#oldpassword').val() == ''){
				$('#oldpasswordtip').text('当前密码不能为空！');	
				$('#oldpassword').focus();
			}else if($('#password').val() == ''){
				$('#oldpasswordtip').html("");
				$('#passwordtip').text('新密码不能为空！');
				$('#password').focus();
			}else if($('#repassword').val() == ''){
				$('#oldpasswordtip').text('');
				$('#passwordtip').text('');
				$('#repasswordtip').text('重复密码不能为空！');
				$('#repassword').focus();
			}else if($('#password').val() != $('#repassword').val()){
				$('#oldpasswordtip').text('');
				$('#passwordtip').text('');
				$('#repasswordtip').text('重复密码必须相同！');
				$('#repassword').focus();
			}else{
				$('#oldpasswordtip').text('');
				$('#passwordtip').text('');
				$('#repasswordtip').text('');
				var oldpassword = $('#oldpassword').val();
				var password = $('#password').val();
				var repassword = $('#repassword').val();
				
				
				$.post("houseHolderPasswordEdit.action?name="+"${name } "+"&oldpassword="+oldpassword+"&password="+password+"&repassword="+repassword, function(data, status) {
		        	console.log(data);
					if (data.result == "ok") {
						$('#msg').text('');
						window.location.href = "pw_edit_success.jsp";
					} else {
						$('#msg').text(data.msg);
						
					}
		        }, "json");
				
			}
		});
	});
</script>
</html>

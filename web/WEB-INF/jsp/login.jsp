<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet" />

<style type="text/css">

body {
	background: #214761;
}

.title {
	color: #6C6CA6;
	line-height: 60px;
	height: 60px;
	border-bottom: 1px solid gray;
	font-weight: bold;
}

#logbox {
	width: 450px;
	position: absolute;
	top: 20%;
	left: 35%;
	border: 2px solid #EEEEEE;
	border-radius: 10px;
	padding-bottom: 10px;
	background-color: rgb(233, 242, 250);
}
</style>

<title>登录</title>


</head>

<body>
	<div id="wrapper">
		<div id="logbox">
			<p class="h1 text-center title">餐厅收银管理系统</p>
			<h2 style="margin-top: 10px;text-align: center;height: 20px;"><span style="color:red;font-size: 12px;" id="error-login"></span></h2>
			<div class="input-group">
				<span class="input-group-addon"><span
					class="glyphicon glyphicon-user
		"></span></span> <input type="text"
					id="userCode" name="userCode" class="form-control" placeholder="账号"
					required="required" pattern="^[a-zA-Z0-9]{5,16}$" />
			</div>
			<br />
			<div class="input-group">
				<span class="input-group-addon"><span
					class="glyphicon glyphicon-certificate
		"></span></span> <input
					id="userPassWord" name="userPassWord" type="password" class="form-control"
					placeholder="密码" required="required" pattern="^[a-zA-Z0-9_-]{6,18}$" />
			</div>
			<br />
			<div class="row">
				<input type="button"  class="btn btn-default" id="submitBtn"
					value="登录" style="margin-right: 115px;padding: 5px 35px;"/>
				<input type="button" class="btn btn-default reset" id="resetBtn"
					value="重置" style="padding: 5px 35px;"/>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$("#submitBtn").click(function(){
		var userCode=$("#userCode").val();
		var userPassWord=$("#userPassword").val();
		var errorLogin = $("#error-login");

		if(userCode === ''){
			errorLogin.text("账号不能为空");
			return;
		}else if(!(/^[0-9a-zA-z]{3,16}$/.test(userCode))){
			errorLogin.text("请输入3~16位数字或字母");
			return;
		}else{
			errorLogin.text("");
		}
		if(userPassWord === ''){
			errorLogin.text("密码不能为空");
			return;
		}else if(!(/^[0-9a-zA-z]{6,18}$/.test(userPassWord))){
			errorLogin.text("请输入6~18位数字或字母");
			return;
		}else{
			errorLogin.text("");
		}

		$.ajax({
			url: "${pageContext.request.contextPath}/login.html",
			type: "POST",
			data: {"userCode":userCode, "userPassWord": userPassWord},
			dataType: "JSON",
			success: function(data) {
				if (data.code == 0) {
					window.location.href = "desklist.html?show=desk";
				} else {
					$("#error-login").text("用户名或密码错误");
				}
			},
			error: function () {
				$("#error-login").text("暂时无法连接到服务器")
			}
		});

	});
	$("#resetBtn").click(function(){
		$("#userCode").val("");
		$("#userPassWord").val("");
		$("#error-login").text("");
	});
</script>
</body>
</html>

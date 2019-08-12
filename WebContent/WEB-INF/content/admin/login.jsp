<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>后台管理系统</title>
	<link href="${ctx}/admin/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log"><form action="${ctx}/admin/adminLogin" method="POST">
				<div class="name">
					<label>用户名</label><input type="text" class="text" id="value_1" placeholder="用户名" name="aid" tabindex="1">
				</div>
				<div class="pwd">
					<label>密　码</label><input type="password" class="text" id="value_2" placeholder="密码" name="apwd" tabindex="2">
					<input type="submit" class="submit" tabindex="3" value="登录">
					<div class="check"></div>
				</div>
				<div class="tip"></div>
			</form></div>
		</div>
	</div>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>
<script type="text/javascript" src="${ctx}/admin/js/jQuery.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/fun.base.js"></script>
<script type="text/javascript" src="${ctx}/admin/js/script.js"></script>
</body>
</html>
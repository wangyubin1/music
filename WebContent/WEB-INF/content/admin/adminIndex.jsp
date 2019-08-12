<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>后台管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<frameset rows="55,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="${ctx}/admin/top" name="title" scrolling="no" noresize="noresize" >
		<frameset cols="260,*" frameborder="no" border="0" framespacing="0">
	    	<frame src="${ctx}/admin/left" name="tree" scrolling="no" marginheight="0" marginwidth="0">
	    	<frame src="${ctx}/admin/right" name="main" scrolling="yes" frameborder="0" marginwidth="0" marginheight="0" noresize="noresize">
		</frameset>
	</frameset>
</head>
<body>
</body>
</html>
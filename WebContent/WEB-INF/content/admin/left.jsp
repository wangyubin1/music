<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理系统 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${ctx}/admin/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${ctx}/admin/css/admin.css">
</head>
<body>
<div class="admin-sidebar" id="admin-offcanvas">
	<ul class="am-list admin-sidebar-list">
		<li><a href="right" target="main"><span class="am-icon-users"></span>&nbsp;音乐管理</a></li>
        <li class="admin-parent">
			<a href="manageMusic" target="main" class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-music"></span>&nbsp;音乐管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
			<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
				<li><a href="manageMusic" target="main"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
				<li><a href="putMusic" target="main"><span class="am-icon-th"></span> 上传音乐</a></li>
				<li><a href="admin-log.html"><span class="am-icon-calendar"></span> 系统日志</a></li>
			</ul>
        </li>
        <li><a href="${ctx}/admin/adminLogout;" target="_top"><span class="am-icon-sign-out"></span> 注销</a></li>
	</ul>

	<div class="am-panel am-panel-default admin-sidebar-panel">
		<div class="am-panel-bd">
			<p><span class="am-icon-bookmark"></span> 公告</p>
			<p>时光静好，与君语；细水流年，与君同。</p>
		</div>
	</div>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理系统 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${ctx}/admin/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${ctx}/admin/css/admin.css">
	<style>
		.upload{
			margin-left: 20px;
		}
	</style>
</head>
<body>
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">音乐上传</strong></div>
		</div>
      	<hr>
      	<h3>文件命名规则：歌曲名-演唱者.mp3</h3>
      	<form action="uploadMusic" method="post" enctype="multipart/form-data" class="upload">
      		歌曲名：<input type="text" name="sname" id="name"><br>
      		演唱者：<input type="text" name="sauthor" id="author"><br>
      		文件：<input type="file" name="file" id="file">
      		<input type="submit" value="上传" class="am-btn am-btn-primary am-btn-sm am-fl" id="put">
      	</form>
	</div>
    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2018 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
	
</div>
<script src="${ctx}/admin/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script>
	$(function(){
		$("#put").click(function(){
			if($("#file").val() == ""){
				alert("请上传文件！");
				return false;
			}
			if($("#name").val() == ""){
				alert("请输入歌曲名！");
				return false;
			}
			if($("#author").val() == ""){
				alert("请输入演唱者！");
				return false;
			}
		})
	})
</script>
</body>
</html>
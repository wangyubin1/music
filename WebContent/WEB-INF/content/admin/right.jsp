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
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>Table</small></div>
		</div>
      	<hr>
      	<div class="am-g">
        	<div class="am-u-sm-12 am-u-md-6">
          	<div class="am-btn-toolbar">
           		<div class="am-btn-group am-btn-group-xs">
              		<button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              		<button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              		<button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              		<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            	</div>
          	</div>
        	</div>
	        <div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
	            	<input type="text" class="am-form-field">
		          	<span class="am-input-group-btn">
		            	<button class="am-btn am-btn-default" type="button">搜索</button>
		          	</span>
	          	</div>
	        </div>
    	</div>
	<div class="am-g">
        <div class="am-u-sm-12">
			<form class="am-form">
			<table class="am-table am-table-striped am-table-hover table-main">
			<thead>
				<tr>
                	<th class="table-check"><input type="checkbox" /></th><th class="table-id">ID</th><th class="table-title">用户名</th><th class="table-type">密码</th><th class="table-author am-hide-sm-only">手机号</th><th class="table-date am-hide-sm-only">邮箱</th><th class="table-set">操作</th>
              	</tr>
            </thead>
            <tbody>
              	<c:forEach items="${requestScope.user_list}" var="user"><tr>
	                <td><input type="checkbox" /></td>
	                <td>${user.uid}</td>
	                <td><a href="#">${user.uname}</a></td>
	                <td>${user.upwd}</td>
	                <td class="am-hide-sm-only">${user.tel}</td>
	                <td class="am-hide-sm-only">${user.email}</td>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
	                      <button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 复制</button>
	                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only remove" title="${user.uid}"><span class="am-icon-trash-o"></span> 删除</button>
	                    </div>
	                  </div>
	                </td>
              	</tr></c:forEach>
			</tbody>
            </table>
            <div class="am-cf">
              		共 ${requestScope.userNum} 条记录
				<div class="am-fr">
                	<ul class="am-pagination">
	                	<c:if test="${currentPage == 1}">
				            <li class="am-disabled"><a href="#">«</a></li>      
				        </c:if>
				        <c:if test="${currentPage != 1}">
				            <li><a href="right?page=${currentPage-1}">« </a></li>
				        </c:if>
				        <c:if test="${currentPage == 1}">
				        	<li class="am-active"><a href="#"><span class="current">1</span></a></li>
				        </c:if>
				        <c:if test="${currentPage != 1}">
				        	<li><a href="right?page=1">1</a></li>
				        </c:if>
				        <%
				        	int pageTimes = (Integer)request.getAttribute("pageTimes");
				        	for(int i=1;i<pageTimes;i++){
				        		request.setAttribute("page", i+1);
				        %>
				        <c:if test="${currentPage == page}">
				            <li class="am-active"><a href="#"><span class="current"><%=i+1%></span></a></li>      
				        </c:if>
				        <c:if test="${currentPage != page}">
				             <li><a href="right?page=<%=i+1%>"><%=i+1%></a></li>
				        </c:if>
				        <%} %>
				        <c:if test="${currentPage == pageTimes}">
				            <li class="am-disabled"><a href="#"><span class="disabled">»</span></a></li>        
				        </c:if>
				        <c:if test="${currentPage != pageTimes}">
				        	<li><a href="right?page=${currentPage+1}">»</a></li>
				        </c:if>
                	</ul>
              	</div>
            </div>
          </form>
        </div>
      	</div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>

</div>
<script src="${ctx}/admin/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script>
	$(function(){
		$(".remove").click(function(){
			$.post("removeUser",{uid:this.title},function(){
				
			})
			window.location.reload();
		})
	})
</script>
</body>
</html>
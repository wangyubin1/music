<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>搜索音乐--拾光音乐网</title>
    <link rel="stylesheet" href="${ctx}/css/find.css">
    <!--title的图标-->
    <link rel="icon" href="${ctx}/images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="${ctx}/css/app.css">
</head>
<body>
<%@ include file="public/header.jsp"%>

<div class="main">
    <form action="listUser.do">
        <input type="text" class="find_t" name="content">
        <input type="hidden" name="page">
        <input type="submit" value="搜索音乐" class="find_b">
    </form>
    <table>
        <thead>
            <tr>
                <th>歌名</th>
                <th>艺人</th>
                <th></th>
            </tr>
        </thead>
        <tbody class="res">
            <c:forEach items="${requestScope.song_list}" var="song"><tr>
                <td><a href="play?sid=${song.sid}">${song.sname}</a></td>
                <td>${song.sauthor}</td>
                <td><button class="collect" title="${song.sid}">收藏</button><button><a href="play?sid=${song.sid}">播放</a></button></td>
            </tr></c:forEach>
        </tbody>
    </table>
    <div class="left">共<span style='color:red'>${requestScope.songNum}</span>条记录</div>
    <div class="right">
        <c:if test="${currentPage == 1}">
            <span class="disabled">« </span>        
        </c:if>
        <c:if test="${currentPage != 1}">
            <a href="listUser.do?page=${currentPage-1}&content=${content}">« </a>
        </c:if>
        <c:if test="${currentPage == 1}">
        <span class="current">1</span>
        </c:if>
        <c:if test="${currentPage != 1}">
        <a href="listUser.do?page=1&content=${content}">1</a>
        </c:if>
        <%
        	int pageTimes = (Integer)request.getAttribute("pageTimes");
        	for(int i=1;i<pageTimes;i++){
        		request.setAttribute("page", i+1);
        %>
        <c:if test="${currentPage == page}">
            <span class="current"><%=i+1%></span>        
        </c:if>
        <c:if test="${currentPage != page}">
             <a href="listUser.do?page=<%=i+1%>&content=${content}"><%=i+1%></a>
        </c:if>
        <%} %>
        <c:if test="${currentPage == pageTimes}">
            <span class="disabled">»</span>        
        </c:if>
        <c:if test="${currentPage != pageTimes}">
        <a href="listUser.do?page=${currentPage+1}&content=${content}">»</a>
        </c:if>
    </div>
</div>
<div style="height:150px"></div>
<%@ include file="public/footer.jsp"%>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/footer.js"></script>
<script>
	function urlSearch(){
		var name,value;
		var str = decodeURI(location.href);
		var num = str.indexOf("?");
		str = str.substr(num+1);
		var arr = str.split("&");
		for(var i=0;i<arr.length;i++){
			num=arr[i].indexOf("=");
			if(num>0){
				name=arr[i].substring(0,num);
				value=arr[i].substr(num+1);
				this[name]=value;
			}
		}
	}
	var request=new urlSearch();
	
	$(function(){
		if(request.content != ""){
			var regExp = new RegExp(request.content, "g");
			$(".res td").each(function(){
				var html=$(this).html();
				var newHtml = html.replace(regExp, "<span style='color:red'>"+request.content+"</span>");
				$(this).html(newHtml);
			})
		}
		$(".collect").click(function(){
			if("${sessionScope.user.uname}" != ""){
				$.post("collect",{sid:this.title,uid:"${sessionScope.user.uid}"},function(){
					
				})
				alert("收藏成功！")
			}else{
				if(confirm("您还没登录，是否跳转到登录页面？")){
					window.location.replace("loginForm");
				}
			}
			
			//alert(this.title)
		})
	})
</script>
</body>
</html>
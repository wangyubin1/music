<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的音乐--拾光音乐网</title>
    <link rel="stylesheet" href="css/person.css">
    <!--title的图标-->
    <link rel="icon" href="images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="css/app.css">
</head>
<body>
<%@ include file="public/header.jsp"%>

<div class="main">
    <table>
        <tr>
            <td class="main_left">
                <div class="left_title">我的收藏(${requestScope.songNum})</div>
                <div class="music_list">
                    <table>
				        <thead>
				            <tr>
				                <th>歌名</th>
				                <th>艺人</th>
				                <th>收藏时间</th>
				                <th></th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach items="${requestScope.song_list}" var="song"><tr>
				                <td><a href="play?sid=${song.sid}">${song.sname}</a></td>
				                <td>${song.sauthor}</td>
				                <td>${song.ltime}</td>
				                <td><button class="del" title="${song.sid}">删除</button></td>
				            </tr></c:forEach>
				        </tbody>
				    </table>
				    <div class="right">
				        <c:if test="${currentPage == 1}">
				            <span class="disabled">«</span>        
				        </c:if>
				        <c:if test="${currentPage != 1}">
				            <a href="person?page=${currentPage-1}&uid=${uid}">«</a>
				        </c:if>
				        <c:if test="${currentPage == 1}">
				        	<span class="current">1</span>
				        </c:if>
				        <c:if test="${currentPage != 1}">
				        	<a href="person?page=1&uid=${uid}">1</a>
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
				             <a href="person?page=<%=i+1%>&uid=${uid}"><%=i+1%></a>
				        </c:if>
				        <%} %>
				        <c:if test="${currentPage == pageTimes}">
				            <span class="disabled">»</span>        
				        </c:if>
				        <c:if test="${currentPage != pageTimes}">
				        	<a href="person?page=${currentPage+1}&uid=${uid}">»</a>
				        </c:if>
				    </div>
                </div>
            </td>
            <td class="main_right">
                <div class="right_title">今日推荐</div>
                <div class="right_img">
                    <img src="images/14573189135985.jpg">
                </div>
                <div class="right_img">
                    <img src="images/14573189135985.jpg">
                </div>
            </td>
        </tr>
    </table>
</div>

<%@ include file="public/footer.jsp"%>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/footer.js"></script>
<script>
	$(function(){
		$(".del").click(function(){
			$.post("del",{sid:this.title},function(){
				
			})
			window.location.reload();
			//alert(this.title)
		})
	})
</script>
</body>
</html>
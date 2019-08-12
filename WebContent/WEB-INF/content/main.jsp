<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isThreadSafe="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>发现音乐--拾光音乐网</title>
    <link rel="stylesheet" href="${ctx}/css/index.css">
    <!--title的图标-->
    <link rel="icon" href="${ctx}/images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="${ctx}/css/app.css">
</head>
<body>

<%@ include file="public/header.jsp"%>

<div class="main">
    <div class="slider">
        <div class="slider-img">
            <ul class="slider-img-ul">
                <li>
                    <img src="${ctx}/images/1539338147905.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1539939540414.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1540051067258.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1540371750192.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1545896735047.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1539338147905.jpg">
                </li>
                <li>
                    <img src="${ctx}/images/1539939540414.jpg">
                </li>
            </ul>
        </div>
    </div>
    <div class="like">
        <h3>猜你喜欢</h3>
        <table>
	        <thead>
	            <tr>
	                <th>歌名</th>
	                <th>艺人</th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${requestScope.song_list}" var="song"><tr>
	                <td><a href="play?sid=${song.sid}">${song.sname}</a></td>
	                <td>${song.sauthor}</td>
	                <td><button class="collect" title="${song.sid}">收藏</button><button><a href="play?sid=${song.sid}">播放</a></button></td>
	            </tr></c:forEach>
	        </tbody>
	    </table>
	    
    </div>
    <div class="new">
        <h3>新歌首发</h3>
        <table>
            <tbody>
                <tr><c:forEach items="${requestScope.song_new}" var="song">
                    <td>
                        <img src="${ctx}/${song.surl}">
                        <span><a href="play?sid=${song.sid}">${song.sname}</a></span>-
                        <span>${song.sauthor}</span>
                    </td>
                </c:forEach></tr>
            </tbody>
        </table>
    </div>
    <div class="new">
        <h3>热门歌曲</h3>
        <table>
            <tbody>
                <tr><c:forEach items="${requestScope.song_hot}" var="song">
                    <td>
                        <img src="${ctx}/${song.surl}">
                        <span><a href="play?sid=${song.sid}">${song.sname}</a></span>-
                        <span>${song.sauthor}</span>
                    </td>
                </c:forEach></tr>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="public/footer.jsp"%>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/calendar.js" type="text/javascript"></script>
<script src="js/xSlider.js"></script>
<script src="js/footer.js"></script>
<script>
	$(function(){
		$(".collect").click(function(){
			if("${sessionScope.user.uname}" != ""){
				//$.post("collect",{sid:this.title,uid:"${sessionScope.user.uid}"},function(){
					//
				//})
				//alert("收藏成功！")
				$.post("collect.action", {
					sid:this.title,uid:"${sessionScope.user.uid}",
				}, function(data) {
					//从后台传过来的数据    
					alert(data);
				});
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
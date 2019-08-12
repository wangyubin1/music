<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
	
</head>
<body>

<header>
    <div class="gap">
        <div class="wrapper">
            <table><tbody><tr class="a">
                <td class="logo">
                    <a href="" title="拾光音乐网 - 拾起光阴 珍惜时光">
                        <img src="${ctx}/images/icon/3c2af735da376d.png">
                        拾光音乐
                    </a>
                </td>
                <td class="findMusic">
                    <a href="${ctx}/main" class="current_left">
                        发现音乐
                    </a>
                    <a href="${ctx}/person?uid=${sessionScope.user.uid}" class="current_right">
                        我的音乐
                    </a>
                </td>
                <td class="search">
                    <div class="container">
                        <form action="listUser.do">
                            <input type="text" class="text" placeholder="搜音乐" name="content">
                            <input type="hidden" name="page">
                            <input type="submit" class="submit" value>
                        </form>
                    </div>
                </td>
            </tr></tbody></table>
            
        </div>
    </div>
</header>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.0.min.js"></script>
<script>
	$(function(){
		if("${sessionScope.user.uname}" != ""){
			$(".account").remove();
			$(".a").append(`<td class='user'><a class='login'><img src='${ctx}/${sessionScope.user.url}'></a>
					<nav>
						<a href="${ctx}/gerenxinxi"><div>&nbsp;&nbsp;管理个人信息</div></a>
						<a href="${ctx}/person?uid=${sessionScope.user.uid}" class="current_right"><div>&nbsp;&nbsp;我的收藏</div></a>
						<div>&nbsp;&nbsp;设置</div>
						<a href="${ctx}/logout"><div>&nbsp;&nbsp;退出登录</div></a>
					</nav></td>`);
			//点击头像显示导航,点击别处隐藏导航
			$(".login").click(function(event){
		        var e=window.event || event;
		        if(e.stopPropagation){
		            e.stopPropagation();
		        }else{
		            e.cancelBubble = true;
		        }   
		        $("nav").show();
		    });
		    $("nav").click(function(event){
		        var e=window.event || event;
		        if(e.stopPropagation){
		            e.stopPropagation();
		        }else{
		            e.cancelBubble = true;
		        }
		    });
		    document.onclick = function(){
		        $("nav").hide();
		    };
		}else{
			$(".user").remove();
			$(".a").append("<td class='account'><a href='${ctx}/loginForm' class='start'>登录</a><a href='${ctx}/register' class='stop'>注册</a></td>");
		}

	})
	
</script>
</body>
</html>
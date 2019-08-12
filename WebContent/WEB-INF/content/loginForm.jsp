<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录--拾光音乐网</title>
    <link rel="stylesheet" href="css/login.css">
    <!--title的图标-->
    <link rel="icon" href="images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="css/app.css">
</head>
<body>

<%@ include file="public/header.jsp"%>

<span id="tip">${requestScope.message}</span>
<div class="main">
    <h2 class="title">拾光音乐用户登录</h2>
    <form action="login" method="POST">
        <table>
            <tbody>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="uname" class="border"></td>
                    <td><span id="tipName"></span></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="upwd" class="border password">
                        <img src="images/icon/闭眼.png" id="passwordeye" class="invisible"></td>
                    <td><span id="tipPwd"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" class="buttom" value="登录" id="submit"></td>
                </tr>
            </tbody>
        </table>
    </form>
</div>

<%@ include file="public/footer.jsp"%>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/footer.js"></script>
<script src="js/eye.js"></script>
<script type="text/javascript">
$("#submit").click(function() {
    var uname = $("input[name='uname']").val();
    var upwd = $("input[name='upwd']").val();
    if(uname == "" || upwd == ""){
        if(uname == "") $("#tipName").html("×用户名不能为空");
        if(upwd == "") $("#tipPwd").html("×密码不能为空");
        return false;
    }
})
$("input[name='uname']").blur(function(){
    if($("input[name='uname']").val() == ""){
        $("#tipName").html("×用户名不能为空");
    }else{
        $("#tipName").html("");
    }
})
$("input[name='upwd']").blur(function(){
    if($("input[name='upwd']").val() == "") {
        $("#tipPwd").html("×密码不能为空");
    }else{
        $("#tipPwd").html("");
    }
})
if($("#tip").html() != ""){
	alert($("#tip").html())
}
</script>
</body>
</html>
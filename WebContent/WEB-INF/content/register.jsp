<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册--拾光音乐网</title>
    <link rel="stylesheet" href="${ctx}/css/register.css">
    <!--title的图标-->
    <link rel="icon" href="${ctx}/images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="${ctx}/css/app.css">
</head>
<body>

<%@ include file="public/header.jsp"%>
<span id="tip">${requestScope.message}</span>
<div class="main">
    <h2 class="title">拾光音乐用户注册</h2>
    <form action="register" method="post">
        <table>
            <tbody>
                <tr>
                    <td>*&nbsp用户名：</td>
                    <td><input type="text" class="border" name="uname"></td>
                    <td><span id="warmName"></span></td>
                </tr>
                <tr>
                    <td>*&nbsp密码：</td>
                    <td><input type="password" class="border password" name="upwd">
                        <img src="${ctx}/images/icon/闭眼.png" id="passwordeye" class="invisible"></td>
                    <td><span id="warmPwd"></span></td>
                </tr>
                <tr>
                    <td>*&nbsp确认密码：</td>
                    <td><input type="password" class="border password" id="repwd"></td>
                    <td><span id="warmRePwd"></span></td>
                </tr>
                <tr>
                    <td>*&nbsp性别：</td>
                    <td><input type="radio" name="sex" value="1" checked>&nbsp男&nbsp
                        <input type="radio" name="sex" value="0">&nbsp女</td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input type="text" class="border" name="email"></td>
                    <td><span id="warmEmail"></span></td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td><input type="tel" class="border" name="tel"></td>
                    <td><span id="warmTel"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="checkbox" id="checkbox">&nbsp我已经认真阅读并同意
                    	&nbsp<a href="${ctx}/">用户协议</a></td>
                    <td><span id="warm"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" class="buttom" value="注册" id="submit"></td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
<%@ include file="public/footer.jsp"%>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/footer.js"></script>
<script src="js/eye.js"></script>
<script>
    $("#submit").click(function() {
        var uname = $("input[name='uname']").val();
        var upwd = $("input[name='upwd']").val();
        var repwd = $("#repwd").val();
        var email = $("input[name='email']").val();
        var tel = $("input[name='tel']").val();
        if(uname == "" || upwd == ""){
            if(uname == "") $("#warmName").html("×用户名不能为空");
            if(upwd == "") $("#warmPwd").html("×密码不能为空");
            return false;
        }
        if(repwd != upwd){
            $("#warmRePwd").html("×两次密码不一致");
            return false;
        }
        if(email != ""){
            var regEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            if(!regEmail.test(email)){
                return false;
            }
        }
        if(tel != ""){
            var regTel = /^[1][3,4,5,7,8][0-9]{9}$/;
            if(!regTel.test(tel)){
                return false;
            }
        }
        if(!$("#checkbox").prop("checked")){
            $("#warm").html("×您没有同意该条款");
            return false;
        }
    })
    $("input[name='uname']").blur(function(){
        if($("input[name='uname']").val() == ""){
            $("#warmName").html("×用户名不能为空");
        }else{
            $("#warmName").html("");
        }
    })
    $("input[name='upwd']").blur(function(){
        if($("input[name='upwd']").val() == "") {
            $("#warmPwd").html("×密码不能为空");
        }else{
            
            $("#warmPwd").html("");
        }
    })
    $("#repwd").blur(function(){
        var upwd = $("input[name='upwd']").val();
        var repwd = $("#repwd").val();
        if(upwd != repwd){
            $("#warmRePwd").html("×两次密码不一致");
        }else{
            $("#warmRePwd").html("");
        }
    })
    $("input[name='email']").blur(function(){
        var email = $("input[name='email']").val();
        if(email != "") {
            var regEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            if(!regEmail.test(email)){
                $("#warmEmail").html("×邮箱格式不正确");
            }else{
                $("#warmEmail").html("");
            }
        }else{
            $("#warmEmail").html("");
        }
    })
    $("input[name='tel']").blur(function(){
        var tel = $("input[name='tel']").val();
        if(tel != "") {
            var regTel = /^[1][3,4,5,7,8][0-9]{9}$/;
            if(!regTel.test(tel)){
                $("#warmTel").html("×手机号格式不正确");
            }else{
                $("#warmTel").html("");
            }
        }else{
            $("#warmTel").html("");
        }
    })
    if($("#tip").html() != ""){
		alert($("#tip").html())
	}
</script>
</body>
</html>
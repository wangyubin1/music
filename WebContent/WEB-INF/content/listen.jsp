<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${sessionScope.song.sname}-${song.sauthor}--拾光音乐网</title>
    <link rel="stylesheet" href="${ctx}/css/play.css">
    <!--title的图标-->
    <link rel="icon" href="${ctx}/images/icon/title.ico" type="image/x-icon"/> 
    <link rel="stylesheet" href="${ctx}/css/app.css">
</head>
<body>
<%@ include file="public/header.jsp"%>
<div class="main">
    <table>
        <tr>
            <td><img src="${sessionScope.song.surl}" class="pic"></td>
            <td>
	            <h4 style="color:#ccc">
	            	<img src="images/pic/捕获s.png" style="height:20px;width:20px;display:inline;">
	            	${song.sauthor}
	            </h4>
	            <h2 style="font-weight:200">${sessionScope.song.sname}</h2>
                <br><br><br>
                <audio src="song/${song.sname}-${song.sauthor}.mp3" controls autoplay></audio>
            </td>
        </tr>
    </table>
    <!--------------------评论-------------------->
    <div class="container container_bg" >
        <div class="my_edit" >
            <div class="row" id="edit_form" >
                <span class="pull-left" style="margin:15px;">评论</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form role="form" style="margin-top: 50px;">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <div contentEditable="true" id="content" class="form-control "></div>  
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji" >表情</span>
                                <span>
                                    <input type="file" name=""  class="select_Img" style="display: none" >
                                    <img class="preview" src="">
                                </span>
                                <div class="myEmoji" >
                                    <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade in active" id="set">
                                            <div class="emoji_1"></div>
                                        </div>
                                        <div class="tab-pane fade" id="hot">
                                            <div class="emoji_2"></div>
                                        </div>
                                    </div>
                                </div>
                                <a class="putContent"><button type="button" id="send" class="btn btn-default pull-right disabled" style="cursor:pointer;">发布</button></a>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    </div>
    <!--------------------分割线-------------------->
    简评&nbsp;${requestScope.num}条
    <div style="margin-top:10px;">
        <table class="item_msg">
            <c:forEach items="${requestScope.comment}" var="user"><tr>
                <td class="head">
                    <img src="${user.url}">
                </td>
                <td class="msg"><p><span>${user.uname}</span>&nbsp&nbsp${user.ctime}</p>
                    <span>${user.comment}</span>
                </td>
            </tr></c:forEach>
        </table>
    </div>
</div>

<%@ include file="public/footer.jsp"%>

<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#content").keyup(function(){
            //判断输入的字符串长度
			var content_len = $("#content").text().replace(/\s/g,"").length;
			$(".tips").text("已经输入"+content_len+"个字");
			if(content_len==0){
				// alert(content);
				$(".tips").text("");
				$("#send").addClass("disabled");
				return false;
			}else{
				$("#send").removeClass("disabled");
			}
		});

		//点击按钮发送内容
		$("#send").click(function(){
			var content=$("#content").html();
			//判断选择的是否是图片格式		 
			var imgPath = $(".imgPath").text();
			var start  = imgPath.lastIndexOf(".");
			var postfix = imgPath.substring(start,imgPath.length).toUpperCase();
			if(content != ""){
				if(imgPath!=""){
					if(postfix!=".PNG"&&postfix!=".JPG"&&postfix!=".GIF"&&postfix!=".JPEG"){
							alert("图片格式需为png,gif,jpeg,jpg格式");
					}else{
						$(".item_msg").append("<div class='head'><img src='${sessionScope.user.url}'></div><div class='msg'><p>${sessionScope.user.uname}&nbsp<span>2018-01-05</span></p><span>"+content+"</span></div>"+"<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///"+imgPath+"' >");
					}
				}else{
					 $(".item_msg").prepend("<tr><td class='head'><img src='${sessionScope.user.url}'></td><td class='msg'><p><span>${sessionScope.user.uname}</span>&nbsp2018-01-05</p><span>"+content+"</span></td></tr>");
					 if("${sessionScope.user.uname}" != ""){
						$.post("comment",{uid:"${sessionScope.user.uid}",sid:"${sessionScope.song.sid}",comment:content},function(){

						})
					 }
				}
			}else{
				alert("请输入内容");
			}
			
								
		});
		//添加表情包1
		for (var i = 1; i < 60; i++) {
			$(".emoji_1").append("<img src='img/f"+i+".png' style='width:35px;height:35px' >");
		}
		//添加表情包2
		for (var i = 1; i < 61; i++) {
			$(".emoji_2").append("<img src='img/h"+i+".png' style='width:35px;height:35px' >");
		}
		
		$(".emoji").click(function(){
			$(".myEmoji").show();
			//点击空白处隐藏弹出层
			$(document).click(function (e) {
				if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {
					$(".myEmoji").hide();
				}
			});
		});

		//将表情添加到输入框
		$(".myEmoji img").each(function(){
			$(this).click(function(){
				var url = $(this)[0].src;
				$('#content').append("<img src='"+url+"' style='width:25px;height:25px' >");
				$("#send").removeClass("disabled");
			})
		})
		
		if("${sessionScope.user.uname}" == ""){
			$("#send").remove();
			$(".putContent").append(`
					<div type="button" id="send" class="btn btn-default pull-right disabled" style="background:#ccc">登录后才能评论</div>
					`)
		}
	})
</script>
</body>
</html>
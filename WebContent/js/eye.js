function switchPwd() {
    var passwordeye = $('#passwordeye');
    var showPwd = $(".password");
    passwordeye.off('click').on('click',function(){
        if(passwordeye.hasClass('invisible')){
            passwordeye.attr('src',"./images/icon/开眼.png");
            passwordeye.removeClass('invisible').addClass('visible');//密码可见
            showPwd.prop('type','text');
        }else{
            passwordeye.attr('src',"./images/icon/闭眼.png");
            passwordeye.removeClass('visible').addClass('invisible');//密码不可见
            showPwd.prop('type','password');
        };
    });     
}
switchPwd();

//$("input[name='uname']").blur(function(){
//	var uname = $(this).val();
//	if(uname != ""){
//		$.ajax({
//			url: "ajax",
//			data: {
//				"uname": uname
//			},
//			dataType: 'json',
//			async: false,
//			type: "POST",
//			success: function(data){
//				alert(data);
//			},
//			error: function(data){
//				console.log(data);
//			}
//		})
//	}
//})
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseurl" value="${pageContext.request.contextPath}/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<title>博雅用户登录</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->


<!-- Global styles START -->
<link
	href="${baseurl}assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${baseurl}assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link
	href="${baseurl}assets/global/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${baseurl}assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="${baseurl}assets/global/css/components.css" rel="stylesheet">
<link href="${baseurl}assets/frontend/layout/css/style.css"
	rel="stylesheet">
<link href="${baseurl}assets/frontend/layout/css/style-responsive.css"
	rel="stylesheet">
<link href="${baseurl}assets/frontend/layout/css/themes/red.css"
	rel="stylesheet" id="style-color">
<link href="${baseurl}assets/frontend/layout/css/custom.css"
	rel="stylesheet">

<!-- Theme styles END -->
</head>
<!-- Head END -->
<style type="text/css">
#vCode {
	margin-right: 30px;
	vertical-align: middle;
	width: 70px;
	height: 26px;
	border: 1px solid #DBDBDB;
}
</style>

<script type="text/javascript">


function _change(){
	/*
	 * 1. 获取<img>元素
	 * 2. 重新设置它的src
	 * 3. 使用毫秒来添加参数
	 */
	$("#vCode").attr("src", "${baseurl}VerifyCodeServlet?a=" + new Date().getTime());

}

</script>
<!-- Body BEGIN -->
<body>






	<div class="col-md-8 col-sm-8 center-block">

		<div class="content-form-page ">
			<div class="row">


				<div class="col-md-12">
					<div class="bg-green-turquoise text-center" style="height: 54px;">
						<strong class="bg-font-green-dark font-lg" style="font-size: 37px">博雅会员登录</strong>
						<label class="font-red-thunderbird" id="msg">${msg }</label>
					</div>
					<form class="form-horizontal form-without-legend"
						style="padding-top: 0px;" role="form" id="loginform"target="_parent" action="${baseurl }login.action">
						<div class="form-group">
							<label for="loginname" class="col-md-4 control-label">用户名
								<li class="fa fa-user"></li> <span class="require">*</span>
							</label>
							<div class="col-md-8">

								<input type="text" name="loginname" value="${user.loginname }" id="loginname"
									class="form-control"> <label id="loginnameError"
									style="height: 20px;" class="font-red-thunderbird"></label>
							</div>
  
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">密码
								<li class="fa fa-lock"></li> <span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control"  value="${user.loginpass }"  name="loginpass"
									id="loginpass"> <label style="height: 20px;"
									id="loginpassError" class="font-red-thunderbird"></label>
							</div>

						</div>
						<div class="form-group">
							<label for="verifyCode" class="col-lg-4 control-label">验证码
								<li class="fa fa-bookmark"></li> <span class="require">*</span>
							</label>
							<div class="col-lg-3">
								<input type="text" class="form-control" id="verifyCode"
									name="verifyCode"> <label style="height: 20px;"
									id="verifyCodeError" class="font-red-thunderbird"></label>
							</div>

							<img style="margin-left: 15px;" id="vCode" src="<c:url value='/VerifyCodeServlet'/>" /> <a
								id="verifyCode" href="javascript:_change()">换张图</a>

						</div>
						<div class="row">
							<div class="col-lg-8 col-md-offset-4 padding-left-0">
								<a class="font-red-thunderbird"
									href="page-forgotton-password.html">忘记密码？</a> <a
									class="font-green-jungle" href="page-forgotton-password.html">注册</a>
							</div>

						</div>
						<div class="row">
							<div
								class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
								<button type="button" onclick="submit2()" class="btn btn-primary">登录</button>
							</div>
						</div>
						<div class="row">
							<div
								class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-10 padding-right-30">
								<hr>
								<div class="login-socio">
									<p class="text-muted">其他登录</p>
									<ul class="social-icons">
										<li><a href="javascript:;" data-original-title="facebook"
											class="facebook" title="facebook"></a></li>
										<li><a href="javascript:;" data-original-title="Twitter"
											class="twitter" title="Twitter"></a></li>
										<li><a href="javascript:;"
											data-original-title="Google Plus" class="googleplus"
											title="Google Plus"></a></li>
										<li><a href="javascript:;" data-original-title="Linkedin"
											class="linkedin" title="LinkedIn"></a></li>
									</ul>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END SIDEBAR & CONTENT -->






	<script src="${baseurl}assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script src="${baseurl}assets/global/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script
		src="${baseurl}assets/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="${baseurl}assets/frontend/layout/scripts/back-to-top.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script
		src="${baseurl}assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<!-- pop up -->
	<script
		src="${baseurl}assets/global/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>

	<script src="${baseurl}assets/frontend/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();
            Layout.initUniform();
            Layout.initTwitter();
         // 获取cookie中的用户名
        	var loginname = window.decodeURI("${cookie.loginname.value}");
        	if("${requestScope.user.loginname}") {
        		loginname = "${requestScope.user.loginname}";
        	}
        	$("#loginname").val(loginname);
        	var loginname2=$(window.parent.document).find("＃loginname").val();
        	if(loginname){
        		$("#loginname").val(loginname2);
        	}
        	var error=$(window.parent.document).find("＃error").val();
        	if(loginname){
        		$("#error").html(error);
        	}
        });
        
        /*
    	 * 2. 给注册按钮添加submit()事件，完成表单校验
    	 */
    	 function submit2(){
    		$("#msg").text("");
    		var bool = true;
    		$(".form-control").each(function() {
    			var inputName = $(this).attr("name");
    			if(!invokeValidateFunction(inputName)) {
    				bool = false;
    			}
    		});
    		if(bool){
    			$("#loginform").submit();
    		}
        }
    
    	/*
    	 * 3. 输入框得到焦点时隐藏错误信息
    	 */
    	$(".form-control").focus(function() {
    		var inputName = $(this).attr("name");
    		$("#" + inputName + "Error").text("");
    	});
    	/*
    	 * 4. 输入框推动焦点时进行校验
    	 */
    	$(".form-control").blur(function() {
    		var inputName = $(this).attr("name");
    		invokeValidateFunction(inputName);
    	})
    	/*
 * 输入input名称，调用对应的validate方法。
 * 例如input名称为：loginname，那么调用validateLoginname()方法。
 */
function invokeValidateFunction(inputName) {
	inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
	var functionName = "validate" + inputName;
	return eval(functionName + "()");	
}
    	/*
    	* 校验登录名
      */
function validateLoginname() {
	var bool = true;
	$("#loginnameError").text(" ");
	var value = $("#loginname").val();
	if(!value) {// 非空校验
		$("#loginnameError").text("display", "");
		$("#loginnameError").text("用户名不能为空！");
		bool = false;
	} else if(value.length < 3 || value.length > 20) {//长度校验
		$("#loginnameError").css("display", "");
		$("#loginnameError").text("用户名长度必须在3 ~ 20之间！");
		bool = false;
	}
	return bool;
}

/*
 * 校验密码
 */
function validateLoginpass() {
	var bool = true;
	$("#loginpassError").text(" ");
	var value = $("#loginpass").val();
	if(!value) {// 非空校验
		$("#loginpassError").css("display", "");
		$("#loginpassError").text("密码不能为空！");
		bool = false;
	} else if(value.length < 3 || value.length > 20) {//长度校验
		$("#loginpassError").css("display", "");
		$("#loginpassError").text("密码长度必须在3 ~ 20之间！");
		bool = false;
	}
	return bool;
}

/*
 * 校验验证码
 */
function validateVerifyCode() {
	var bool = true;
	$("#verifyCodeError").text("");
	var value = $("#verifyCode").val();
	if(!value) {//非空校验
		$("#verifyCodeError").css("display", "");
		$("#verifyCodeError").text("验证码非空！");
		bool = false;
	} else if(value.length != 4) {//长度不为4就是错误的
		$("#verifyCodeError").css("display", "");
		$("#verifyCodeError").text("错误的验证码！");
		bool = false;
	} else {//验证码是否正确
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			dataType: "json",
			data: {method: "ajaxValidateVerifyCode", verifyCode: value},
			url: "/boyaBookStore/ajaxValidateVerifyCode.action",
			success: function(flag) {
				if(!flag) {
					$("#verifyCodeError").css("display", "");
					$("#verifyCodeError").text("错误的验证码！");
					bool = false;					
				}
			}
		});
	}
	return bool;
}
    </script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
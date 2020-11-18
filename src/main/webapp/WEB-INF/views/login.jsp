<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="/sources/bootstrap/plugins/fontawesome-free/css/all.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="/sources/bootstrap/dist/css/adminlte.min.css">


<style>   
body.login-page {
	background-image: url('/resources/images/intro.jpg');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
 
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>관리자 로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>
 				
				<form action="/login/process" method="get">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요" value="${param.userid}">  
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>	
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pass"
							placeholder="패스워드를 입력하세요" value=""> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox" id="rememberMe" name="rememberMe" value=""> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-sm-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="/sources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="/sources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script>
	$(document).ready(function(){
	 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    $("#rememberMe").attr("checked", true);
	    var key = getCookie("key");
	    $("#userid").val(key); 
	     
		
	    if($("#userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#rememberMe").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    
	     
	    $("#rememberMe").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#rememberMe").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#userid").val(), 7); // 7일 동안 쿠키 보관 
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	    
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#userid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#rememberMe").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#userid").val(), 7); // 7일 동안 쿠키 보관 
	        }
	    });
	});
	
	
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	</script>

</body>
</html>









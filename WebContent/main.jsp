<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sign in &middot; Twitter Bootstrap</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-image:url("img/background.jpg");
	background-size: 100%;
}

.form-signin {
	max-width: 33%;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

/* .form-signin .btn btn-medium btn-primary{
      	font-size: 10px;
      } */
</style>
</head>

<body>

	<div class="container">
	

		<form class="form-signin" action="loginPro.jsp" method="post">
			<div class="form-group">
				<h2 class="form-signin-heading">Please Sign In</h2>
				<br> 
				<input type="text" class="form-control" name="id" value="case"> 
				<input type="password" class="form-control" name="password" value="1234">
				<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">Remember me</label>
				</div>
				<div class="button">
					<button class="btn btn-sm btn-primary" type="submit">LogIn</button>
					<button class="btn btn-sm btn-primary" type="button" value="회원 가입"
						onclick="location.href='<%=request.getContextPath()%>/myshop/member/register.jsp'">SignIn</button>
					<button class="btn btn-sm btn-primary" type="button" value="아이디 찾기"
						onclick="location.href='<%=request.getContextPath()%>/findid.jsp'">FindId</button>
					<button class="btn btn-sm btn-primary" type="button" value="비번 찾기"
						onclick="location.href='<%=request.getContextPath()%>/findpwd.jsp'">FindPw</button>
						<a href="myshop/admin/main.jsp"><p class="btn btn-sm btn-info">Cancel</p></a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>

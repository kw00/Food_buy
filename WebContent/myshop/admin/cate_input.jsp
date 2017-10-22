<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

<link href="../../assets/css/bootstrap.css" rel="stylesheet">
<link href="../../assets/css/responsive.css" rel="stylesheet">
<link href="../../css/font-awesome.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script.js"></script>
<script>
	function check() {
		if (document.f.code.value == '') {
			alert("카테고리 코드를 입력하십시요.");
			document.f.code.focus();
			return false;
		}
		if (document.f.cname.value == '') {
			alert("카테고리 이름을 입력하십시요.");
			document.f.cname.focus();
			return false;
		}
	}
</script>

<!-- Le styles -->
<style>

.form-signin {
	max-width: 30%;
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

.form-signin input[type="text"], .form-signin input[type="tel"] {
	font-size: 12px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

/* .form-signin .btn btn-medium btn-primary{
      	font-size: 10px;
      } */
</style>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
	<div class="container">

		<%@ include file="top.jsp"%>

		<table class="table table-hover">

			<td colspan=6 valign=top>
<br>
				<form class="form-signin" action="cate_input_ok.jsp" method="post">
					<div class="form-group">
						<h4 class="form-signin-heading">
							<b>카테고리 등록</b>
						</h4>
						<br>
 
						<input type="text" class="form-control" name="code" placeholder="카테고리 코드를 입력하세요."> 
						<input type="tel" class="form-control" name="cname" placeholder="카테고리 이름를 입력하세요.">

						<label> <input type="checkbox" value="remember-me">Remember me </label>
						<div class="button">
						<button class="btn btn-sm btn-primary" type="submit">Submit</button>
						<a href="main.jsp"><p class="btn btn-sm btn-info">Cancel</p></a>
						</div>
					</div>
				</form>
			</td>
		</table>



	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../../assets/js/jquery.js"></script>


			<%@ include file="bottom.jsp"%>
</body>
</html>




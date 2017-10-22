<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,my.shop.*"%>
<%@ page import="my.member.MemberDTO"%>
<%@ page import="my.member.MemberDAO"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Homepage</title>
<style>
.list-group {
	width: 180px;
	align: center;
	valign: top;
}
</style>

<%
	String contextPath = request.getContextPath();
	System.out.println("contextPath:" + contextPath); // /MiniMall

	String memid = (String) session.getAttribute("memid");
	System.out.println("memid:" + memid); // admin, hong ,kim

	MemberDAO dao = MemberDAO.getInstance();
	int no = (Integer) session.getAttribute("memno");
	System.out.println(no);
	MemberDTO member = dao.getMemberSelect(no);
%>

<link rel="icon" href="../../favicon.png" type="image/png">
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/linecons.css" rel="stylesheet" type="text/css">
<link href="../../css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="../../css/responsive.css" rel="stylesheet" type="text/css">
<link href="../../css/animate.css" rel="stylesheet" type="text/css">

<link
	href='https://fonts.googleapis.com/css?family=Lato:400,900,700,700italic,400italic,300italic,300,100italic,100,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Dosis:400,500,700,800,600,300,200'
	rel='stylesheet' type='text/css'>

<!-- =======================================================
    Theme Name: Butterfly
    Theme URL: https://bootstrapmade.com/butterfly-free-bootstrap-theme/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
======================================================= -->

<script type="text/javascript" src="../../js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="../../js/bootstrap.js"></script>
<script type="text/javascript" src="../../js/jquery-scrolltofixed.js"></script>
<script type="text/javascript" src="../../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../../js/jquery.isotope.js"></script>
<script type="text/javascript" src="../../js/wow.js"></script>
<script type="text/javascript" src="../../js/classie.js"></script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$('.res-nav_click').click(function() {
			$('ul.toggle').slideToggle(600)
		});

		$(document).ready(function() {
			$(window).bind('scroll', function() {
				if ($(window).scrollTop() > 0) {
					$('#header_outer').addClass('fixed');
				} else {
					$('#header_outer').removeClass('fixed');
				}
			});

		});

	});
	function resizeText() {
		var preferredWidth = 767;
		var displayWidth = window.innerWidth;
		var percentage = displayWidth / preferredWidth;
		var fontsizetitle = 25;
		var newFontSizeTitle = Math.floor(fontsizetitle * percentage);
		$(".divclass").css("font-size", newFontSizeTitle)
	}
</script>
</head>
<body>

	<!--Header_section-->
	<header id="header_outer">
		<div class="container">
			<div class="header_section">
				<div class="logo">
					<a href="<%=contextPath%>/myshop/display/main.jsp"><img
						src="../../img/logob.png" alt=""></a>
				</div>
				<nav class="nav" id="nav">
					<ul class="toggle">
						<li><a href="<%=contextPath%>/myshop/display/mall.jsp">mall</a></li>
						<li><a
							href="<%=contextPath%>/myshop/display/mall_cartList.jsp">Shopbasket</a></li>
						<li><a href="<%=contextPath%>/myshop/board/list.jsp">Board</a></li>
						<li><a href="<%=contextPath%>/myshop/display/recipe.jsp">recipe</a></li>
						<li><a href="<%=contextPath%>/myshop/display/company.jsp">Company</a></li>
						<li><a href="<%=contextPath%>/myshop/admin/main.jsp">Admin</a></li>
						<li><a data-toggle="modal" href="#myModal">Mypage</li>
						<li><a
							href="<%=contextPath%>/myshop/display/mall_bookList.jsp">Bookmark</a></li>
						<li><a href="../../main.jsp">SignIn</a></li>
						<li><a class=logout href="<%=contextPath%>/logout.jsp">logout
						</a></li>
						<li></li>
					</ul>
					<ul class="">
						<li><a href="<%=contextPath%>/myshop/display/mall.jsp">mall</a></li>
						<li><a
							href="<%=contextPath%>/myshop/display/mall_cartList.jsp">Shopbasket</a></li>
						<li><a href="<%=contextPath%>/myshop/board/list.jsp">Board</a></li>
						<li><a href="<%=contextPath%>/myshop/display/recipe.jsp">recipe</a></li>
						<li><a href="<%=contextPath%>/myshop/display/company.jsp">Company</a></li>
						<li><a href="<%=contextPath%>/myshop/admin/main.jsp">Admin</a></li>
						<li><a data-toggle="modal" href="#myModal">Mypage</li>
						<li><a
							href="<%=contextPath%>/myshop/display/mall_bookList.jsp">Bookmark</a></li>
						<li><a href="../../main.jsp">SignIn</a></li>
						<li><a class=logout href="<%=contextPath%>/logout.jsp">logout
						</a></li>
						<li></li>
					</ul>
				</nav>
				<a class="res-nav_click animated wobble wow"
					href="javascript:void(0)"><i class="fa-bars"></i></a>
			</div>
		</div>
	</header>


	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">MY PAGE</h4>
				</div>
				<div style="height: 550px;">


					<table class="table table-hover">
						<br><br><br>
						<tr>
							<td>아이디</td>
							<td><%=memid%></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><%=member.getName()%></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><%=member.getNickname()%></td>

						</tr>
						<tr>
							<td>이메일</td>
							<td><%=member.getEmail()%></td>
						</tr>

						<tr>
							<td>핸드폰</td>
							<td><%=member.getPhoneNumber()%></td>
						</tr>

						<tr>
							<td>성별</td>
							<td><%=member.getGender()%></td>

						</tr>

						<tr>
							<td>가입일자</td>
							<td><%=member.getJoindate()%></td>
						</tr>
					</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>





	<!--Header_section-->
	<!--/.fluid-container-->
	<!-- 	<tr height=400>
		<div class=width=180px align=center valign=top>
			카테고리
			<table width=100% align=left border=1>

			</table>
			</td>
			<td width=590px align=center>
 -->
	<!--main-section-end-->
	<!--new_portfolio-->
	<!-- Portfolio -->
	<script src="contactform/contactform.js"></script>
</body>
</html>
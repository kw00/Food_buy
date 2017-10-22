<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,my.shop.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1">
<embed name="lostmojo" src="../../img/company.mp4" width="150" height="90" loop="false" autostart="false">

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
					<li><a href="<%=contextPath%>/myshop/display/mypage.jsp">My
							page</a></li>
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
					<li><a href="<%=contextPath%>/myshop/display/mypage.jsp">My
							page</a></li>
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


<div class="container-fluid">
	<div class="row-fluid">
		<div class="span3">
			<div class="well sidebar-nav">
				<ul class="nav nav-list">

					<tr height=400>
						<td width=150 align=center valign=top>
							<!-- 회사소개 목록 -->
							<div class="list-group">
								<a href="#" class="list-group-item"><b>Tree / View</b></a>
								<tr>
									<td><a href="<%=contextPath%>/myshop/display/ceo.jsp"
										class="list-group-item"> 회사 비전 </a></td>
								</tr>
								<tr>
									<td><a href="<%=contextPath%>/myshop/display/history.jsp"
										class="list-group-item"> 회사 연혁 </a></td>
								</tr>
								<tr>
									<td><a href="<%=contextPath%>/myshop/display/map.jsp"
										class="list-group-item"> 조직도 </a></td>
								</tr>
							</div>
			</div>
		</div>
	</div>
</div>
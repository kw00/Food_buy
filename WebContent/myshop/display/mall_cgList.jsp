<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1">
<title>Homepage</title>
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

</style>
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
	<div class="container">
		<!--Header_section-->
		<table class="table" align="center">
		<tr>
		<td>
		<div class="list-group">
			<a href="#" class="list-group-item"><b>카테고리</b></a>
			<%
				CategoryDao cdao = CategoryDao.getInstance();
				ArrayList<CategoryBean> catelists = cdao.categoryAll();

				if (catelists.size() != 0) {
					for (CategoryBean cate : catelists) {
						String cgname = cate.getCname();
						String code = cate.getCode();
			%>
			<a class="list-group-item"
				href="<%=contextPath%>/myshop/display/mall_cgList.jsp?code=<%=code%>&cgname=<%=cgname%>">
				<%=cgname%> <!-- 카테고리명[카테고리코드] 양복[man]-->
			</a>
			<%
				} //for-----------
				} else {
					out.println("<tr><td>데이터 없음</td></tr>");
				}
			%>
		</div>
		</td>
		<td>
		<div class="main-group">
		
		<% 

		ProductDao pdao = ProductDao.getInstance();
		DecimalFormat df=new DecimalFormat("###,###");
		String code=request.getParameter("code"); // 카테고리코드
		String cgname=request.getParameter("cgname"); // 카테고리명
		System.out.println(code +","+cgname); // man,양복
		

		ArrayList<ProductBean> lists = pdao.selectByCategory(code);
		if(lists.size()==0){
			out.println("<B>"+cgname+"상품 없습니다.</B>");		
		}else{

	
		int count=0; 
		for(ProductBean bean : lists){
			count++;
			String pimage=bean.getPimage();
			int pnum=bean.getPnum();
			String pname=bean.getPname();
			int price=bean.getPrice();
			int point=bean.getPrice()/10;	
			
			String imgpath=request.getContextPath()+"/img/"+pimage; 
	%>

	<td>
		<a href="mall_prodView.jsp?pnum=<%=pnum%>">
		<br><br><br><br><br><br>
				<img src="<%=imgpath%>" width=200 height=200 border=0>
		</a> <br> <br> <%=pname%><br> <br> 
		<font color=green><%=df.format(price)%></font>
			원<br> <br> 
			<font color=green> <%=point%></font>point
		</td>

		<%
		}
			if(count%3==0){//3개 단위로 보여주기 위해
				out.println("</tr><tr>");
			}//if-------
		
		}//for---------------
	%>
		</div>
		</td>
		</tr>
		
		<hr>

		<tr>
		<!--Header_section-->

		<!--Top_content-->

		<script type="text/javascript">
			$(document).ready(function(e) {
				$('#header_outer').scrollToFixed();
				$('.res-nav_click').click(function() {
					$('.main-nav').slideToggle();
					return false

				});

			});
		</script>
		<script>
			wow = new WOW({
				animateClass : 'animated',
				offset : 100
			});
			wow.init();
			document.getElementById('').onclick = function() {
				var section = document.createElement('section');
				section.className = 'wow fadeInDown';
				section.className = 'wow shake';
				section.className = 'wow zoomIn';
				section.className = 'wow lightSpeedIn';
				this.parentNode.insertBefore(section, this);
			};
		</script>
		<script type="text/javascript">
			$(window).load(function() {

				$('a').bind('click', function(event) {
					var $anchor = $(this);

					$('html, body').stop().animate({
						scrollTop : $($anchor.attr('href')).offset().top - 91
					}, 1500, 'easeInOutExpo');
					/*
					if you don't want to use the easing effects:
					$('html, body').stop().animate({
					   scrollTop: $($anchor.attr('href')).offset().top
					}, 1000);
					 */
					event.preventDefault();
				});
			})
		</script>

		<script type="text/javascript">
			jQuery(document)
					.ready(
							function($) {
								// Portfolio Isotope
								var container = $('#portfolio-wrap');

								container.isotope({
									animationEngine : 'best-available',
									animationOptions : {
										duration : 200,
										queue : false
									},
									layoutMode : 'fitRows'
								});

								$('#filters a').click(function() {
									$('#filters a').removeClass('active');
									$(this).addClass('active');
									var selector = $(this).attr('data-filter');
									container.isotope({
										filter : selector
									});
									setProjects();
									return false;
								});

								function splitColumns() {
									var winWidth = $(window).width(), columnNumb = 1;

									if (winWidth > 1024) {
										columnNumb = 4;
									} else if (winWidth > 900) {
										columnNumb = 2;
									} else if (winWidth > 479) {
										columnNumb = 2;
									} else if (winWidth < 479) {
										columnNumb = 1;
									}

									return columnNumb;
								}

								function setColumns() {
									var winWidth = $(window).width(), columnNumb = splitColumns(), postWidth = Math
											.floor(winWidth / columnNumb);

									container.find('.portfolio-item').each(
											function() {
												$(this).css({
													width : postWidth + 'px'
												});
											});
								}

								function setProjects() {
									setColumns();
									container.isotope('reLayout');
								}

								container.imagesLoaded(function() {
									setColumns();
								});

								$(window).bind('resize', function() {
									setProjects();
								});

							});
			$(window).load(function() {
				jQuery('#all').click();
				return false;
			});
		</script>
		<script src="contactform/contactform.js"></script>
</body>
</html>

<%@ include file="mall_bottom.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mall_top3.jsp"%>

<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<div class="container">
	<caption>
		<h4>
			<b>찾아오시는 길</b>
		</h4>
		<ol class="breadcrumb pull-right">
			<li><a href="#">회사소개</a></li>
			<li class="active">찾아오시는 길</li>
		</ol>
	</caption>
	<html> 
<head> 
<title>구글지도</title> 


<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko®ion=kr&key=
 
AIzaSyCKwabpym6hflr70wUYWBLThw24Vro8WEI "></script>

 <script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(37.555309, 126.946839); // y, x좌표값
  var mapOptions = { 
        zoom: 15, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var marker = new google.maps.Marker({ 
            position: myLatlng, 
            map: map, 
            title: "회사이름" 
  }); 
  var infowindow = new google.maps.InfoWindow( 
          { 
            content: "<h1>회사이름</h1>", 
            maxWidth: 300 
          } 
  ); 

  google.maps.event.addListener(marker, 'click', function() { 
  infowindow.open(map, marker); 
  }); 
  } 
 </script> 

</head> 

<body onload="initialize()"> 

지도를 출력할 영역에 아래 소스 삽입!
<div id="map_canvas" style="width:600px; height:400px;"></div> 

</body> 
</html> 
	
	<div class="container">
    <div class="row">
        <div class="col-md-6">
			<h4 class="section-title">주소</h4>
				서울특별시 마포구 <br>
            	대흥로 28길 <strong>주식회사 Refresh shop</strong>
			<h4 class="section-title">연락처</h4>
				<strong>Tel :</strong> 1577 - 7862 <br>
				<strong>Fax :</strong> 010 - 9445 - 5545 <br>
				<strong>E-mail :</strong> <a href="mailto:case@naver.com">qpu20@naver.com</a>
				<h4 class="section-title">근무시간</h4>
			<strong>월~금 :</strong> 09시 ~ 18시
		</div>
		<div class="col-md-6">
			<h4 class="section-title">주변정류장</h4>
			<ul class="list-unstyled three_cols">
				<li>KT</li>
				<li>우체국</li>
				<li>소방서</li>
				<li>GS주유소</li>
				<li>현대CNS</li>
				<li>(주)서진하이테크</li>
				<li>(주)서울에프에이</li>
            </ul>
			<h4 class="section-title">시내버스노선</h4>
			<ul class="list-unstyled three_cols">
				<li>20-1번</li>
				<li>21번</li>
				<li>26번</li>
				<li>350번</li>
           		<li>510번</li>
            </ul>
            <h4 class="section-title">지하철노선</h4>
				4호선 정왕역
		</div>    
    </div>
</div> <!-- container -->


	<%@ include file="mall_bottom.jsp"%>
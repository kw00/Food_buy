<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="../../css/font-awesome.css" rel="stylesheet" type="text/css">
    

<style>
table{
font-size: 14px;
}

</style>
</head>
<body>
<div class="container">
<%@ include file="top.jsp"%>

<td colspan=6 valign=top>

<caption><h4><b>상품 등록</b></h4></caption>
<form name="f" action="prod_input_ok.jsp" method="POST" enctype="multipart/form-data">
	
	 <br>
  <table class="table table-hover">
	 <tr>
		<td class=active>카테고리</td>
		<td>
		<!-- 카테고리 목록 가져오기---------- -->		
		<select name="pcategory_fk">
		<%
		CategoryDao cdao = CategoryDao.getInstance();
		java.util.ArrayList<CategoryBean> arr = cdao.categoryAll();
		if(arr.size()==0){ 
		%>
			<option value="">카테고리 없음</option>
		<%
		}else{
			for(CategoryBean cate : arr){
				String cname=cate.getCname(); // 양복
				String code=cate.getCode(); // man
			%>
				<option value="<%=code%>"><%=cname%> [<%=code%>]</option>
			<% 
			}//for
		}
		%>	
		</select>
		<!-- -------------------------------- -->
		</td>
	</tr>
	<tr>
		<td class=active>상품명</td>
		<td>
		<input type=text name="pname" value="제주 삼다수 2.0L">
		</td>
	</tr>
	<tr>
		<td class=active>상품 코드</td>
		<td>
		<input type=text name="pcode">
		<!-- pcode는 bean에도 없고, 테이블에도 없다.
		카테고리 코드(code)와 pcode에 작성하는 내용을 더해서 pcategory_fk에 넣을것이다. -->
		</td>
	</tr>
	<tr>
		<td class=active>제조사</td>
		<td>
		<input type=text name="pcompany" value="광동제약">
		</td>
	</tr>
	<tr>
		<td class=active>상품 이미지</td>
		<td>
		<input type=file name="pimage"><!-- pimage=Koala.jpg -->
		</td>
	</tr>
	<tr>
		<td class=active>상품 수량</td>
		<td>
		<input type=text name="pqty" maxlengtd=8 value="10">
		</td>
	</tr>
	<tr>
		<td class=active>상품 가격</td>
		<td>
		<input type=text name="price" maxlengtd=8 value="1000">
		</td>
	</tr>
	<tr>
		<td class=active>상품 분류</td>
		<td>
			<select name="pspec">
			<option value="과일/견과">과일/견과</option>
			<option value="채소">채소</option>
			<option value="쌀/잡곡">쌀/잡곡</option>
		 	<option value="정육/계란류">정육/계란류</option>
			<option value="수산물/해산물/건어물">수산물/해산물/건어물</option>
			<option value="생수/음료/커피/분유" SELECTED>생수/음료/커피/분유</option>
 			<option value="과자/초콜릿/시리얼/빵">과자/초콜릿/시리얼/빵</option>
			<option value="라면/통조림/조미료/장류">라면/통조림/조미료/장류</option>
			<option value="유제품/냉장/냉동/간편식">유제품/냉장/냉동/간편식</option>
			<option value="건강식품/친환경/유기농">건강식품/친환경/유기농</option> -->
			</select>
		</td>
	</tr>
	<tr>
		<td class=active>상품 설명</td>
		<td>
		<textarea name="pcontents" rows=10 cols=100 style="resize: none;">제주특별자치도개발공사 제주 삼다수 2.0Lml</textarea>
		</td>
	</tr>
	<tr>
		<td class=active>상품 포인트</td>
		<td><input type=text name="point"></td>
	</tr>
</table>
<button class="btn btn-sm btn-primary" type="submit">상품 등록</button>
		<a href="main.jsp"><p class="btn btn-sm btn-info">취소</p></a>
</form>
</td>
<%@ include file="bottom.jsp"%>
</div>
</body>

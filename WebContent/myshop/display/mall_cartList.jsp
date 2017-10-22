<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />

<div class="container">

	<table class="table table-hover">
		<tr class=m2>
			<td colspan=6 align=center>
				<h4>장바구니 보기</h4>
			</td>
		</tr>
		<tr align=center>
			<td width="10%">번호</td>
			<td width="25%">상품명</td>
			<td width="15%">수량</td>
			<td width="20%">단가</td>
			<td width="20%">금액</td>
			<td width="10%">삭제</td>
		</tr>
		<!-- -------------------------- -->
		<%
	DecimalFormat df=new DecimalFormat("###,###");
	int cartTotalPrice=0;//장바구니 총액
	int cartTotalPoint=0;//누적 포인트
  
	Vector<ProductBean> cv = mallCart.getAllProducts();
	System.out.println("mall_CartList cv갯수:"+cv.size());
	
	if(cv.size()==0){
		out.println("<tr><td colspan=6 align=center><b>");
		out.println("선택된 상품이 없어요");
		out.println("</b></td></tr></table>");
	}
	else{ 
		for(ProductBean pd: cv){
			String pimage = pd.getPimage() ;
			String imgpath=
					request.getContextPath()+"/img/"+pimage; 
		%>
		<tr>
			<td align=center><%=pd.getPnum()%></td>
			<td align=center><img src="<%=imgpath%>" width=100 height=100>
				<br>
			<b><%=pd.getPname()%></b></td>
			<td align=center>
				<!-- form시작 --수량 수정 폼----- -->
				<form name="f" method="POST" action="mall_cartEdit.jsp">
					<input type="text" size="1" name="oqty" value="<%=pd.getPqty()%>">개
					<input type="hidden" name="pnum" value="<%=pd.getPnum()%>">
					<input type="submit" value="수정">
				</form> <!-- --------------------------- -->
			</td>
			<td align=right><b> <%=df.format(pd.getPrice())%> 원<br>
					<%=df.format(pd.getPrice()/10)%> point
			</b></td>
			<td align=right><font color=green> <b> <%=df.format(pd.getTotalPrice())%>
						원<br> <%=df.format(pd.getTotalPrice()/10)%> point
				</b>
			</font></td>
			<td align=center><a
				href="mall_cartDel.jsp?pnum=<%=pd.getPnum()%>"><input
					type="button" value="삭제"></input></a></td>
		</tr>
		<% 
			//장바구니의 총 금액 추가와 포인트 누적
			cartTotalPrice += pd.getTotalPrice();
			cartTotalPoint += pd.getTotalPoint();
		}//for-----------
	%>
		<!-- -------------------------- -->
		<tr class="m2">
			<td colspan=5>장바구니 총액 : <font color=green><b><%=df.format(cartTotalPrice)%></b>
					원<br>
			</font> 총 적립 포인트 : <font color=green><b><%=df.format(cartTotalPrice/10)%></b>
					point
			</font>
			<td>
			<a href="mall_order.jsp?pnum=00&oqty=00"><p class="btn btn-sm btn-primary">주문하기</p></a> 
			<a href="javascript:history.go(-2);"><p class="btn btn-sm btn-info">계속쇼핑</p></a>
		</tr>
	
	<%
	}
	 %>
	 <%@ include file="mall_bottom.jsp"%>
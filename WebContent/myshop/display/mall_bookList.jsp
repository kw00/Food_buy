<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />

<div class="container">
	<caption><h4><b>관심상품 목록</b></h4></caption><br>
	<%
		DecimalFormat df = new DecimalFormat("###,###");
		int cartTotalPrice = 0;//장바구니 총액
		int cartTotalPoint = 0;//누적 포인트

		Vector<ProductBean> cv = mallCart.getAllProducts();
		System.out.println("mall_CartList cv갯수:" + cv.size());

		if (cv.size() == 0) {
			out.println("<tr><td colspan=6 align=center><b>");
			out.println("선택된 상품이 없어요");
			out.println("</b></td></tr></table>");
		} else {
			for (ProductBean pd : cv) {
				String pimage = pd.getPimage();
				String imgpath = request.getContextPath() + "/img/" + pimage;
	%>
	<div class="col">
		<div class="col-xs-6 col-md-3">
			<div class="thumbnail">
			<br>
				<img src="<%=imgpath%>">
				<br>
				<div class="caption">
					<table class="table table-hover">
						<tr>
							<th>상품명</th>
							<td><p><%=pd.getPname()%></p></td>
						</tr>
						<tr>
							<th>상품번호</th>
							<td><p><p><%=pd.getPnum()%></p></td>
						</tr>
						<tr>
							<th>상품가격</th>
							<td><p><%=df.format(pd.getPrice())%></p></td>
						</tr>
						<tr>
							<th>구입수량</th>
							<td><p><%=pd.getPqty()%></p></td>
						</tr>
						<tr align=center>
							<td colspan=2><a href="mall_cartList.jsp?pnum=<%=pd.getPnum()%>">
									<p class="btn btn-sm btn-primary">주문</p>
							</a>
							<a href="mall_bookDel.jsp?pnum=<%=pd.getPnum()%>">
									<p class="btn btn-sm btn-info">삭제</p>
							</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<%
		} //for-----------
	%>
	</table>
	<%
		}
	%>
	</div>
	<br>
	<%@ include file="mall_bottom.jsp"%>
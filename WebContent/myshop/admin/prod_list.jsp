<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
table{
font-size: 14px;
}

</style>

<script type="text/javascript">
	function checkDel(pnum, pimage) {
		var isdel = window.confirm("정말로 삭제하시겠습니까?"); // window. 생략가능 
		if (isdel) {
			location.href = "prod_delete.jsp?pnum=" + pnum + "&pimage="
					+ pimage;
		}
	}
</script>

	<div class="container">

		<%@ include file="top.jsp"%>
		<caption>
			<h4>
				<b>상품 목록</b>
			</h4>
		</caption>
		<br>
		<table class="table table-hover">
			<tr class=active align="center">
				<td>번호</td>
				<td>상품코드</td>
				<td>상품명</td>
				<td>이미지</td>
				<td>가격</td>
				<td>제조사</td>
				<td>수량</td>
				<td>포인트</td>
				<td>수정|삭제</td>
			</tr>
			<%
				ProductDao pdao = ProductDao.getInstance();
				ArrayList<ProductBean> lst = pdao.productAll();
				if (lst.size() == 0) {
					out.println("<tr><td colspan=8>");
					out.println("데이터가 없습니다.");
				} //if---------

				for (ProductBean prod : lst) {
			%>
			<tr align="center">
				<td><%=prod.getPnum()%></td>
				<td><%=prod.getPcategory_fk()%></td>
				<!-- 카테고리코드(code)+상품코드 -->
				<td><%=prod.getPname()%></td>
				<td>
					<%
						String imgpath = request.getContextPath() + "/img/" + prod.getPimage();
							System.out.println("imgpath:" + imgpath);
							//imgpatd:/MiniMall/myshop/images/Tulips.jpg
					%> <a href="prod_view.jsp?pnum=<%=prod.getPnum()%>"> <img
						src="<%=imgpath%>" border=0 width=100 height=100>
				</a>
				</td>
				<td><%=prod.getPrice()%></td>
				<td><%=prod.getPcompany()%></td>
				<td><%=prod.getPqty()%></td>
				<td><%=prod.getPrice()/10%></td>
				<td><a href="prod_update.jsp?pnum=<%=prod.getPnum()%>"><p class="btn btn-xs btn-primary">수정</p></a>
					<a
					href="javascript:checkDel('<%=prod.getPnum()%>','<%=prod.getPimage()%>');"><p class="btn btn-xs btn-info">삭제</p></a>
					<!-- javascript: 없으면 에러남 --></td>
			</tr>
			<%
				} //for-----------------
			%>
		</table>

		<%@ include file="bottom.jsp"%>


<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
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

			<caption>
				<h4><b>카테고리 목록</b></h4>
			</caption>
			<br>
			<table class="table table-hover">
				<tr class=active align="center">
					<td>번호</td>
					<td>카테고리 코드</td>
					<td>분류</td>
					<td>기능</td>
				</tr>
				<%
					CategoryDao dao = CategoryDao.getInstance();
					ArrayList<CategoryBean> arr = dao.categoryAll();

					if (arr.size() == 0) {
						out.println("<tr><td colspan=4>데이터가 없습니다.</td></tr>");
					}

					for (int i = 0; i < arr.size(); i++) {
						CategoryBean data = arr.get(i);
				%>
				<tr align="center">
					<td><%=data.getCnum()%></td>
					<td><%=data.getCode()%></td>
					<td><%=data.getCname()%></td>
					<td><a
						href="cate_delete.jsp?cnum=<%=data.getCnum()%>"><p class="btn btn-xs btn-info">삭제</p></a></td>
				</tr>
				<%
					}
				%>
			</table>
		</td>
		<%@ include file="bottom.jsp"%>
</body>

<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*, my.shop.*"%>
    
<%@ include file="top.jsp" %>

<style>
table{
	border-spacing: 2px;
	border-collapse: separate;
	border-color:white;
}

</style>
<div class="container">
<td colspan=6 align=center>
<%    
	String pnum=request.getParameter("pnum");
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean bean = pdao.selectByPnum(pnum);
	if(bean == null){
%>
		<script type="text/javascript">
			alert("<%=pnum%>번에 해당하는 상품이 없어요");
			history.back();   
		</script>
<%
		return;  
	}//if--------------------
%>
<caption><h4><b>상품 상세보기</b></h4></caption>
<br>
<form name="f" action="prod_list.jsp" method="post"> 
<table class="table table-hover">
	<tr>
		<th width ="15%" class="m2">카테고리</th>
		<td width ="35%" align=left><b><%=bean.getPcategory_fk()%></b></td>
		<th width ="15%" class="m2">상품번호</th>
		<td width ="35%" align=left><b><%=bean.getPnum()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품명</th>
		<td align=left><b><%=bean.getPname()%></b></td>
		<th class="m2">제조회사</th>
		<td align=left><b><%=bean.getPcompany()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품이미지</th>
		<td colspan=3> 
<%
	String imgpath = "/img/" + bean.getPimage() ;			
	String pimage=request.getContextPath()+imgpath; 
%>
		<img src="<%=pimage%>" width=200>
		</td>
	</tr>
	<tr>
		<th class="m2">상품 수량</th>
		<td align=left><b><%=bean.getPqty()%></b></td>
		<th class="m2">상품 가격</th>
		<td align=left><b><%=bean.getPrice()%></b></td>
	</tr>
	<tr>
		<th class="m2">상품 분류</th>
		<td align=left><b><%=bean.getPspec()%></b></td>
		<th class="m2">상품 포인트</th>
		<td align=left><b><%=bean.getPrice()/10%></b></td>
	</tr>
	<tr>
		<th class="m2">상품 소개</th>
		<td colspan=3 align=left>
		<textarea name="pcontents" style="resize:none"
			 rows=5 cols=50 disabled><%=bean.getPcontents()%></textarea>
		</td>
	</tr>
	<tr>	
		<td colspan=4 class="m1" align="center">
		<button class="btn btn-sm btn-info" type="submit">돌아가기</button>
		</td>
	</tr>
</table>
</form>
</td>
<%@ include file="bottom.jsp" %>  


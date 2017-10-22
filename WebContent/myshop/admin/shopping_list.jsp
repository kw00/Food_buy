<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.mall.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*, my.shop.*"%>
    
<head>
<jsp:useBean id="odao" class="my.shop.mall.Orders" />
<jsp:useBean id="order" class="my.shop.mall.OrderBean" />
<%
	DecimalFormat df = new DecimalFormat("###,###");
	String memid = request.getParameter("memid") ;
	System.out.println("memid:"+memid);
	
	Vector<OrderBean> lists = null ;
	if(memid != null){
		lists = odao.getOrderList(memid) ;	
	}
	int list_total=0;
%>
</head>

<style>
table{
font-size: 14px;
}
</style>

<body>
	<div class="container">
	
<%@ include file="top.jsp"%> 
	<table class="table table-hover">
	<tr>
		<td colspan=5>
		<br>
			<form action="shopping_list.jsp" method="post">
				조회할 회원 아이디 입력 :   
				<input type="text" name="memid" value="case">
				<input type="submit" value="내역 조회">
			</form>
			<br>
		</td>
	</tr>	
	<br>
	<tr class=active align="center">
		<td>고객명</td>	
		<td>아이디</td>
		<td>레시피명</td>
		<td>수량</td>
		<td>금액</td>
	</tr>
	<%
		if(lists != null){
			for(OrderBean bean : lists ){
	%>
		<tr align="center">
			<td><%=bean.getMname()%></td>	
			<td><%=bean.getMid()%></td>
			<td><%=bean.getPname()%></td>
			<td><%=bean.getQty()%></td>
			<td>￦<%=df.format(bean.getAmount())%></td> 
		</tr>	
	<%		
				list_total += bean.getAmount();
			}
		}
	%>  
	<tr>
		<td colspan=4 align="center">총 합</td>
		<td align="right">￦<%=df.format(list_total)%></td>
	</tr>
	</table>

<%@ include file="bottom.jsp"%>
</body>



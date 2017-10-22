<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mallCart" 
	class="my.shop.mall.CartBean" scope="session"/>

<%
	String pnum=request.getParameter("pnum");
	String oqty=request.getParameter("oqty");
	
	if(pnum==null||oqty==null||
			pnum.trim().equals("") || oqty.trim().equals("")){
		%>
		<script type="text/javascript">
			alert("잘못 들어온 경로입니다.");
			history.back();
		</script>
		<% 
	}
	
	try{
		mallCart.setEdit(oqty,pnum); 
		response.sendRedirect("mall_cartList.jsp");
	
	}catch(NumberFormatException e){ 
		  
		%>
		<script type="text/javascript">
			alert("수량은 숫자로 입력해야 합니다.");
			history.back(); //history.go(-1);  
		</script>
		<%
	}
%>

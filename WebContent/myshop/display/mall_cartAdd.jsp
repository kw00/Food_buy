<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<jsp:useBean id="mallCart" 
			class="my.shop.mall.CartBean" scope="session"/>
     <!-- my.shop.mall.CartBean mallCart = new my.shop.mall.CartBean() -->
<%  
	String pnum=request.getParameter("pnum");
	String oqty=request.getParameter("oqty"); // 상품갯수
	System.out.println("상품번호/수량:"+pnum+"/"+oqty);
	
	if(oqty==null|| Integer.parseInt(oqty) <1){
		response.sendRedirect("mall.jsp"); 
		return;  
	}
	pnum=pnum.trim();
	oqty=oqty.trim();
	
	System.out.println("pnum : " + pnum );
	System.out.println("oqty : " + oqty);
	
	mallCart.addProduct(pnum,oqty); 
	response.sendRedirect("mall_cartList.jsp");
	
%>



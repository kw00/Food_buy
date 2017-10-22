<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
   <!-- 결재하기 버튼 클릭했을 때 오는 화일 -->
<jsp:useBean id="order" class="my.shop.mall.Orders"/>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />

<%

	String msg ;
	String url ;

	int no = (Integer)(session.getAttribute("memno"));
	String id = (String)session.getAttribute("memid");
	
	Vector<ProductBean> cv = mallCart.getAllProducts();
	int cnt = -1 ;
	cnt = order.insertOrders( no, cv ) ;
	// no:회원번호 ,   cv:장바구니에 담긴 상품목록 , cnt:orders테이블에 삽입된 레코드갯수
	
	
	if(cnt != -1){
		msg = "주문 완료했습니다." ;
		url = request.getContextPath() +  "/myshop/display/mall.jsp" ;
						 				
		mallCart.removeAllProduct();
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			var resp = confirm('계속하시겠습니까?') ;
			if(resp){
				location.href=
				"<%=request.getContextPath()%>/myshop/display/mall.jsp";
			}else{
				location.href=
					"<%=request.getContextPath()%>/logout.jsp" ;
			}	
		</script>
<% 
	}else{
		msg = "주문 실패" ;
		url = request.getContextPath() +  "/myshop/display/mall.jsp" ;
	}
%>




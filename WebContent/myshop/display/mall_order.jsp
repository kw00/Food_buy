<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<%@ include file="mall_top.jsp"%>
<%
	if(memid.equals("admin")){
%>
	<script type="text/javascript">
		alert('관리자는 주문을 할 수 없습니다.') ;
		history.back(); 
	</script>
<%
	}
%>


<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session" />

<div class="container">

<table class="table table-hover">
	<tr class=m2>
		<td colspan=6 align=center><h4>결재 내역서 보기</h4></td>
	</tr>
	<tr class=m1 align=center >
		<td colspan=2>상품 이미지</td>
		<td colspan=2>상품명</td>
		<td colspan=1>수량</td>
		<td colspan=1>금액</td>
	</tr>
	<%
	/* mall_prodView.jsp, mall_cartList.jsp에서 넘어옴 */
	String pnum=request.getParameter("pnum");
	String oqty=request.getParameter("oqty"); 

	if(!pnum.equals("00") && !oqty.equals("00")){ 
		if(pnum==null||pnum.trim().equals("")||
				oqty==null||oqty.trim().equals("") || 
					Integer.parseInt(oqty) <1){
			
			response.sendRedirect("mall.jsp");
			return;
		}
		pnum=pnum.trim();
		oqty=oqty.trim();
		System.out.println("pnum : " + pnum + "<br>");
		System.out.println("oqty : " + oqty + "<br>");
		mallCart.addProduct(pnum,oqty); 
	}


	DecimalFormat df=new DecimalFormat("###,###");
	int totalPrice=0;
	Vector<ProductBean> cv = mallCart.getAllProducts(); 
	//장바구니에 있는 모든 상품을 반환 
		
		
	for(ProductBean pd : cv){
		String pimage = pd.getPimage() ;
		String imgpath=
				request.getContextPath()+"/img/"+pimage; 
	%>
		<tr align="center">
			<td colspan=2><img src="<%=imgpath%>" width=100 height=100><br></td>
			<td colspan=2><%=pd.getPname()%></td>
			<td colspan=1><%=pd.getPqty()%>개</td>
			<td colspan=1><%=df.format(pd.getTotalPrice())%>원</td>
		</tr>
		<%	
		totalPrice += pd.getTotalPrice();
	}
	%>
	<tr class=m1>
	<br>
		<td colspan=5 align=center><b>결재하실 총액은</b>: 
			<font color=green><%=df.format(totalPrice)%>원<br></font>
		</td>
		<td colspan=1>
		<p class="btn btn-sm btn-primary"
	onclick="location.href='<%=request.getContextPath()%>/myshop/display/mall_calculate.jsp'">
	결제하기</p>
	<a href="javascript:history.go(-3);">
	<p class="btn btn-sm btn-info">
	취소</p></a>
	</td>
	</tr>
</table>

	<br><br>


<%@ include file="mall_bottom.jsp"%>






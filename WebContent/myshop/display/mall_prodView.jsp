<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="mall_top.jsp" %>

<style>
.imgPro {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.imgPro:hover img{
    -webkit-transform:scale(1.3);
    -moz-transform:scale(1.3);
    -ms-transform:scale(1.3);   
    -o-transform:scale(1.3);
    transform:scale(1.3);
}

</style> 

<script type="text/javascript">

function goBookmark(pnum){
	alert("관심상품으로 등록하시겠습니까?");
	
	var check = confirm('등록하시려면 확인을 선택하시고 관심상품 페이지로 이동합니다.');
	if(check){
		document.f.action
		="<%=request.getContextPath()%>/myshop/display/mall_bookAdd.jsp?pnum="+pnum;
		document.f.submit();
	}
	else{
		return false;
	}
	
}

function goCart(pnum){
	document.f.action
	="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum="+pnum;
	document.f.submit();	
}

function goOrder(pnum){
	document.f.action
	="<%=request.getContextPath()%>/myshop/display/mall_order.jsp?pnum="+pnum;
	document.f.submit();
}
</script>
<% 
	ProductDao pdao = ProductDao.getInstance();
	DecimalFormat df=new DecimalFormat("###,###");
	String pnum=request.getParameter("pnum");
	
	my.shop.ProductBean bean = pdao.selectByPnum(pnum); 
	
	if(bean==null){
		out.println("<b>["+pnum+"]해당 상품 정보가 없어요</b>");
	} 
%>

<br><br>
<%
	String pimage=bean.getPimage(); // Koala.jpg
	String imgpath=request.getContextPath()+"/img/"+pimage; 
%>
<div class="container">
<table class="table" border=0>
<tr class="m1">
	<td colspan=2 align=center>
	<font size=3>
	<b>[<%=bean.getPname()%>] 상품 정보</b>
	</font>
	</td>
</tr>
<tr>
	<td align=center>
	<a href="javascript:goBookmark('<%=pnum%>');"><img src="../../img/star.jpg" width=30 height=30 align=left></a>&nbsp;
	<br><br><br>
		<p class=imgPro><img src="<%=imgpath%>" width=250></p>
	</td>
	<td class=m3>
	
	<form name="f" method="POST">
	<br>
	<table class="table table-hover">
	<tr>
	<td>상품번호:  <%=pnum%></td>
	</tr>
	<td>
	상품이름:  <%=bean.getPname()%> </td>
	</tr>
	<tr>
	<td>
	상품가격: <font color=green><b>
				<%=df.format(bean.getPrice())%></b></font>원</td>  
	</tr>
	<tr>
	<td>
	상품포인트:  <font color=green><b>
			<%=bean.getPrice()/10%>
			</b></font> point</td>
	</tr>
	<tr>
	<td>
	재고수량: <%=bean.getPqty()%></td>
	</tr>
	<tr>
	<td>
	상품갯수:<input type=text name="oqty" size=2 value="1">개</td>
	</tr>
	
	<tr><td>
	<br>
				<a href="javascript:goCart('<%=pnum%>');"><p class="btn btn-sm btn-primary">장바구니 담기</p></a>
			<a href="javascript:goOrder('<%=pnum%>');"><p class="btn btn-sm btn-info">즉시 구매하기</p></a>
			<br><br>
			</td></tr>
			</table>
	</form>
	</td>
</tr>

<tr height=200 valign=top>
	<td colspan=2 align=left style="padding:20px;">
		<b>상품 상세 설명</b><br>
		<%=bean.getPcontents()%>
	</td>
</tr>	

<%@ include file="mall_bottom.jsp" %> 


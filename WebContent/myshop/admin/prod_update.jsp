<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*"%>
     
<td colspan=6 align=center>

<jsp:useBean id="product" class="my.shop.ProductBean" />
<%    
	String pnum=request.getParameter("pnum");
	
	ProductDao pdao = ProductDao.getInstance();
	product = pdao.selectByPnum(pnum);
	if(product==null){
%>
		<script type="text/javascript">
			alert("<%=pnum%>번에 해당하는 상품이 없어요");
			history.back();
		</script>
		<%
		return; 
	}//if--------------------
%>
<%@ include file="top.jsp" %>  
<td colspan=6 valign=top>
<CAPTION><h4><b>상품수정</b></h4></CAPTION>
<form name="f" action="prod_update_ok.jsp" method="POST" 
				enctype="multipart/form-data">
<table class="table table-hover">
	<tr>
		<th class=active>카테고리</th>
		<td align=left>
			<input type=text name="pcategory_fk" 
				value="<%=product.getPcategory_fk()%>" disabled >
			<input type=hidden name="pcategory_fk" 
				value="<%=product.getPcategory_fk()%>">	
		</td>
	</tr>
	<tr>
		<th class=active>상품번호</th>
		<td align=left><b><%=product.getPnum()%></b>
		<input type=hidden name="pnum" value="<%=product.getPnum()%>">
		</td>
	</tr>
	<tr>
		<th class=active>상품명</th>
		<td align=left>
		<input type=text name="pname" value="<%=product.getPname()%>">
		</td>
	</tr>
	<tr>
		<th class=active>제조회사</th>
		<td align=left>
		<input type=text name="pcompany" value="<%=product.getPcompany()%>">
		</td>
	</tr>
	<tr>
		<th class=active>상품이미지</th>
		<td align=left>
		
	<%
		String pimage=request.getContextPath()+"/myshop/images";
	%>
		<!-- 파일 업로드시 input type을 file로 지정 -->
		<img src="<%=pimage%>/<%=product.getPimage()%>" 
				width=100 height=100>
				
		<input type=file name="pimage"> 
		<!-- pimage : 새 이미지가 담길 장소 -->
		
		<input type=hidden name="pimage2" value="<%=product.getPimage()%>"> 
		<!-- pimage2:이전 이미지가 담길 장소 -->
		
		</td>
	</tr>
	<tr>
		<th class=active>상품 수량</th>
		<td align=left>
		<input type=text name="pqty" value="<%=product.getPqty()%>" maxlength=8>
		</td>
	</tr>
	<tr>
		<th class=active>상품 가격</th>
		<td align=left>
		<input type=text name="price" value="<%=product.getPrice()%>" maxlength=8>
		</td>
	</tr>
	<tr>
		<th class=active>상품 분류</th>
		<td align=left>
			<select name="pspec">
				<option value="과일/견과" <% if((product.getPspec()).equals("과일/견과")) {%> selected <% } %>>과일/견과</option>
				<option value="채소" <% if((product.getPspec()).equals("채소")) {%> selected <% } %>>채소</option>
				<option value="쌀/잡곡" <% if((product.getPspec()).equals("쌀/잡곡")) {%> selected <% } %>>쌀/잡곡</option>
				<option value="정육/계란류" <% if((product.getPspec()).equals("정육/계란류")) {%> selected <% } %>>정육/계란류</option>
				<option value="수산물/해산물/건어물" <% if((product.getPspec()).equals("수산물/해산물/건어물")) {%> selected <% } %>>수산물/해산물/건어물</option>
				<option value="생수/음료/커피/분유" <% if((product.getPspec()).equals("생수/음료/커피/분유")) {%> selected <% } %>>생수/음료/커피/분유</option>
			</select>
		</td>
	</tr>
	<tr>
		<th class=active>상품 소개</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50  style="resize: none;"><%=product.getPcontents()%></textarea>
		</td>
	</tr>
	<tr>
		<th class=active>상품 포인트</th>
		<td align=left>
			<input type=text name="point" value="<%=product.getPoint() %>"></td>
	</tr>
</table>
<button class="btn btn-sm btn-primary" type="submit">상품 등록</button>
		<a href="main.jsp"><p class="btn btn-sm btn-info">취소</p></a>
</form>
</td>
<%@ include file="bottom.jsp" %>  










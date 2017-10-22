<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="my.shop.CategoryDao"%>

<%
	request.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="category" class="my.shop.CategoryBean" />
<jsp:setProperty property="*" name="category"/>  

<%
	
	CategoryDao cdao = CategoryDao.getInstance();
	int n = cdao.insertCategory( category ) ;
	
	String msg="", url="";
	if(n>0){
		msg="카테고리 등록 성공";
		url="cate_list.jsp";
	}else{
		msg="카테고리 등록 실패";
		url="cate_input.jsp";
	}
%>
 <script type="text/javascript">
	alert("<%=msg%>"+"했습니다.");
	location.href="<%=url%>";
</script>





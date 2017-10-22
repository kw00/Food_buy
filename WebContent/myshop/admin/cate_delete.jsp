<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String cnum=request.getParameter("cnum");

	CategoryDao dao = CategoryDao.getInstance();
	int result=dao.categoryDelete(Integer.valueOf(cnum));
	
	String msg="", url="cate_list.jsp";
	
	if(result>0){
		msg="카테고리 삭제 성공!";
	}else{
		msg="카테고리 삭제 실패!";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

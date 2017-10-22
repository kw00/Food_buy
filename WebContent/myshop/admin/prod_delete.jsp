<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>    

<%
	String pnum = request.getParameter("pnum");
	String pimage = request.getParameter("pimage"); 
	
	String delPath = config.getServletContext().getRealPath("/myshop/images"); 
	
	
	File delFile=null;
	File dir = new File(delPath);
	if(pimage != null){ 
		delFile=new File(dir,pimage);
		
		if(delFile.exists()){ 
			if(delFile.delete())
				
	%>
			<script type="text/javascript">
				alert("이미지파일을 삭제하였습니다.");
			</script>
	
	<%
		} //if
	}//if 
	
	ProductDao pdao = ProductDao.getInstance();
	int result=pdao.deleteProduct(pnum); 
	
	String msg="",url="prod_list.jsp";
	if(result>0){
		msg="상품을 삭제하였습니다.";
	}else{
		msg="상품 삭제에 실패하였습니다.";
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>



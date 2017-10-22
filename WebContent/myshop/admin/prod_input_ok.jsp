<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  
 	request.setCharacterEncoding("UTF-8");

	MultipartRequest mr = null;
	
	String msg="", url=""; 
	String uploadDir=
			config.getServletContext().getRealPath("/img");  
	System.out.println("uploadDir:"+uploadDir); 
	// uploadDir:C:\JSP_ysy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Minimall\myshop\images
	
	try{
		mr = new MultipartRequest(request,uploadDir,10*1024*1024,
				"UTF-8", new DefaultFileRenamePolicy());
		
		int cnt = -1 ;
		ProductDao dao = ProductDao.getInstance();		
		cnt = dao.insertProduct( mr );
		
		if(cnt > 0){
			msg="상품 등록에 성공하였습니다.";
			url="prod_list.jsp";
		}else{
			msg="상품 등록에 실패하였습니다."; 
			url="prod_input.jsp";
		} 
		
	}catch(Exception e){
		msg="이미지 파일 업로드에 실패하였습니다.";
		url="prod_input.jsp";
		e.printStackTrace();
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>


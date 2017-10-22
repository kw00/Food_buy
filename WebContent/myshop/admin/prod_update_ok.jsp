<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.io.*,com.oreilly.servlet.*,
     com.oreilly.servlet.multipart.*"%>

<%      
	request.setCharacterEncoding("UTF-8"); 
	
	MultipartRequest mr=null;
	String uploadDir = 
				config.getServletContext().getRealPath("/myshop/images");
	int result=0;
	String msg=""; String url="";
	
	try{
		mr=new MultipartRequest(request,uploadDir,10*1024*1024,"UTF-8",
				new DefaultFileRenamePolicy());
		
		System.out.println("p_u_ok pnum : " + mr.getParameter("pnum")); // 2
		System.out.println("p_u_ok pimage : " + mr.getParameter("pimage")); // null
		System.out.println("p_u_ok FilesystemName pimage : " + mr.getFilesystemName("pimage")); // Koala1.jpg 
		System.out.println("p_u_ok pimage2 : " + mr.getParameter("pimage2"));//Desert1.jpg(이전 이미지)
		
		String pnum =  mr.getParameter("pnum");
		String pimage = mr.getFilesystemName("pimage"); // 새 이미지
		String pimage2 = mr.getParameter("pimage2"); // 기존 이미지
		ProductDao pdao = ProductDao.getInstance();
		result=pdao.updateProduct(mr); 	
		 
		
		File delFile=null;
		File dir = new File(uploadDir);
		if(pimage != null){ 
			delFile=new File(dir,pimage2);
			System.out.println("delFile="+delFile);		
			
			if(delFile.exists()){ //삭제할 이미지 파일이 실제 있는지 체크				
				
				if(delFile.delete()) 
		%>
					<script type="text/javascript">
						alert("이미지파일을 삭제하였습니다.");
					</script>
		
		<%
			} //if(exists)
		}//if(null)
		
		if(result>0){
			msg="수정하였습니다.";
			url="prod_list.jsp";
		}else{
			msg="수정에 실패하였습니다.";
			url="prod_list.jsp";
		}
	}catch(IOException e){
		msg="파일 업로드애 실패하였습니다.";
		url="prod_list.jsp";
		System.out.println("1:"+e);
		
	}catch(NumberFormatException e){ 
		msg="레시피 수량,가격,포인트는 숫자로 입력하세요";
		url="prod_list.jsp";
		System.out.println("2:"+e);
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>






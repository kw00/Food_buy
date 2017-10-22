<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import =  "board.BoardDao" %>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num")); 
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	BoardDao dbPro = BoardDao.getInstance();
	int check = dbPro.deleteArticle(num, passwd); 
	
	if(check==1){
	/*   response.sendRedirect("list.jsp?pageNum="+pageNum); */
	  	
	
	  int count = dbPro.getArticleCount(); // count:전체 글수 
	  
	  int pn = Integer.parseInt(pageNum); // pn:현재 페이지번호 "3"=>3
	  
	  int pageCount = count / 10 + ( count % 10 == 0 ? 0 : 1); 
	  // 2 + 0
		//pageCount:전체 페이지수
	 
	  if(pageCount < pn){	  
			response.sendRedirect("list.jsp?pageNum="+(pn-1)) ;
	  }else{
 			response.sendRedirect("list.jsp?pageNum="+pn) ;
	  } 
	  	
	}else{%>
       <script type="text/javascript">
         alert("비밀번호가 맞지 않습니다");
         history.go(-1); // 현재 페이지(deletePro.jsp)의 이전 페이지인 deleteForm.jsp로간다.
      </script>
<%
    }
%>


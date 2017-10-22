<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="board.BoardDao"%>
<%@ page import="java.sql.Timestamp"%>

<%-- <jsp:useBean id="dao"  class="bean.BoardDao" /> --%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="article" class="board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()) );
 	article.setIp(request.getRemoteAddr());
 
    BoardDao dbPro = BoardDao.getInstance(); 
    dbPro.insertArticle(article);
     
    response.sendRedirect("list.jsp");
%>











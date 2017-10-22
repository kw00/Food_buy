<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "board.BoardDao" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/myshop/display/mall_top.jsp" %>

<html> 
<head>
<title>게시판</title>
</head> 
 
<%
  	int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

    SimpleDateFormat sdf = 
         new SimpleDateFormat("yyyy-MM-dd HH:mm");
  
    try{
		BoardDao dbPro = BoardDao.getInstance();
        BoardDataBean article =  dbPro.getArticle(num);
   
 	    int ref=article.getRef();
 	    int re_step=article.getRe_step();
 	    int re_level=article.getRe_level();
    	System.out.println(num+","+ref+","+re_step+","+re_level);
%>
<body>  

<center><b>글내용 보기</b>
<br><br>
<form>

<div class="container">

<table class="table table-hover">
		
  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125">
	     <%=article.getNum()%></td>
    <td align="center" width="125">조회수</td>
    <td align="center" width="125">
	     <%=article.getReadcount()%></td>
  </tr>
  
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125">
	     <%=article.getWriter()%></td>
    <td align="center" width="125" >작성일</td>
    <td align="center" width="125">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  
  <tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="center" width="375" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125">글내용</td>
    <td align="left" width="375" colspan="3">
    	<pre><%=article.getContent()%></pre></td>
  </tr>
  
  <tr height="30">      
    <td colspan="4" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href=
       'updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   
	  
	  <input type="button" value="글삭제" 
       onclick="document.location.href=
       'deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      
      
      <input type="button" value="답글쓰기" 
       onclick="document.location.href=
       'replyForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      
       <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
   
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>
</center>
</body>
</html>      

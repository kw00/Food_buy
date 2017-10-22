
<%@ page import = "board.BoardDao" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/myshop/display/mall_top.jsp"%>
    
<%
    int pageSize = 10 ; /* 한 페이지에 10개의 글이 보이게 하겠다. */
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>  

<%
  	String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    } 

    int currentPage = Integer.parseInt(pageNum); // currentPage=1
    int startRow = (currentPage - 1) * pageSize + 1; // startRow=1 ,11
    int endRow = currentPage * pageSize; // endRow=10 , 20
    int count = 0;
    int number=0; 

    List<BoardDataBean> articleList = null;
    BoardDao dbPro = BoardDao.getInstance();
     
    count = dbPro.getArticleCount(); // 전체 레코드 수 리턴
    if (count > 0) { 
         articleList = dbPro.getArticles(startRow, endRow);
    }
  
 	number=count-(currentPage-1)*pageSize; // 25-(2-1)*10 = 27
 	// 1p -> number:25 , 2p->number:15 , 3p-> 5
 %>
<html>
<head>
<title>게시판</title>
</head>

<body>
<div class="container">
<table class="table">
<tr>
<td>
<script>
	var i = 0; // Start point
	var images = [];
	var time = 1000;

	// Image List
	images[0] = '../../img/image1.jpg';
	images[1] = '../../img/image2.jpg';
	images[2] = '../../img/image3.jpg';
	images[3] = '../../img/image4.jpg';

	// Change Image
	function changeImg(){
		document.slide.src = images[i];

		if(i < images.length - 1){
			i++;
		} else {
			i = 0;
		}

		setTimeout("changeImg()", time);
	}

	window.onload = changeImg;

</script>
<img name="slide" width="1370" height="600">
</td>
<br><br><br><br>
<td>
<img src="../../img/1.webp">
<img src="../../img/2.webp">
<img src="../../img/3.webp">
<img src="../../img/4.webp">
<img src="../../img/5.webp">
<img src="../../img/6.webp">
</td>
</tr>
</table>
<center><b>글목록(전체 글:<%=count%>)</b>

<%
    if (count == 0) {
%>
     		<table width="700" >
			<tr>
			    <td align="center">
			   		 게시판에 저장된 글이 없습니다.
			    </td>
			</tr>
		</table>
					<table width=100%>
					<tr>
						<td align="right"><a href="writeForm.jsp"><p
									class="btn btn-sm btn-primary">글쓰기</p></a><br>
						<br></td>
					</tr>
				</table>

<%  } else {    %>


				<table class="table table-hover">
    <tr height="30"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%  
        for (int i = 0 ; i < articleList.size() ; i++) {
          BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>
    <td  align="left" width="250" >
	<%
	      int wid=0; 
	      if(article.getRe_level()>0){
	        wid=20*(article.getRe_level()); // 답글:wid=20, 답글의답글:wid=40
	%>
		  <img src="images/level.gif" width="<%=wid%>" height="16">
		  <img src="images/re.gif">2
		  
		<%}else{%>
		  <img src="images/level.gif" width="<%=wid%>" height="16">
		<%}%>
           
      <a href=
      "content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
          <% if(article.getReadcount()>=10){%>
         	<img src="images/hot.gif" border="0"  height="16">
         <%}%> 
    </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getEmail()%>"><%=memid%></a>
    </td>
    <td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
    <td align="center" width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100"><%=article.getIp()%></td>
  </tr>
     <%}%> <!-- for문의 끝 -->
     <table width=100%>
					<tr>
						<td align="right"><a href="writeForm2.jsp"><p
									class="btn btn-sm btn-primary">글쓰기</p></a><br>
						<br></td>
					</tr>
				</table>
</table>
<%}%> <!-- else의 끝 -->

<%
	/* 페이지 처리 부분 */
    if (count > 0) {
        int pageCount = count/pageSize+(count % pageSize == 0 ? 0 : 1);
		// pageCount = 4
        
		int pageBlock=3; /* 화면 아래에 10개의 페이지가 보이게 하겠다. */
        //int startPage = (int)(currentPage/10)*10+1; 
        int startPage = ((currentPage-1)/pageBlock*pageBlock)+1; 
        int endPage = startPage + pageBlock-1;
		
        if (endPage > pageCount) endPage = pageCount;
        
        /* currentPage=3p
        startPage = 3/10*10+1= 1
        endPage = 1 + 10 - 1=10 */
        
        if (startPage > 3) {    %>
        	<a href="list.jsp?pageNum=<%= startPage - 3 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        	<a href="list.jsp?pageNum=<%= startPage + 3 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>
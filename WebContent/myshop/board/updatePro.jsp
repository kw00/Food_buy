<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="board.BoardDao"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="article"  class="board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");
	
	BoardDao dbPro = BoardDao.getInstance();
    int check = dbPro.updateArticle(article);
	
    if(check==1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
%>

<!-- 아랫줄도 된다. -->
<%-- <jsp:forward page="list.jsp"> 
        <jsp:param name="pageNum" value="<%=pageNum%>"/>
    </jsp:forward>   --%>


<% }else{%>
	<script type="text/javascript">
        alert("비밀번호가 맞지 않습니다");
        history.go(-1); // 현재 페이지(updatePro.jsp)의 바로 이전 updateForm.jsp로 간다. 
	</script>
<%
    } 
 %>


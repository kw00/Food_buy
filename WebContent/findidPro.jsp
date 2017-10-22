<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.member.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	request.setCharacterEncoding("UTF-8") ;
	String name = request.getParameter( "name" ) ;
	String ssn = request.getParameter( "ssn" ) ;
		
%>
<jsp:useBean id="member" class="my.member.MemberDTO"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDAO dao = MemberDAO.getInstance(); 
	member = dao.getMemberBySsn(name, ssn) ;
	
	String msg="", url="";
	if(member != null ){
		msg = member.getId();
	}else{
		msg = "없는 회원";
	}
	url=request.getContextPath()+"/main.jsp";
%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
 </script>
</body>
</html>


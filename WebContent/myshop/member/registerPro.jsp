<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.member.MemberDAO"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8") ;  
%>

<jsp:useBean id="member" class="my.member.MemberDTO"/>
<jsp:setProperty name="member" property="*"/>
<%
	int cnt = -1 ;
	MemberDAO dao = MemberDAO.getInstance(); 
	cnt = dao.insertData( member ) ;
	
	String msg="", url="";
	if(cnt == 1){
		msg="가입 성공";
	}else{
		msg="가입 실패";
	}
	url=request.getContextPath()+"/main.jsp";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=msg%>"+"했습니다.");
	location.href="<%=url%>";
</script>
</body>
</html>

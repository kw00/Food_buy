<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.member.MemberDAO"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8") ;
	String id = request.getParameter("id") ;
	String password = request.getParameter("password") ; 
	String contextPath = request.getContextPath() ;
	//out.print(contextPath) ; /MiniMall 
	
	 
	MemberDAO dao =  MemberDAO.getInstance(); 
	MemberDTO member = dao.getMemberInfo(id, password) ;
	String viewPage = null ;
	if(member != null){
		
		int no = member.getNo() ;
		String _id = member.getId() ;
		
		if( _id.equals("admin")){			
			viewPage = contextPath + "/myshop/admin/main.jsp" ; 
			// 또는 viewPage = "myshop/admin/main.jsp" ; 가능
			
		}else{
			viewPage = contextPath + "/myshop/display/main.jsp" ;
		}	
		session.setAttribute("memno", no) ; // memno는 결재하기할 때 사용함
		session.setAttribute("memid", _id) ;
		
	}else{
		viewPage = contextPath + "/main.jsp" ;
%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
		</script>
<%		
	}
%>
	<script type="text/javascript">
		location.href="<%=viewPage%>";
	</script>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="my.member.MemberDAO"%>
<%-- <jsp:useBean id="dao" class="my.member.MemberDAO"></jsp:useBean> --%>
<%

	String userid = request.getParameter("userid"); // hong
	System.out.println("userid:"+userid);
	String str = "";
	 
	try {
		MemberDAO dao = MemberDAO.getInstance(); 
		boolean isCheck = dao.searchID(userid); 
		System.out.println("isCheck:" + isCheck);
		
		if (isCheck) {
			str = "NO";
			out.print(str);
 											  
		} else {
			str = "YES";
			out.print(str);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

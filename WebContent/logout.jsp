<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.invalidate() ; // 세션 무효화
	String viewpage = "main.jsp" ;
	response.sendRedirect( viewpage ); // 이 줄 대신 아래의 script 코드 써도 된다. 둘 중 하나만 넣으면 된다.
%>

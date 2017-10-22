<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/myshop/display/mall_top.jsp"%>
<%
	int num = 0, ref = 1, re_step = 0, re_level = 0;
	//답글 쓰기 링크를 클릭했다.
	num = Integer.parseInt(request.getParameter("num"));
	ref = Integer.parseInt(request.getParameter("ref"));
	re_step = Integer.parseInt(request.getParameter("re_step"));
	re_level = Integer.parseInt(request.getParameter("re_level"));
%>


<html>
<head>  
<title>게시판</title>
<style>
body {
	align: center;
	text-align: center;
}
</style>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	<!-- <center> -->
	<div class="container">
		<h5>
		<b>글쓰기</b>
		<br><br>
	</h5>
		<form method="post" name="writeform" action="replyPro.jsp" 
			onsubmit="return writeSave()">
			
			<input type="hidden" name="num" value="<%=num%>"> 
			<input type="hidden" name="ref" value="<%=ref%>"> 
			<input type="hidden" name="re_step" value="<%=re_step%>"> 
			<input type="hidden" name="re_level" value="<%=re_level%>"> 	


				<table class="table table-hover" align=center>
				<tr>
					<td align="right" colspan="2"><a
						href="list.jsp"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70" align="center">이 름</td>
					<td width="330" align="left">
					<input type="text" size="30" maxlength="10"	name="writer" ></td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330" align="left">
						<input type="text" size="50" maxlength="50" 
						name="subject"	value="[답변]">
					</td>
				</tr>
				<tr>
					<td width="70" align="center">Email</td>
					<td width="330" align="left">
					<input type="text" size="50" maxlength="30"	name="email" ></td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330" align="left">
						<textarea name="content" rows="13" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd" >
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input	type="submit" value="답글 쓰기"> 
						<input type="reset"	value="다시 작성"> 
						<input type="button" value="목록 보기"	
						OnClick="window.location='list.jsp'">
					</td>
				</tr>
			</table>			
		</form>
	</center>		
</body>
</html>

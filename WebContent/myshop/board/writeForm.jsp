<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/myshop/display/mall_top.jsp"%>
<html>
<head>
<title>게시판</title>


<style type="text/css">
body{
	align:center;
	text-align: center;
}
</style>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<div class="container">
		<b>글쓰기</b> <br>
		
		<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()"> 
			  <table class="table table-hover">
				<tr>
					<td align="right" colspan="2">
						<a href="list.jsp"> 글목록</a>
					</td>
				</tr>
				<tr>
					<td width="100" align="center">이 름</td>
					<td width="330" align="left">
					<input type="text" size="30" maxlength="10"	name="writer" 
							value=<%=memid%> readonly></td>
				</tr>
				
				<tr>
					<td width="100" align="center">제 목</td>
					<td width="330" align="left">					
						<input type="text" size="50" maxlength="50" name="subject" 
								value="가입인사입니다.">
					</td>
				</tr>
				
				<tr>
					<td width="100" align="center">Email</td>
					<td width="330" align="left">
					<input type="text" size="50" maxlength="30"	name="email" 
							value="aa@xx.com"></td>
				</tr>
				
				<tr>
					<td width="100" align="center">내 용</td>
					<td width="330" align="left">
						<textarea name="content" id="abc" rows="13" cols="50">반갑습니다.</textarea>
					</td>
				</tr>
				<tr>
					<td width="100" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd"  
								value="1234">
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center" height="30">
						<input	type="submit" value="글쓰기">  
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기"	
								OnClick="window.location='list.jsp'">
								<!-- OnClick="location.href='list.jsp'" 도 가능-->
					</td>
				</tr>
			</table>	
		</form>
</body>
</html>



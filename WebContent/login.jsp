<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	insert.jsp
	
	<form method="post" action="login.member.do">
		아이디 <input type="text" name="id"> <br>
		비번임 <input type="password" name="pwd">
		<button type="submit">로그인</button>		
	</form>
	<a href="join.jsp"> 회원가입 </a>
	<%-- 수경 수정 --%>

	
	<%@include file="footer.jsp" %>
</body>
</html>
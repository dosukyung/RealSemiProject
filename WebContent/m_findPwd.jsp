<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>
	<form method="post" action="findPwd.member.do">
	
			이름 : <input type="text" name="name"> <br>
			id : <input type="text" name="id"> <br>
			이메일 : <input type="text" name="email"> <br>
			<button type="submit">비밀번호 찾기</button>
	</form>
<%@include file="footer.jsp"%>
</body>
</html>
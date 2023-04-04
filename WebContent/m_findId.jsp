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
	<form method="post" action="findId.member.do">
		이름 : <input type="text" name="name"> <br>
		전화번호 : <input type="text" name="phone"> <br>
		<button type="submit">아이디 찾기</button>
	</form>
<%@include file="footer.jsp"%>
</body>
</html>
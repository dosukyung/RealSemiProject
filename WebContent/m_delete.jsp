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
	
	정말 삭제하시려면 비밀번호를 입력해주세요.
	<form method="post" action="delete.ok.do">
		<input type="hidden" name="no" value="${Dto.getMember_num()}">
		비밀번호 <input type="text" name="pwd">
		<input type="submit" value="확인">
	</form>
	<%@include file="footer.jsp" %>
</body>
</html>
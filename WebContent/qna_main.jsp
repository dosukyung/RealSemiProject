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
	<div align = "center">
		<hr width = "50%" color = "blue">
		<h3>Q&A 고객센터</h3>
		<hr width = "50%" color = "blue">
		<br>
		<a href = "<%=request.getContextPath() %>/qna_list.so?id=<%=(String)session.getAttribute("UserId")%>">[전체 Q&A 게시물 목록]</a>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
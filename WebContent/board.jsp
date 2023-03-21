<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String location = request.getParameter("location"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@include file="header.jsp" %>
	
	
	<%=location %> 게시판 이겟죠?
	
	
	<%@include file="footer.jsp" %>

</body>
</html>
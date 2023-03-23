<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="main.jsp"> 메인페이지</a>
	<% 
		if(session.getAttribute("UserId") == null){
	%>
		<a href="m_myinformation.jsp">내 정보</a>
	<% 
		}else{
	%>
			<a href="content.member.do?id=<%=(String)session.getAttribute("UserId")%>">내 정보</a>
			
	<%	
		}
	%>
		
	<a href="qna_main.jsp">QnA</a>
	
	<%
		if(session.getAttribute("UserId") == null){
	%>
			<a href="m_login.jsp">로그인</a>
	
	<% 
		}else{
			String userId = (String)session.getAttribute("UserId");
			out.println(userId + "님 반갑습니다." );
			out.println("<a href='m_logout.jsp'>로그아웃</a>");
		}
		
	%> 
	
	
	
	<hr>
</body>
</html>
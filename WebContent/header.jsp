<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="s.css/head.css">
</head>
<body>
	<header id="head">
	<a href="main.jsp" class="mainpage"><img src ="s.image/house.png"></a>
	 <div  class="head_logo">
	 	<img src="s.image/r_logo_s.png">
	 </div>
	<% 
		if(session.getAttribute("UserId") == null){
	%>
	<a href="m_myinformation.jsp" class="qna">내 정보 </a>
	<% 
		}else{
	%>
	<a href="content.member.do?id=<%=(String)session.getAttribute("UserId")%>" class="qna">내정보</a>

	<%	
		}
	%>

	<a href="qna_main.jsp" class="qna">QnA</a>

	<%
		if(session.getAttribute("UserId") == null){
	%>
	<a href="m_login.jsp" class="qna">로그인</a>

	<% 
		}else{
			%>
			<div class="qna">
			<% 	
			String userId = (String)session.getAttribute("UserId");
			out.println("<a href='m_logout.jsp'>로그아웃</a>");
			%>
			</div>
		<%

		}
		
	%>

	</header>
</body>
</html>
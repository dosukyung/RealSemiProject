<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/6d4b3bed20.js" crossorigin="anonymous"></script>


</head>
<body>
	<%@include file="header.jsp"%>
	
	<div align = "center">
	
		<form method="post" action="login.member.do">
		
			아이디 <i class="fa-regular fa-address-card"></i> : <input type="text" name="id"> <br> 
			비번: <i class="fa-sharp fa-light fa-lock-keyhole"></i> : <input type="password" name="pwd">
			<button type="submit">로그인</button>
		</form>
		
		<a href="m_join.jsp"> 회원가입 </a>
		<a href="m_findId.jsp">아이디 찾기</a>
		<a href="m_findPwd.jsp">비밀번호 찾기</a>
		
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
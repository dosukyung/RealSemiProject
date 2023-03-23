<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/header.jsp" %>
		
		
	<%
		if(session.getAttribute("UserId") == null){
	%>
		<%-- 로그인 상태가 아니라면 --%>
			<h1>로그인 먼저 진행해주세요 ^^</h1>
	
	<% 
		}else{
			String UserId = request.getParameter("id");
	%> 	
		<%-- 로그인 중이면 내정보 보여주기. --%>
		<table border="1" cellspacing="0">
			<tr>
				<th> 회원 아이디 </th>
				<td> ${Dto.getMember_id()} </td>
			</tr>
			<tr>
				<th> 회원 비밀번호 </th>
				<td> ${Dto.getMember_pwd()} </td>
			</tr>
			<tr>
				<th> 회원 닉네임</th>
				<td> ${Dto.getMember_nick()} </td>
			</tr>
			<tr>
				<th> 회원 나이</th>
				<td> ${Dto.getMember_age()} </td>
			</tr>
			<tr>
				<th> 회원 주소</th>
				<td> ${Dto.getMember_addr1()} ${Dto.getMember_addr2()} ${Dto.getMember_addr3()} </td>
			</tr>
		</table>
		
	<%} %>
	 <button onclick="location.href='modify.member.do?no=${Dto.getMember_num()}'">회원정보수정</button>
	 <button onclick="location.href='delete.do?no=${Dto.getMember_num()}'">회원정보삭제</button>

	<%@include file="/footer.jsp" %>
	
</body>
</html>
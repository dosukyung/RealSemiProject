<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			<tr>
				<th> 첫번째 반려동물 </th>
				<c:if test="${Animal1 ne '애완동물 미등록'}">
					<td> <a href="AnimalContent.no?no=${Animal1no}">${Animal1}</a></td>
				</c:if>
				<c:if test="${Animal1 eq '애완동물 미등록'}">
					<td> ${Animal1}</td>
				</c:if>
			</tr>
			<tr>
				<th> 두번째 반려동물 </th>
				<c:if test="${Animal2 ne '애완동물 미등록'}">
					<td> <a href="AnimalContent.no?no=${Animal2no}">${Animal2}</a></td>
				</c:if>
				<c:if test="${Animal2 eq '애완동물 미등록'}">
					<td> ${Animal2}</td>
				</c:if>
			</tr>
			<tr>
				<th> 세번째 반려동물 </th>
				<c:if test="${Animal3 ne '애완동물 미등록'}">
					<td> <a href="AnimalContent.no?no=${Animal3no}">${Animal3}</a></td>
				</c:if>
				<c:if test="${Animal3 eq '애완동물 미등록'}">
					<td> ${Animal3}</td>
				</c:if>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<a href ="fri_list.to?id=<%=(String)session.getAttribute("UserId")%>">
						<button>친구 목록</button>
					</a>
					
				<a href ="fri_acc.to?id=<%=(String)session.getAttribute("UserId")%>">
						<button>친구 수락 요청 </button>						
					</a>
				</td>
			</tr>
		</table>
		<br>
		
		
		
	<%} %>
	<div align="center">
		 <button onclick="location.href='modify.member.do?no=${Dto.getMember_num()}'">회원정보수정</button>
		 <button onclick="location.href='delete.do?no=${Dto.getMember_num()}'">회원정보삭제</button>
		 <button onclick="location.href='AniamlInsert.no?no=${Dto.getMember_num()}'">동물 등록하기</button>
	 </div>
	<%@include file="/footer.jsp" %>
	
</body>
</html>
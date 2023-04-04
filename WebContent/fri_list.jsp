
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<div align="center">
	<hr width ="50%" color ="red">
	<h3>친구 게시판입니다</h3>
	<hr width ="50%" color ="red">
	
	<form method ="post">
		<table border="1" cellspacing ="0">
			<tr>
				<th>친구 아이디</th>
				<th>친구 닉네임</th>
				<th>성별</th>
				<th>친구끊기</th>
			</tr>
			
			<c:set var ="list" value ="${List }" />
			<c:if test="${!empty list}">
  				<c:forEach items="${list}" var="dto">
    					<tr>			
							<td>${dto.getMember_id()}</td>
							<td>${dto.getMember_nick()}</td>
							<td>${dto.getMember_gender()}</td>
							<td>
								<a href="<%=request.getContextPath()%>/fri_delete.to?no=${dto.getMember_num()}">
									친구삭제
								</a>
							</td>
						</tr>
					
					</c:forEach>
			 
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6" align="center">
					<h3>전체회원 리스트가 없습니다</h3>
			</c:if>		
		</table>

	</form>

</div>

</body>
</html>
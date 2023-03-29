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
	<%@include file="header.jsp" %>
	<table border="1" cellspacing="0">
		<tr>
			<th> 애완동물 이름 </th>
			<td> ${dto.getAnimal_name()}</td>
		</tr>
		<tr>
			<th> 애완동물 나이 </th>
			<td> ${dto.getAnimal_age()}</td>
		</tr>
		<tr>
			<th> 애완동물 품종 </th>
			<td> ${dto.getAnimal_race()}</td>
		</tr>
		<tr>
			<th> 애완동물 성별 </th>
			<c:if test="${dto.getAnimal_gender() eq '1'}">
				<td>수컷</td>
			</c:if>
			<c:if test="${dto.getAnimal_gender() eq '2'}">
				<td>암컷</td>
			</c:if>
		</tr>
		<tr>
			<th> 애완동물 종류 </th>
			<c:if test="${dto.getAnimal_type() eq '1'}">
				<td>강아지</td>
			</c:if>
			<c:if test="${dto.getAnimal_type() eq '2'}">
				<td>고양이</td>
			</c:if>
		</tr>
		<tr>
			<td> 사진 </td>
			<td> <img src="animal/${dto.getAnimal_image()}">	</td>
		</tr>
	</table>
	<button onclick="location.href='DeleteAnimal.no?no=${dto.getAnimal_num()}'">애완동물삭제</button>
	
	<%@include file="footer.jsp" %>
</body>
</html>
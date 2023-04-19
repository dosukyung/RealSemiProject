<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="s.css/a_cont.css">

</head>
<body>
	<%@include file="header.jsp" %>
	
	<!--  태우 수정 내역  -->
<div id="container">
	<div class="card">
		<h3>민증</h3>
		<table id="table">
			<tr>
				<th> 이름 </th>
				<td> ${dto.getAnimal_name()}</td>
			</tr>
			<tr>
				<th> 나이 </th>
				<td> ${dto.getAnimal_age()}</td>
			</tr>
			<tr>
				<th> 품종 </th>
				<td> ${dto.getAnimal_race()}</td>
			</tr>
			<tr>
				<th> 성별 </th>
				<c:if test="${dto.getAnimal_gender() eq '1'}">
					<td>수컷</td>
				</c:if>
				<c:if test="${dto.getAnimal_gender() eq '2'}">
					<td>암컷</td>
				</c:if>
			</tr>	
			<tr>
				<th> 종류 </th>
				<c:if test="${dto.getAnimal_type() eq '1'}">
					<td>강아지</td>
				</c:if>
				<c:if test="${dto.getAnimal_type() eq '2'}">
					<td>고양이</td>
				</c:if>
			</tr>
		</table>
			<div class="img">
				<img src="animal/${dto.getAnimal_image()}">
			</div>
	</div>
	<button onclick="location.href='DeleteAnimal.no?no=${dto.getAnimal_num()}'">삭 제</button>
</div>	
	<%@include file="footer.jsp" %>	
</body>
</html>
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
			<th> 첫번째 반려동물 </th>
			<td>${Animal1.getAnimal_name()}</td>
		</tr>
		<tr>
			<th> 두번째 반려동물 </th>
			<td>${Animal2.getAnimal_name()}</td>
		</tr>
		<tr>
			<th> 세번째 반려동물 </th>
			<td>${Animal3.getAnimal_name()}</td>
		</tr>
	</table>
	<br>
	
	<%-- 애완동물 더이상 등록 불가한 경우 --%>
	<c:if test="${Animal1 != null and Animal2 != null and Animal3 != null}">
		<h3>  애완동물을 더이상 등록하실 수 없습니다.</h3>
	</c:if>
	
	<c:if test="${(Animal1 == null and Animal2 == null and Animal3 == null) or (Animal1 != null and Animal2 == null and Animal3 == null) or (Animal1 != null and Animal2 != null and Animal3 == null)}">
		<form method="post" action="AniamlInsertOk.no" enctype="multipart/form-data">
		
		
			<table border="1" cellspacing="0">
				<tr>
					<th> 애완동물 이름 </th>
					<td> <input name="name">  </td>
				</tr>
				<tr>
					<th> 애완동물 나이</th>
					<td> <input name="age">  </td>
				</tr>
				<tr>
					<th> 애완동물 성별 </th>
					<td> 
						수컷 <input type="radio" value="1" name="gender">
						암컷 <input type="radio" value="2" name="gender">				
					</td>
				</tr>
				<tr>
					<th> 애완동물 종류</th>
					<td> 
						강아지 <input type="radio" value="1" name="type">
						고양이 <input type="radio" value="2" name="type">	  
					</td>
				</tr>
				<tr>
					<th> 애완동물 종</th>
					<td> <input name="race">  </td>
				</tr>
				<tr>
				    <th>사진</th>
				    <td>
				        <input type="file" name="image" onchange="previewImage(event)">
				        <br>
				        <img id="preview" src="#" alt="프로필 사진 미리보기" style="max-width:200px; max-height:200px;">
				    </td>
				</tr>
			</table>
			
			<c:if test="${Animal1 == null and Animal2 == null and Animal3 == null}">
				<h3>  아직 등록된 애완동물이 없습니다. 첫번째 애완동물을 등록해보세요^^</h3>
				<input type="hidden" name="have" value ="1">
			</c:if>
			
			<c:if test="${Animal1 != null and Animal2 == null and Animal3 == null}">
				<h3>  애완동물을 2마리 더 등록하실 수 있습니다.</h3>
				<input type="hidden" name="have" value ="2">
			</c:if>
			
			<c:if test="${Animal1 != null and Animal2 != null and Animal3 == null}">
				<h3>  애완동물을 1마리 더 등록하실 수 있습니다.</h3>
				<input type="hidden" name="have" value ="3">
			</c:if>
			
			<input type="submit" value="등록하기">
		</form>
	</c:if>
	
	
	
	
	<%@include file="footer.jsp" %>
<script>
	function previewImage(event) {
	    var reader = new FileReader();
	    reader.onload = function(){
	        var img = document.getElementById("preview");
	        img.src = reader.result;
	        // 이미지 크기를 조정합니다.
	        img.style.width = "200px"; // 원하는 가로 크기를 설정합니다.
	        img.style.height = "200px"; // 원하는 세로 크기를 설정합니다.
	    }
	    reader.readAsDataURL(event.target.files[0]);
	}
</script>
</body>
</html>
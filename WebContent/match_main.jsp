<%@page import="com.animal.model.AnimalDAO"%>
<%@page import="com.animal.model.AnimalDTO"%>
<%@page import="com.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	String location = request.getParameter("location");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="s.css/match.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<div align ="center" class="container">
	<h3><%=location%> 지역 매칭 게시판</h3> <br>
	${animal10.getAnimal_image()}
	
	<!-- 	<tr>
			<th width="150">애완동물 사진</th>
			<th>회원정보</th>
		</tr> -->
		<div class="match">
			<table class="match_table" >
				
					<th align="center"> 
						<img src="animal/${animal0.getAnimal_image()}" >
					</th>
				<tr>
					<td>
					
						회원 이름 :
						<br>
						 ${List.get(0).getMember_name()} 
						<br>
						회원 나이 :
						<br>
						 ${List.get(0).getMember_age()}
						<br>
						${List.get(0).getMember_name()}  님의 첫째 :
						 <br>
						 ${List.get(0).getMember_animal1() } 
						<br>
						회원 주소 : 
						<br>
						${List.get(0).getMember_addr1() } ${List.get(0).getMember_addr2() }
						<br>
						<br>
						<button onclick="location.href='<%=request.getContextPath()%>/fri_ok_add.to?no=${List.get(0).getMember_num()}'">친구신청</button>
					</td>
				</tr>
			</table>
		</div>
	
		<div class="match">
			<table class="match_table">
			<!-- 	<tr>
					<th width="150">애완동물 사진</th>
					<th>회원정보</th>
				</tr> -->
					<th align="center"> 
						<img src="animal/${animal1.getAnimal_image()}" >
					</th>
				<tr>
					<td>
						회원 이름 :
						<br>
						 ${List.get(1).getMember_name()} 
						<br>
						회원 나이 :
						<br>
						 ${List.get(1).getMember_age()} 
						 <br>
						${List.get(1).getMember_name()}  님의 첫째 : 
						<br>
						${List.get(1).getMember_animal1() } 
						<br>
						회원 주소 :
						<br>
						 ${List.get(1).getMember_addr1() } ${List.get(1).getMember_addr2() }<br>
						<br>
						<button onclick="location.href='<%=request.getContextPath()%>/fri_ok_add.to?no=${List.get(1).getMember_num()}'">친구신청</button>
					</td>
				</tr>
			</table>
		</div>
	
		<div class="match">		
			<table  class="match_table">
				<!-- <tr>
					<th width="150">애완동물 사진</th>
					<th>회원정보</th>
				</tr> -->
					<th align="center">
						<img src="animal/${animal2.getAnimal_image()}" >
					</th>
				<tr>
					<td>
						회원 이름 :
						<br>
						 ${List.get(2).getMember_name()} <br>
						회원 나이 :
						<br>
						 ${List.get(2).getMember_age()} <br>
						${List.get(2).getMember_name()} 님의 첫째: 
						<br>
						${List.get(2).getMember_animal1() } <br>
						회원 주소 :
						<br>
						 ${List.get(2).getMember_addr1() } ${List.get(2).getMember_addr2() }<br><br>
						<br>
						<button onclick="location.href='<%=request.getContextPath()%>/fri_ok_add.to?no=${List.get(2).getMember_num()}'">친구신청</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>

</body>
</html>
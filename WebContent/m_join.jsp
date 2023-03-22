<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<form method="post" action="insert.member.do">
		<table border="1" cellspacing="0">
			<tr>
				<th> 회원 아이디 </th>
				<td> <input type="text" name="id"></td>
			</tr>
			<tr>
				<th> 회원 이름 </th>
				<td> <input type="text" name="name"></td>
			</tr>
			
			<tr>
				<th> 회원 비밀번호 </th>
				<td> <input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th> 비밀번호 확인 </th> <%-- 자바스크립트로 구현 예정 --%>
				<td> <input type="password"></td>
			</tr>
			<tr>
				<th> 회원 나이 </th>
				<td> <input type="text" name="age"></td>
			</tr>
			<tr>
				<th> 연락처 </th>
				<td> <input type="text" name="phone"></td>
			</tr>
			
			
			<tr>
				<th> 주소 </th>
				<td> 
					<input type="text" name="addr1"> <button onclick="#">주소찾기</button>
					<br>
					<input type="text" name="addr2"> <input type="text" name="addr3">
				</td>
				
			</tr>
			<tr>
				<th> 회원 이메일 </th>
				<td> <input type="text" name ="email"></td>
			</tr>
			<tr>
				<th> 회원 닉네임 </th>
				<td> <input type="text" name ="nick"></td>
			</tr>
			<tr>
				<th> 자기소개 </th>
				<td> <input type="text" name ="self"></td>
			</tr>
			<tr>
				<th> 회원 성별 </th>
				<td> 
					<input type="radio" value="man" name="gender"> 남자
					<input type="radio" value="woman" name="gender"> 여자
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit"> 회원등록</button>
				</td>
			</tr>
		</table>
	</form>	
		
	
		
	<%@include file="footer.jsp" %>
</body>
</html>
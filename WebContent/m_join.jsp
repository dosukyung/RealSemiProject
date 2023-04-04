<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function idcheck(){
	var id = f.id.value;
	location.href="idcheck.member.do?checkId="+id;
}

function check(){
	
	if(f.id.value ==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		
		return false;
	}   //f는 폼 이름
	
	if(f.name.value ==""){
		alert("이름를 입력하세요");
		f.name.focus();
		return false;
	}   //f는 폼 이름
	
	if(f.pwd.value ==""){
		alert("비밀번호를 입력하세요");
		f.pwd.focus();
		return false;
	}   //f는 폼 이름
	
	if(isNaN(f.age.value)){
		alert("나이는 숫자만 입력이 가능합니다");
		f.age.focus();
		return false;
	}   //f는 폼 이름
	
	if(f.age.value ==""){
		alert("나이를 입력하세요");
		f.age.focus();
		return false;
	}   //f는 폼 이름
	
	if(f.phone.value ==""){
		alert("연락처를 입력하세요");
		f.phone.focus();
		return false;
	}   //f는 폼 이름

	if(f.addr3.value ==""){
		alert("주소를 입력하세요");
		f.addr3.focus();
		return false;
	}   //f는 폼 이름
	
	if(f.email.value ==""){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}   //f는 폼 이름
	if(f.nick.value ==""){
		alert("닉네임을 입력하세요");
		f.nick.focus();
		return false;
	}   //f는 폼 이름
	
	if(f.gender.value ==""){
		alert("성별을 확인하세요");
		f.gender.focus();
		return false;
	}   //f는 폼 이름
}

</script>
</head>
<body>
	<%@include file="header.jsp"%>

	Join.jsp
	<form method="post" action="insert.member.do" name="f"
		onsubmit="return check()">

		<table border="1" cellspacing="0">
			<tr>
				<th>회원 아이디</th>
				<td><input type="text" name="id" maxlength="30"> <input
					type="button" value="중복확인" onclick="idcheck()"></td>
			</tr>
			<tr>
				<th>회원 이름</th>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<th>회원 비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<%-- 자바스크립트로 구현 예정 --%>
				<td><input type="password"></td>
			</tr>
			<tr>
				<th>회원 나이</th>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone"></td>
			</tr>


			<tr>
				<th>주소</th>
				<td><input type="text" name="addr1" value="서울시" readonly>
					<br> <select name="addr2">
						<option value="구">:::구 선택:::</option>
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
				</select> <input type="text" name="addr3" placeholder="상세 주소"></td>

			</tr>
			<tr>
				<th>회원 이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>회원 닉네임</th>
				<td><input type="text" name="nick"></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><input type="text" name="self"></td>
			</tr>
			<tr>
				<th>회원 성별</th>
				<td><input type="radio" value="man" name="gender" default>
					남자 <input type="radio" value="woman" name="gender"> 여자</td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="submit">회원등록</button>
				</td>
			</tr>
		</table>
	</form>



	<%@include file="footer.jsp"%>
</body>
</html>
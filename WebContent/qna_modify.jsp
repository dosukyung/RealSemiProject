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
	<div align = "center">
		<c:set var = "dto" value = "${Modify}" />
		<hr width = "50%" color = "gray">
		<h3>${Nick}님 게시물 수정 폼 페이지</h3>
		<hr width = "50%" color = "gray">
		<br>
		<form method = "post" enctype="multipart/form-data" action = "<%=request.getContextPath() %>/qna_modify_ok.so">
			<input type = "hidden" name = "num" value = "${dto.getQna_num()}">
			<input type = "hidden" name = "qna_writer" value = "${dto.getQna_writer()}">
			<table border = "1" cellspacing = "0" width = "1000">
				<tr>
					<th>말머리</th>
					<td>
						<select name = "qna_field">
							<option value = "propose">건의</option>
							<option value = "account">계정</option>
							<option value = "report">신고</option>
							<option value = "else">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type = "text" value = "${Nick}" name = "qna_nick" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type = "text" name = "qna_title" value = "${dto.getQna_title()}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows = "7" cols = "25" name = "qna_content">${dto.getQna_content()}</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type = "file" name = "qna_file"></td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td><input type = "password" name = "qna_pwd"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
					<input type = "submit" value = "글수정">&nbsp;&nbsp;
					<input type = "reset" value = "다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
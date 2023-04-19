<%@page import="com.member.model.MemberDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("UserId");
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO mdto = mdao.contentById(userId);
	String nick = mdto.getMember_nick();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align = "center">
		<hr width = "50%" color = "gray">
		<h3>Qna 테이블 자료실 게시판 글쓰기 폼 페이지</h3>
		<hr width = "50%" color = "gray">
		<br>
		<form method = "post" enctype = "multipart/form-data" action = "<%=request.getContextPath() %>/qna_write_ok.so">
			<table border = "1" cellspacing = "0" width = "400">
				<tr>
					<th>말머리</th>
					<td>
						<select name = "field">
							<option value = "propose">건의</option>
							<option value = "account">계정</option>
							<option value = "report">신고</option>
							<option value = "else">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type = "text" value = "<%=nick %>" name = "nick" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name = "qna_title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows = "7" cols = "25" name = "qna_cont"></textarea>
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
					<input type = "submit" value = "글쓰기">&nbsp;&nbsp;
					<input type = "reset" value = "다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
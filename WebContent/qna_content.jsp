<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div align = "center">
		<c:set var = "dto" value = "${Content}" />
		<hr width = "50%" color = "tomato">
		<h3>${Nick}님 게시글 상세 내역 페이지</h3>
		<hr width = "50%" color = "tomato">
		<br>
		<table border = "1" cellspacing = "0" width = "400">
			<tr>
				<th>글 No.</th>
				<td>${dto.getQna_num()}</td>
			</tr>
			<tr>
				<th>말머리</th>
				<td>${dto.getQna_head()}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${Nick}</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td>${dto.getQna_title()}</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td>${dto.getQna_content()}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:if test="${!empty dto.getQna_file()}">
					<td><a href = "<%=request.getContextPath()%>/qnaFileUpload/${dto.getQna_file()}" target = "_blank">${dto.getQna_file()}</a></td>
				</c:if>
				<c:if test="${empty dto.getQna_file()}">
				<td></td>
				</c:if>
			</tr>
			<tr>
				<th>글 조회수</th>
				<td>${dto.getQna_hit()}</td>
			</tr>
			<tr>
				<th>글 작성일자</th>
				<td>${dto.getQna_regdate()}</td>
			</tr>
			<tr>
				<th>글 수정일자</th>
				<c:if test="${empty dto.getQna_update()}">
					<td>${dto.getQna_update()}</td>
				</c:if>
			</tr>
			<tr>
				<th>글 비밀번호</th>
				<td>
					<c:if test="${!empty dto.getQna_pwd()}">
						<c:forEach begin="1" end="${dto.getQna_pwd().length()}">
							*
						</c:forEach>
					</c:if>
				</td>
			</tr>
			<%-- 데이터가 없는 경우 --%>
			<c:if test="${empty dto}">
				<tr>
					<td colspan = "2" align = "center">
						<h3>조회된 게시물이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br>
		<input type = "button" value = "글수정" onclick = "location.href='qna_modify.so?no=${dto.getQna_num()}'">&nbsp;
		<input type = "button" value = "글삭제" onclick = "if(confirm('게시글을 삭제 하시겠습니까?')) {
			location.href='qna_delete.so?no=${dto.getQna_num()}'
			} else { return; }">&nbsp;
		<input type = "button" value = "전체목록" onclick = "location.href='qna_list.so?id=${User}'">
		<br><br>
		<hr width = "50%" color = "red">
		<br>
		
		
		<%-- 댓글 폼 영역입니다. --%>
		<form method ="post" action = "qna_reply_insert_ok.so">
			<div>
				<input type="hidden" name="qno" value="${dto.getQna_num()}">
				<table cellspacing = "0" width = "400">
					<tr>
						<th>작성자</th>
						<td><input type = "text" name = "re_writer" id = "re_writer"></td>
					</tr>
					<tr>
						<th>댓글내용</th>
						<td><input type = "text" name = "re_content" id = "re_content"></td>
					</tr>
					<tr>
						<td colspan = "2" align = "right">
							<button type="submit">댓글작성</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
		<br>
		<h3>댓글 목록</h3>
		<div>
			<table border="1" cellspacing="0" width="400">
			<tr>
				<th>작성자</th>
				<th>댓글내용</th>
			</tr>
			
			<c:if test="${!empty Qlist}">
				<c:forEach items="${Qlist}" var="dto">
					<tr>
						<td>${dto.getQna_rewriter()}</td>
						<td>${dto.getQna_recont()}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty Qlist}">
				<tr>
					<td colspan="7" align="center">
						<h3>작성된 댓글이 없습니다.</h3>
				</tr>
			</c:if>
		</table>
		</div>
	</div>
</body>
</html>
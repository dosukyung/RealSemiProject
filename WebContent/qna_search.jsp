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
		<hr width = "50%" color = "red">
		<h3>BOARD 테이블 게시물 검색 리스트 페이지</h3>
		<hr width = "50%" color = "red">
		<br>
		<%-- 검색 폼 페이징 처리 영역 --%>
		<br>
		<table border="1" cellspacing="0" width="800">
			<tr>
				<th>No.</th>
				<th>말머리</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>수정일자</th>
			</tr>
			<c:set var="list" value="${List}" />
			<c:if test="${!empty list}">
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.getQna_num()}</td>
						<td>${dto.getQna_head()}</td>
						<c:if test="${Num == dto.getQna_writer()}">
							<td><a href="<%=request.getContextPath() %>/qna_content.so?num=${dto.getQna_num()}">${dto.getQna_title() }</a></td>				
						</c:if>
						<c:if test="${Num != dto.getQna_writer()}">
							<td>${dto.getQna_title()}</td>	
						</c:if>
						<td>${dto.getQna_nick()}</td>
						<td>${dto.getQna_regdate().substring(0, 10)}</td>
						<c:if test="${empty dto.getQna_update()}">
							<td></td>
						</c:if>
						<c:if test="${empty dto.getQna_update()}">
							<td>${dto.getQna_update().substring(0, 10)}</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan="7" align="center">
						<h3>전체 게시물 리스트가 없습니다.</h3>
				</tr>
			</c:if>
		</table>
			<c:forEach items="${NickList}" var="ndto">
				<h4>${ndto}</h4>
			</c:forEach>
		<br>
		<br>
		<form method = "post" action ="<%=request.getContextPath() %>/qna_search.so">
			<select name = "field">
				<option value = "head">말머리</option>
				<option value = "title">제목</option>
				<option value = "writer">작성자</option>
			</select>
			<input type = "text" name = "keyword">&nbsp;&nbsp;
			<input type = "submit" value = "검색">
		</form>
	</div>
</body>
</html>
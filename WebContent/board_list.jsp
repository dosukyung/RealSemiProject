<%@page import="com.member.model.MemberDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
   String location = request.getParameter("location"); 
   String UserId = (String)session.getAttribute("UserId");
   MemberDAO mdao = MemberDAO.getInstance();
   MemberDTO dto = mdao.contentById(UserId);
   String nick = dto.getMember_nick();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<style type="text/css">
.pagination {
	justify-content: center;
}
</style>
<script type="text/javascript">
	function check() {
		if(f.field.value == "") {
			alert("말머리를 선택하세요.");
			f.field.focus();
			return false;
		}
		if(f.title.value == "") {
			alert("글 제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if(f.cont.value == "") {
			alert("글 내용을 입력하세요.");
			f.cont.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div align="center">
		<hr width="50%" color="blue">
		<h3><%=location %> 게시판 </h3>
		<hr width="50%" color="blue">
		<br>
		<%-- 페이징 처리 영역 --%>
		<form method="post"
			action="<%=request.getContextPath() %>/board_search.so">
			<select name="field">
				<option value="head">말머리</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="cont">내용</option>
			</select> <input type="text" name="keyword">&nbsp;&nbsp; <input
				type="submit" value="검색">
		</form>
		<br>
		<table border="1" cellspacing="0" width="400">
			<tr>
				<td colspan="6" align="right">전체 게시물 수 : ${totalRecord}개
			</tr>
			<tr>
				<th>No.</th>
				<th>말머리</th>
				<th>글 제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성 일자</th>
			</tr>
			<c:set var="list" value="${List}" />
			<c:if test="${!empty list}">
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.getBoard_num()}</td>
						<td>${dto.getBoard_head()}</td>
						<td><a
							href="<%=request.getContextPath() %>/board_content.go?no=${dto.getBoard_num() }&page=${page}">${dto.getBoard_title() }</a></td>
						<td><%=nick%></td>
						<td>${dto.getBoard_hit()}</td>
						<td>${dto.getBoard_regdate().substring(0, 10)}</td>
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
		<br>
		<!-- Button trigger modal -->
		<% 
		if(session.getAttribute("UserId") == null){
		%>
		<h5>로그인 먼저하셈</h5>
		<% 
			}else{
		%>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#boardModal">게시글 작성</button>
		<br>

		<%	
			}
		%>


		<!-- Modal -->
		<div class="modal fade" id="boardModal" tabindex="-1"
			aria-labelledby="boardModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="boardModalLabel">Q&A 고객센터 게시글 등록 폼
							페이지</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="post" name="f"
							action="<%=request.getContextPath() %>/board_write_ok.go"
							onsubmit="return check()">
							<table border="1" cellspacing="0" width="300">
								<tr>
									<th>말머리</th>
									<td><select name="field">
											<option value="choice">말머리 선택</option>
											<option value="dona">나눔</option>
											<option value="boast">자랑</option>
											<option value="share">정보 공유</option>
											<option value="free">자유글</option>
									</select></td>
								</tr>
								
								<tr>
									<th>작성자</th>
									<td><input type="text" value="<%=nick %>" name="nick"
										readonly></td>
								</tr>
								
								<tr>
									<th>글제목</th>
									<td><input type="text" name="title"></td>
								</tr>
								
								<tr>
									<th>글내용</th>
									<td><textarea rows="7" cols="25" name="cont"></textarea></td>
								</tr>
								
								<tr>
									<th>첨부 파일</th>
									<td><input type="text" name="file"></td>
								</tr>
								
							</table>
							<div class="submit1">
								<input class="submit_btn btn-primary" type="submit" value="글쓰기">
								<input class="submit_btn btn-primary" type="reset" value="다시 작성">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br>
		<%-- 페이징 처리 영역 --%>
		<nav>
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="board_list.io?page=1">First</a></li>
				<li><a class="page-link" href="board_list.io?page=${page - 1}">Previous</a>
				</li>
				<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
					<c:if test="${i == page}">
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="board_list.io?page=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i != page}">
						<li class="page-item"><a class="page-link"
							href="board_list.io?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endBlock < allPage}">
					<li class="page-item"><a class="page-link"
						href="board_list.io?page=${page + 1}">Next</a></li>
				</c:if>
				<li class="page-item"><a class="page-link"
					href="board_list.io?page=${allPage}">End</a></li>
			</ul>
		</nav>

		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
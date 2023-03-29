<%@page import="com.member.model.MemberDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="com.MapBoard.model.MapBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MapBoardDTO cont = (MapBoardDTO)request.getAttribute("content");
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
</head>
<body>

	<div align="center">
		<hr width="50%" color="navy">
			<h3><%=location %> 게시판 </h3>
		<hr width="50%" color="navy">
		<br>
		<h3><%=nick %>님 게시글 상세내역 페이지 </h3>
		<br>
		
		<table border="1" cellspacing="0" width="400">
		<%  if(cont != null) { %>
			<tr>
				<th>글 No.</th>
					<td> <%=cont.getBoard_num() %> </td>
			</tr>
			
			<tr>
				<th>말머리</th>
					<td> <%=cont.getBoard_head() %> </td>
			</tr>
			
			<tr>
				<th>작성자</th>
					<td> <%=nick %> </td>
			</tr>
			
			<tr>
				<th>글 제목</th>
					<td> <%=cont.getBoard_title() %> </td>
			</tr>
			
			<tr>
				<th>글 내용</th>
					<td> <%=cont.getBoard_text().replace("\r\n", "<br>") %> </td>
			</tr>
			
			
			<tr>
				<th>조회 수</th>
					<td> <%=cont.getBoard_hit() %> </td>
			</tr>
			
			<tr>
				<th>좋아요</th>
					<td> <%=cont.getBoard_like() %> </td>
			</tr>
			
			<tr>
				<th>작성 날짜</th>
					<td> <%=cont.getBoard_regdate() %> </td>
			</tr>


			<% } else {
			%>
				<tr>
					<td colspan="2" align="center">
						<h3>조회된 게시글 정보가 없습니다.</h3>	
					</td>
				</tr>
			<%	}	%>
			</table>	
			<br>
			
			<input type="button" value="수정" onclick="location.href='modify.go?no=<%=cont.getBoard_num()%>'">&nbsp; 
			<input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?')) {location.href='board_delete.jsp?no=<%=cont.getBoard_num()%>'} else {return}">&nbsp; 
			<input type="button" value="목록" onclick="location.href='board_list.go'"> 
	</div>	

</body>
</html>
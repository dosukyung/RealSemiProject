<%@page import="java.util.List"%>
<%@page import="com.member.model.MemberDTO"%>
<%@page import="com.member.model.MemberDAO"%>
<%@page import="com.MapBoard.model.MapBoardDTO"%>
<%@page import="com.MapBoard.model.MapBoardDAO"%>

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
<%
	List<MapBoardDTO> search = (List<MapBoardDTO>)request.getAttribute("Search");
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="board_css/board.css">
</head>
<body>
	
	<%@include file="header.jsp"%>
	
	<div align="center">
	<c:set var="dto" value="${content }" />
		<hr width="50%" color="navy">
			<h3><%=location %> 게시판 </h3>
		<hr width="50%" color="navy">
		<br>
		
		
		
		<table class="table">
			
			<tr>
				<th>No.</th>		
				<th>말머리</th>		
				<th>글 제목</th>		
				<th>작성자</th>		
				<th>조회수</th>		
				<th>작성일자</th>		
			</tr>
			
			<%
				if(search.size() != 0) {
					for(int i = 0; i < search.size(); i++) {
						MapBoardDTO bdto = search.get(i);
			%>
						<tr>
							<td> <%=bdto.getBoard_num()%> </td>			
							<td> <%=bdto.getBoard_head()%> </td>				
							<td>
								<a href="<%=request.getContextPath() %>/board_content.go?no=<%=bdto.getBoard_num() %>&page=1"><%=bdto.getBoard_title()%></a></td>
																			
							<td> <%=bdto.getNick()%> </td>
							<td> <%=bdto.getBoard_hit()%> </td>			
							<td> <%=bdto.getBoard_regdate().substring(0,10)%> </td>
						</tr>				
			<% } 
			} else {		// 조회된 게시물이 없는 경우
			%>	<tr>
					<td colspan="6" align="center">
						<h3>조회 된 게시물이 없습니다.</h3>
					</td>
				</tr>		
		<%	} %>

		</table>
		
		<br>
		<input type="button" value="목록" onclick="location.href='board_list.go?location=<%=location %>'">
		<br>
		<br>
		
		<%@include file="footer.jsp"%>
	</div>
	
	

</body>
</html>
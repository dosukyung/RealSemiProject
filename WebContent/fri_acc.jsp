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
		<!-- 수락 관련 정보만 화면 뿌려주는 페이지 -->
	<div align="center">
	   <hr width="50%" color="red">
	      <h3>친구 수락 페이지</h3>
	   <hr width="50%" color="red">
	   <br>

	   <table border="1" cellspacing="0" width="400">
	     
	      <tr>
	         <th>친구 이름</th> 
	         <th>친구 닉네임</th> 
	         <th>친구 수락</th>
	      </tr>
	      
	      <c:set var="list" value="${list }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getMember_name() } </td>
	               <td> ${dto.getMember_nick() } </td>
	               <td> 
	                  <a href="<%=request.getContextPath() %>/fri_acc_ok.to?no=${dto.getMember_num() }">
	               						<button>신청 수락</button> </a></td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="4" align="center">
	               <h3>새로운 친구 신청이 없습니다</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	  </div>
</body>
</html>
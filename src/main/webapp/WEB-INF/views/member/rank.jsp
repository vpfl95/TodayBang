<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 <div class="pf-section">
 	
 	
 	<c:if test="${not empty ManagerRole }">
 		<div class =  "pf-title">관리자 등급</div>
 		<c:choose>
 			<c:when test="${ManagerRole.roleNum eq 1}">
 				<p>관리자</p>
 				
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 2}">
 				<p>매니저</p>
 				
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 3}">
 				<p>스토어 파트너</p>
 				
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 4}">
 				<p>직방 파트너</p>
 				
 			</c:when>
 		
 		</c:choose>
 	
 	
 	
 	
 	</c:if>
 	
 	<c:if test="${not empty MemberRole }">
 	<div class =  "pf-title">회원 등급</div>
 		<c:choose>
 			<c:when test="${MemberRole.roleNum eq 10}">
 				<img alt="" src="/resources/images/rank/Diamond.png">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 20}">
 				<img alt="" src="/resources/images/rank/Gold.png">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 30}">
 				<img alt="" src="/resources/images/rank/Silver.png">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 40}">
 				<img alt="" src="/resources/images/rank/White.png">
 			</c:when>
 		
 		</c:choose>
 	</c:if>
 	
 	
 	
 	
 	
 </div>


</body>
</html>
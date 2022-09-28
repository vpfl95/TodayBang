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
 	<div class =  "pf-title">회원 등급</div>
 	
 	<c:forEach items="${role }" var="dto">
 		<c:choose>
 			<c:when test="${dto.roleNum eq 10}">
 				<img alt="" src="/resources/images/rank/Diamond.png">
 			</c:when>
 			<c:when test="${dto.roleNum eq 11}">
 				<img alt="" src="/resources/images/rank/Gold.png">
 			</c:when>
 			<c:when test="${dto.roleNum eq 12}">
 				<img alt="" src="/resources/images/rank/Silver.png">
 			</c:when>
 			<c:when test="${dto.roleNum eq 13}">
 				<img alt="" src="/resources/images/rank/White.png">
 			</c:when>
 		
 		</c:choose>
 	</c:forEach>
 	
 	
 	
 	
 	
 </div>


</body>
</html>
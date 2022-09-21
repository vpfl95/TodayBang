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
 	<h1> hi</h1>
 	
 	<c:forEach items="${member.roleDTOs }" var="dto">
 		<c:if test="${dto.roleNum < 10 }"  >
 			관리자 등급 ${dto.roleName }
 			
 		</c:if>
 		<c:if test="${dto.roleNum > 9 }"  >
 			회원 등급 ${dto.roleName }
 		</c:if>
 	</c:forEach>
 	
 	
 	
 	
 	
 </div>


</body>
</html>
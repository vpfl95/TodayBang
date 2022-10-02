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
 	<div class="pf-body">
 	<c:if test="${not empty ManagerRole }">
 		<div class =  "pf-title">관리자 등급</div>
 		<div class ="">
 		<c:choose>
 			<c:when test="${ManagerRole.roleNum eq 1}">
 				<p>관리자</p>
 				<img alt="" src="/resources/images/rank/Admin.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 2}">
 				<p>매니저</p>
 				<img alt="" src="/resources/images/rank/Manager.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 3}">
 				<p>스토어 파트너</p>
 				<img alt="" src="/resources/images/rank/StorePartner.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 4}">
 				<p>직방 파트너</p>
 				<img alt="" src="/resources/images/rank/ZicbangPartner.png" class = "pf-rankImg">
 			</c:when>
 		
 		</c:choose>
 		
 		</div>
 		
 	
 	
 	
 	
 	</c:if>
 	
 	<c:if test="${not empty MemberRole }">
 	<div class =  "pf-title">회원 등급</div>
 		<div class= "">
 		<c:choose>
 			<c:when test="${MemberRole.roleNum eq 10}">
 				<img alt="" src="/resources/images/rank/Diamond.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 20}">
 				<img alt="" src="/resources/images/rank/Gold.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 30}">
 				<img alt="" src="/resources/images/rank/Silver.png" class = "pf-rankImg">
 			</c:when>
 			<c:when test="${MemberRole.roleNum eq 40}">
 				<img alt="" src="/resources/images/rank/White.png" class = "pf-rankImg">
 			</c:when>
 		
 		</c:choose>
 		
 		</div>
 		
 	</c:if>
 	</div>
 	
 	
 	
 	
 </div>


</body>
</html>
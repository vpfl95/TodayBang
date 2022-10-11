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
 		<div class =  "pf-title">운영진 등급</div>
 		<div class ="pf-rank">
 		<c:choose>
 			<c:when test="${ManagerRole.roleNum eq 1}">
 				
 				<img alt="" src="/resources/images/rank/Admin.png" class = "pf-rankImg">
 				<p>관리자</p>
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 2}">
 				<img alt="" src="/resources/images/rank/Manager.png" class = "pf-rankImg">
 				<p>매니저</p>
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 3}">
 				<img alt="" src="/resources/images/rank/StorePartner.png" class = "pf-rankImg">
 				<p>스토어 파트너</p>
 			</c:when>
 			<c:when test="${ManagerRole.roleNum eq 4}">
 				<img alt="" src="/resources/images/rank/ZicbangPartner.png" class = "pf-rankImg">
 				<p>직방 파트너</p>
 			</c:when>
 		
 		</c:choose>
 		
 		</div>
 		
 	
 	
 	
 	
 	</c:if>
 	
 	<c:if test="${not empty MemberRole }">
 	<div class =  "pf-title">회원 등급</div>
 		<div class= "pf-rank">
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
 	
 	
 	
 	
 	
 	<div id= "rankInfo">
 		<span id="rankInfotitle">회원 등급 표</span>
 		<table class ="table">
 		<thead>
 			<tr>
 				<th width="100px">등급이미지</th>
 				<th>등급명</th>
 				<th colspan="2">등급 혜택</th>
 			</tr>
 		</thead>

 		<tbody>
 			<tr>
	 			<td><img alt="" src="/resources/images/rank/Diamond.png" class = "pf-rankExplain"></td>
	 			<td>다이아몬드</td>
	 			<td colspan="2">결제금액 4% 포인트 적립</td>
 			</tr>
 			<tr>
	 			<td><img alt="" src="/resources/images/rank/Gold.png" class = "pf-rankExplain"></td>
	 			<td>골드</td>
	 			<td colspan="2">결제금액 3% 포인트 적립</td>
 			</tr>
 			<tr>
	 			<td><img alt="" src="/resources/images/rank/Silver.png" class = "pf-rankExplain"></td>
	 			<td>실버</td>
	 			<td colspan="2">결제금액 2% 포인트 적립</td>
 			</tr>
 			<tr>
	 			<td><img alt="" src="/resources/images/rank/White.png" class = "pf-rankExplain"></td>
	 			<td>화이트</td>
	 			<td colspan="2">결제금액 1% 포인트 적립</td>
 			</tr>
 		</tbody>
 		
 		</table>
 		</div>
 	</div>
 </div>


</body>
</html>
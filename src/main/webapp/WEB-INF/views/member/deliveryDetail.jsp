<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 장바구니 -->
	
	
	
	<div>
	<h3>${url }</h3>	
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th colspan="2">상품정보</th>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>비고(후기작성하러가기)</th>
			</tr>
		</thead>
		<tbody>
		
			
			
		
			<c:choose>
				<c:when test="${url eq '구매내역' }">
					<c:set var="loop" value="true"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="loop" value="false"></c:set>
				</c:otherwise>
			</c:choose>
			
		
			
			<c:forEach items="${order }" var="list" varStatus="status">
			<c:choose>
				<c:when test="${list.deliveryStatus eq '구매확정' }">
					<c:set var="check" value="true"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="check" value="false"></c:set>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${loop eq check }">
				<tr>
					<td>
						<img alt="" src="/resources/upload/store/product/${list.fileName }" style=" width: 70px;">
						${list.productDTO.brand }
						<br>
						${list.productDTO.productName }
						<br>	
						<c:forEach items="${list.productOptionDTOs }" var="option">
								${option.optionName }:
								${option.optionCount }개 
								<br>
						</c:forEach>
						
					</td>
					<td>${list.buyAmount }</td>
					<td>${list.orderDate }</td>
					<td>${list.orderNum }</td>
					<td>${list.productDTO.price }</td>
					<td>${list.deliveryStatus }</td>
					<td></td>
				</tr>
			
			</c:if>
			
			
			
			
		
			
			
			
			</c:forEach>
			
		</tbody>
	
	
	</table>
	</div>
	
	
</body>
</html>
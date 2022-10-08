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
	<div id="order-body">
	<h3>${url }</h3>	
		<div id="order-status-list">
			<a href="#"><div class ="order-status">입금대기<p>0<p></div></a>
			<a><div class ="order-status">결제완료<p>0<p></div></a>
			<a><div class ="order-status">배송준비<p>0<p></div></a>
			<a><div class ="order-status">배송중<p>0<p></div></a>
			<a><div class ="order-status">배송완료<p>0<p></div></a>
			<a id="order-status-last"><div class ="order-status" >구매확정<p>0<p></div></a>
		</div>
	
	
	
	
	<div id="order-section">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th colspan="2">상품정보</th>
				<th>주문일자</th>
				
				<th>주문금액</th>
				<th>주문상태</th>
				
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
					<td>${list.orderNum }</td>
				
				
					<td id="order-detail">
						<div class="cart-pd-detail">
							<div class="cart-pd-detail-image">
								<img id="cart-img" alt="" src="/resources/upload/store/product/${list.fileName }">
	 						</div> 
							<div  class="cart-pd-detail-contents">
								<div id="cart-brand">${list.productDTO.brand }</div> 
								
								<div id="cart-product">${list.productDTO.productName }</div> 
							</div>
							<div>
						
						
							</div>
						
						
						</div>
						
					</td>
					<td>${list.buyAmount }</td>
					<td>${list.orderDate }</td>
					
					<td>${list.productDTO.price }</td>
					<td>${list.deliveryStatus }</td>
					
				</tr>
			
			</c:if>
			
			
			
			
		
			
			
			
			</c:forEach>
			
		</tbody>
	
	
	</table>
	</div>
	</div>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

</head>
<body>
	<!-- 장바구니 -->
	<div id="order-body">
	<h3>${url }</h3>	
		<div id="order-status-list">
			<div class ="order-status order-deliveryDetail">입금대기<p>0<p></div>
			<div class ="order-status order-deliveryDetail">결제완료<p>0<p></div>
			<div class ="order-status order-deliveryDetail">배송준비<p>0<p></div>
			<div class ="order-status order-deliveryDetail">배송중<p>0<p></div>
			<div class ="order-status order-deliveryDetail">배송완료<p>0<p></div>
			<div class ="order-status order-buyDetail" >구매확정<p>0<p></div>
		</div>
	
	
	
	
	<div id="order-section">
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="120px">주문번호</th>
				<th>상품정보</th>
				<th  width="120px">주문일자</th>
				<th  width="130px">주문상태</th>
				
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
					<c:set var="check" value="true"></c:set> <!-- check/ture 구매확정 페이지 -->
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
								<a href="../product/detail?productNum=${list.productNum }"><img id="cart-img" alt="" src="/resources/upload/store/product/${list.fileName }"></a>
	 						</div> 
							<div  class="cart-pd-detail-contents">
								<div id="cart-brand">${list.productDTO.brand }</div> 
								
								<div id="cart-product"><a href="../product/detail?productNum=${list.productNum }">${list.productDTO.productName }</a></div> 
								
								<c:set var="opPrice" value="0"></c:set>
						
								<c:forEach items="${list.productOptionDTOs }" var="option">
									<div class="cart-pd-option">
										<span class="cart-option-count">${option.optionName }: ${option.optionCount }개</span>
										<span class="cart-won cart-option-price" data-a="${option.optionPrice * option.optionCount}"> ${option.optionPrice * option.optionCount}원</span>
										<c:set var="opPrice" value="${opPrice + (option.optionPrice * option.optionCount) }"></c:set>
									</div>
								</c:forEach>
								
								<c:set var="poPrice" value=" ${(opPrice+ list.productDTO.price) *list.buyAmount + list.productDTO.deliFee}"></c:set>
								<div class="cart-pd-price">
								<div class="cart-buyAmount" >수량 : ${list.buyAmount} 개</div>
								<span class="cart-deliFee cart-get" data-a="${list.productDTO.deliFee}">배송비 : ${list.productDTO.deliFee} 원</span>
								<span id="cart-detail-pay" class="cart-price cart-get" data-a="${poPrice}"> ${poPrice} 원</span>
								</div>
							</div>
							<div>
						
						
							</div>
						
						
						</div>
						
					</td>
					
					<td>${list.orderDate }</td>
					<td>
						${list.deliveryStatus }
						<div style="height: 20px;"></div>
						<c:if test="${check }">
							<a class="gotoReview" href="/product/detail?productNum=${list.productNum }" >리뷰 작성하기</a>
						</c:if>
					</td>
					
				</tr>
			
			</c:if>
			
			
			
			
		
			
			
			
			</c:forEach>
			
		</tbody>
	
	
	</table>
	</div>
	</div>
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		
		deliveryDetail();
		 cart();
	</script>
	
</body>
</html>
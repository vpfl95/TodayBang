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
	
	
	
	
<div id="cartDiv">
	<div class="cart-section">
	
	<div class = "cart-header">
	 <label for="allCheck" class ="nolabel"><input checked="checked" id="allCheck" type="checkbox" />모두선택</label>
	<span class = "cart-won" id="cart-selDelete">선택 삭제</span></div>
	
		
		
		
		<c:forEach items="${cart }" var="list" varStatus="status">
			<div class="cart-pd">
				<div class="cart-checkbox">
					<input checked="checked" type="checkbox" style="width: 20px; margin: 10px auto;"/>
				</div>
				<div class="cart-pd-body">
					<div class="cart-pd-detail">
						<div class="cart-pd-detail-image">
							<a href="../product/detail?productNum=${list.productNum }"><img id="cart-img" alt="" src="/resources/upload/store/product/${list.fileName }"></a>
 						</div> 
						<div  class="cart-pd-detail-contents">
							<div id="cart-brand">${list.productDTO.brand }</div> 
							
							<div id="cart-product"><a href="../product/detail?productNum=${list.productNum }">${list.productDTO.productName }</a></div>
						</div>
						<div>
						X
						
						</div>
						
						
					</div>
					
						<c:forEach items="${list.productOptionDTOs }" var="option">
							<div class="cart-pd-option">
								<span>${option.optionName }: ${option.optionCount }개</span><span class="cart-won"> 0000원</span>
							</div>
						</c:forEach>
					
					
					<div class="cart-pd-price">
					<div>수량 : ${list.buyAmount }</div>
					
					<span>배송비 : ${list.productDTO.deliFee }</span><span id="cart-detail-pay">${list.productDTO.price }원</span>
					</div>
					
					
				</div>
				
				
			</div>
		</c:forEach>
	</div>
	<div class ="cart-payDiv">
		<div class = "cart-pay-detail">
			<div class = "cart-payment"><span>총 상품 금액</span><span class = "cart-won">00000원</span></div>
			<div class = "cart-payment"><span>총 배송비</span><span class = "cart-won">00000원</span></div>
			<div class = "cart-payment"><span>총 할인금액</span><span class = "cart-won">00000원</span></div>
			<hr>
			<div id="cart-lastPay" class = "cart-payment"><span>결제 금액</span><span id="cart-lastwon" class = "cart-won">00000원</span></div>
		
		</div>
		<input type="button" class="" id="payBtn" value="결제하기">
	</div>
</div>	
</body>
</html>
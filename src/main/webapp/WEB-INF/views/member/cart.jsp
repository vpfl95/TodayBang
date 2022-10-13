<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="/resources/css/member/myPage2.css" rel="stylesheet">
</head>
<body>
	<!-- 장바구니 -->
	
	
	
	
<div id="cartDiv">
	<div class="cart-section">
	
	<div class = "cart-header">
	 <label for="allCheck" class ="nolabel"><input id="allCheck" type="checkbox" />모두선택</label>
	<span class = "cart-won" id="cart-selDelete">선택 삭제</span></div>
	
		
		
		
		<c:forEach items="${cart }" var="list" varStatus="status">
			<div class="cart-pd">
				<div class="cart-checkbox">
					<input class="cart-checked" type="checkbox" data-a="${list.cartNum }" style="width: 20px; margin: 10px auto;" />
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
						<div class = "cart-delete" data-a="${list.cartNum }">
						X
						</div>
						
						
					</div>
						<c:set var="opPrice" value="0"></c:set>
						
						<c:forEach items="${list.productOptionDTOs }" var="option">
							<div class="cart-pd-option">
								<span class="cart-option-count">${option.optionName }: ${option.optionCount }개</span>
								<span class="cart-won cart-option-price" data-a="${option.optionPrice * option.optionCount}"> ${option.optionPrice * option.optionCount}원</span>
								<c:set var="opPrice" value="${opPrice + (option.optionPrice * option.optionCount) }"></c:set>
							</div>
						</c:forEach>
						
						<c:set var="poPrice" value=" ${opPrice+ (list.productDTO.price*list.buyAmount) + list.productDTO.deliFee}"></c:set>
					<div class="cart-pd-price">
					<div class="cart-buyAmount" >수량 : ${list.buyAmount} 개</div>
					<span class="cart-deliFee cart-get" data-a="${list.productDTO.deliFee}">배송비 : ${list.productDTO.deliFee} 원</span>
					<span id="cart-detail-pay" class="cart-price cart-get" data-a="${poPrice}"> ${poPrice} 원</span>
					</div>
					
					
				</div>
				
				
			</div>
		</c:forEach>
	</div>
	<div class ="cart-payDiv">
		<div class = "cart-pay-detail">
			<div class = "cart-payment"><span>총 상품 금액</span><span class = "cart-won" id="cart-lastPdPrice">00000원</span></div>
			<div class = "cart-payment"><span>총 배송비</span><span class = "cart-won" id="cart-lastDeliFee">00000원</span></div>
			<div class = "cart-payment"><span>총 할인금액</span><span class = "cart-won" id="cart-discount">00000원</span></div>
			<hr>
			<div id="cart-lastPay" class = "cart-payment"><span>결제 금액</span><span id="cart-lastPrice" class = "cart-won">00000원</span></div>
		
		</div>
		<input type="button" class="" id="payBtn" value="결제하기">
	</div>
</div>	


<script type="text/javascript">

	cart();
	$(document).ready(function(){
		$("#allCheck").trigger("click");
		
	
		
	});
</script>


</body>
</html>
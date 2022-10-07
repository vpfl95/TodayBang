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
	
	배송내역 페이지 입니다 .
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
		
			<c:forEach items="${order }" var="list" varStatus="status">
			<tr>
				<td>
					${list.cartDTO.productDTO.brand }
					<br>
					${list.cartDTO.productDTO.productName }
					<br>	
					<c:forEach items="${list.cartDTO.productOptionDTOs }" var="option">
							${option.optionName }:
							${option.optionCount }개 
							<br>
					</c:forEach>
					
				</td>
				<td>${list.cartDTO.buyAmount }</td>
				<td>${list.orderDate }</td>
				<td>${list.orderNum }</td>
				<td>${list.cartDTO.productDTO.price }</td>
				<td>${list.deliveryStatus }</td>
				<td></td>
			</tr>
			
			
			</c:forEach>
			
		</tbody>
	
	
	</table>
	
	
	
</body>
</html>
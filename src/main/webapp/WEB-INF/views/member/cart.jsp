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
	
	장바구니 페이지 입니다 .
	<br>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th></th>
				<th>전체 ${length }개</th>
				<th>상품명(옵션)</th>
				<th>수량</th>
				<th>가격</th>
				<th>주문관리</th>
				<th>배송비/배송형태</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach items="${cart }" var="list" varStatus="status">
			<tr>
				<td><input type="checkbox"/></td>
				<td>${status.index +1}</td>
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
				<td>${list.productDTO.price }</td>
				<td></td>
				<td>${list.productDTO.deliFee }</td>
			</tr>
			
			
			</c:forEach>
			
		</tbody>
	
	
	</table>
	
	
	
</body>
</html>
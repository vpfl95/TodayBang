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
				<th>전체 00개</th>
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
				<td>${status.index +1}</td>
				<td>
					${list.productDTO.productName }
					${list.option1DTO.optionName }	
					${list.option2DTO.optionName }	
					${list.option3DTO.optionName }	
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
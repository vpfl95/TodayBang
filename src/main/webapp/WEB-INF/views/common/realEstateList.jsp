<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${dto.buildingNm}
	<tr>
		<th>계약일</th>
		<th>거래</th>
		<th>거래가격</th>
		<th>면적</th>
		<th>층수</th>
	</tr>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.dealDay}</td>
			<td>${dto.dealType}</td>
			<td>${dto.dealType} ${dto.deal}  ${dto.deposit} ${dto.wdeposit}/${dto.monthly}</td>
			<td>${dto.area}</td>
			<td>${dto.floor}</td>
		</tr>
	</c:forEach>
</body>
</html>
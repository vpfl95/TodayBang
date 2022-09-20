<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>직방 페이지</h1>
	<div id="map" style="width:1000px;height:800px;"></div>
	
	<c:forEach items="${list}" var="dto">
		<div class="dto">${dto.roadName} ${dto.sigungu} ${dto.buildingNm}</div>
	</c:forEach>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f734c47d571810dc50360665614e2cd&libraries=services,clusterer,drawing"></script>
	<script src="/resources/js/map.js"></script>
</body>
</html>
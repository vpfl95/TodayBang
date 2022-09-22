<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="./map.css">
	<style>
		.map_wrap {position:relative;width:100%;height:800px;}
		.title {font-weight:bold;display:block;}
		.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#centerAddr {display:block;margin-top:2px;font-weight: normal;}
		.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.custom{display: flex;flex: 1 1 0%;-webkit-box-pack: center;justify-content: center;pointer-events: none;flex-direction: column;line-height: 1.2;background-size: 100%;text-align: center;user-select: none;}
		.building {position: relative;cursor: pointer;background-size: 100%;background-repeat: no-repeat;text-align: center;user-select: none;}
		.building-top{line-height: 1.1;padding-top: 7px;font-size: 10px;font-weight: bold; color: white;}
		.building-bot {line-height: 1.1;padding-top: 4px;font-size: 12px;font-weight: bold; color: white;}
		.building-name {position: absolute;bottom: -16px;transform: translateX(-50%);left: 50%;font-size: 10px;line-height: 1.4;color: rgb(255, 255, 255);padding-bottom: 1px;padding-left: 3px;padding-right: 3px;opacity: 0.8;background-color: rgb(96, 96, 96);overflow: hidden;text-overflow: ellipsis;}
	</style>
</head>
<body>
	<h1>${zigbang} 페이지</h1>
	
	<div class="map_wrap">
		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		<div class="hAddr">
			<span class="title">지도중심기준 법정동, 행정동 주소정보</span>
			법정동:<span id="B"></span><br>
			행정동:<span id="H"></span>
		</div>
	</div>
	

	<c:forEach items="${list}" var="dto">
		<div class="dto">${dto.roadName} ${dto.sigungu} ${dto.buildingNm}</div>
	</c:forEach>
	


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f734c47d571810dc50360665614e2cd&libraries=services,clusterer,drawing"></script>
	<script src="/resources/js/map.js"></script>
</body>
</html>
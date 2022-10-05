<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="./map.css">
	<style>
		.map_wrap {position:relative;width:100%;height:800px;}
		.title {font-weight:bold;display:block;}
		.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#centerAddr {display:block;margin-top:2px;font-weight: normal;}
		.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

		.custom{display: flex;flex: 1 1 0%;-webkit-box-pack: center;justify-content: center;pointer-events: none;flex-direction: column;line-height: 1.2;background-size: 100%;text-align: center;user-select: none;}
		.building {position: relative;z-Index:0;cursor: pointer;background-size: 100%;background-repeat: no-repeat;text-align: center;user-select: none;background-image: url('/resources/images/apartment.png')}
		.building-top{line-height: 1.1;padding-top: 7px;font-size: 10px;font-weight: bold; color: black;}
		.building-bot {line-height: 1.1;padding-top: 4px;font-size: 12px;font-weight: bold; color: black;}

		.building-select {position: relative; z-index:10; cursor: pointer;background-size: 100%;background-repeat: no-repeat;text-align: center;user-select: none;background-image: url('/resources/images/apartment_select.png')}
		.building-top-select{line-height: 1.1;padding-top: 7px;font-size: 10px;font-weight: bold; color: black;}
		.building-bot-select {line-height: 1.1;padding-top: 4px;font-size: 12px;font-weight: bold; color: black;}
		.building-name {position: absolute;bottom: -16px;transform: translateX(-50%);left: 50%;font-size: 10px;line-height: 1.4;color: rgb(255, 255, 255);padding-bottom: 1px;padding-left: 3px;padding-right: 3px;opacity: 0.8;background-color: rgb(96, 96, 96);overflow: hidden;text-overflow: ellipsis;}
		
		#searchWrap{position:absolute; right:10px;top:10px;border-radius: 2px;z-index:10;padding:5px; height: 30%;}
		#sugguestList{overflow: auto; height: 100%; display: none;}
		.selectItem{background: white;font-size: 12px;font-weight: bold;color: rgb(68, 68, 68);box-sizing: border-box;cursor: pointer;padding: 13px 10px 0px;line-height: 18px;border:1px solid gray}
		.addressDIV{color: rgb(68, 68, 68);font-size: 10px;font-weight: normal;}
		.selected{background-color: lightskyblue; color: white;}

		#buildingInfo{position:absolute;right:10px;top:40px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}

		#buildingWrap{position:absolute;right:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#buildingName{position:absolute;right:10px;top:0px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#maemulList{position:absolute;right:10px;top:50px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		

		#review{position:absolute;right:10px;top:363px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		#writeReview{position:absolute;right:10px;bottom:10px;}
		/* #sugguestList{position:absolute; right:25px;top:40px;border-radius: 2px;background:rgba(255,255,255,0.8);z-index:10;padding:5px; height: 30%; overflow: auto; height: 30%;}  */
	</style>
	 <link href="/resources/css/reset.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<section class="container-fluid container-lg-8 mt-5">

		<h1>${zigbang} 페이지</h1>
		
		<div class="map_wrap">
			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			<div class="hAddr">
				<span class="title">지도중심기준 법정동, 행정동 주소정보</span>
				법정동:<span id="B"></span><br>
				행정동:<span id="H"></span>
			</div>
			
			<form action="" onsubmit="searchPlaces(); return false;" id="searchWrap" style="width: 30%;">
				<div id="search">
					<input type="text" id="keyword" autocomplete="off" style="width: 80%;">
					<button type="submit">검색</button>
				</div>
				<div class="slClass" id="sugguestList"></div>
			</form>
	
			<div id="buildingInfo"style="height: 95%;width: 30%;overflow:auto;">
	
				<div id="buildingWrap" style="height: 40%;width: 95%;overflow:auto;">
					
					<div id="buildingName"></div>
			
					<div id="maemulList">
						<table id="realEstateList" border="1">
							<tr>
								<th>계약일</th>
								<th>거래가격</th>
								<th>면적</th>
								<th>층수</th>
							</tr>
						</table>
						<button id="more">더보기</button>
					</div>
				</div>
	
				<div style="position:absolute;right:10px;top:343px;">거주민 리뷰</div>
				<div id="review" style="height: 40%;width: 95%;overflow:auto;">
					<div id="houseReviewList"></div>
					<button id="reviewMore">더보기</button>		
				</div>
				<button type="button" id="writeReview" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">리뷰 작성하기</button>
				
			</div>
			
		</div>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">New message</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					
					<div class="modal-body">
						<!-- <div class="css-1dbjc4n" style="background-color: rgb(117, 117, 117);border-radius: 3.5px;height: 7px;margin-left: 2px;margin-right: 2px;margin-top: 2.33333px;width: 7px;"></div>
						<div class="css-1dbjc4n" style="background-color: rgb(225, 225, 225); border-radius: 3.5px; height: 7px; margin-left: 2px; margin-right: 2px; margin-top: 2.33333px; width: 7px;"></div> -->
						<input type="text" name="" id="roadname">
						<form>
							<input type="text" id="maemulNum">
							<input type="text" value="${member.userId}" id="userId">
							<div class="mb-3">
								<label for="message-text" class="col-form-label">추천점수:</label>
								<input type="number" id="grade">
								<textarea class="form-control" id="grade-text"></textarea>
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">교통여건:</label>
								<input type="number" id="trfgrade">
								<textarea class="form-control" id="trf-text"></textarea>
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">주변환경:</label>
								<input type="number" id="envgrade">
								<textarea class="form-control" id="env-text"></textarea>
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">거주환경:</label>
								<input type="number" id="resgrade">
								<textarea class="form-control" id="res-text"></textarea>
							</div>
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="addReview">리뷰 작성</button>
					</div>

				</div>
			</div>
		</div>

	</section>
	
	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f734c47d571810dc50360665614e2cd&libraries=services,clusterer,drawing"></script>
	<script src="/resources/js/map.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
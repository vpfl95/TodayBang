<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/map.css">
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
	
			<div id="buildingInfo"style="height: 95%;width: 30%;">
	
				<div id="buildingWrap" style="height: 40%;width: 95%;">
					
					<div id="buildingName"></div>
			
					<div id="maemulList">
						<!-- <input type="text" name="" id="user" value="${member.userId}"> -->
						<table id="realEstateList">
							<tr>
								<th>등록일</th>
								<th>거래가격</th>
								<th>면적</th>
								<th>층수</th>
								<th>관심</th>
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
				<button type="button" id="writeReview" value="${member.userId}" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">리뷰 작성하기</button>
				<button type="button" id="upReview" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">수정</button>
			</div>
			
		</div>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">리뷰 작성하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					
					<div class="modal-body">
						<!-- <div class="grade_empty" style="background-color: rgb(117, 117, 117);border-radius: 3.5px;height: 7px;margin-left: 2px;margin-right: 2px;margin-top: 2.33333px;width: 7px;"></div>
						<div class="grade_full" style="background-color: rgb(225, 225, 225); border-radius: 3.5px; height: 7px; margin-left: 2px; margin-right: 2px; margin-top: 2.33333px; width: 7px;"></div> -->
						<input type="text" name="" id="roadname" >
						<form>
							<input type="text" id="maemulNum" >
							<input type="text" value="${member.userId}" id="userId" >
							<input type="text" id="reviewNum">
							<div class="mb-3">
								추천점수:
								<!-- <input type="number" id="grade"> -->
								<fieldset>
									<input type="radio" name="recommend" id="radio1" value="5"><label for="radio1">⭐</label>
									<input type="radio" name="recommend" id="radio2" value="4"><label for="radio2">⭐</label>
									<input type="radio" name="recommend" id="radio3" value="3"><label for="radio3">⭐</label>
									<input type="radio" name="recommend" id="radio4" value="2"><label for="radio4">⭐</label>
									<input type="radio" name="recommend" id="radio5" value="1"><label for="radio5">⭐</label>
								</fieldset>
								<textarea class="form-control" id="grade-text"></textarea>
							</div>
							<div class="mb-3">
								교통여건:
								<!-- <input type="number" id="trfgrade"> -->
								<fieldset>
									<input type="radio" name="trf" id="radio6" value="5"><label for="radio6">⭐</label>
									<input type="radio" name="trf" id="radio7" value="4"><label for="radio7">⭐</label>
									<input type="radio" name="trf" id="radio8" value="3"><label for="radio8">⭐</label>
									<input type="radio" name="trf" id="radio9" value="2"><label for="radio9">⭐</label>
									<input type="radio" name="trf" id="radio10" value="1"><label for="radio10">⭐</label>
								</fieldset>
								<textarea class="form-control" id="trf-text"></textarea>
							</div>
							<div class="mb-3">
								주변환경:
								<!-- <input type="number" id="envgrade"> -->
								<fieldset>
									<input type="radio" name="env" id="radio11" value="5"><label for="radio11">⭐</label>
									<input type="radio" name="env" id="radio12" value="4"><label for="radio12">⭐</label>
									<input type="radio" name="env" id="radio13" value="3"><label for="radio13">⭐</label>
									<input type="radio" name="env" id="radio14" value="2"><label for="radio14">⭐</label>
									<input type="radio" name="env" id="radio15" value="1"><label for="radio15">⭐</label>
								</fieldset>
								<textarea class="form-control" id="env-text"></textarea>
							</div>
							<div class="mb-3">
								거주환경:
								<!-- <input type="number" id="resgrade"> -->
								<fieldset>
									<input type="radio" name="res" id="radio16" value="5"><label for="radio16">⭐</label>
									<input type="radio" name="res" id="radio17" value="4"><label for="radio17">⭐</label>
									<input type="radio" name="res" id="radio18" value="3"><label for="radio18">⭐</label>
									<input type="radio" name="res" id="radio19" value="2"><label for="radio19">⭐</label>
									<input type="radio" name="res" id="radio20" value="1"><label for="radio20">⭐</label>
								</fieldset>
								<textarea class="form-control" id="res-text"></textarea>
							</div>
						</form>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="addReview">리뷰 작성</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="updateReview">수정</button>
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
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

		<!-- <h1>${zigbang} 페이지</h1> -->
		
		<div class="map_wrap">
			<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			<div class="hAddr">
				<span class="title">지도중심기준 법정동, 행정동 주소정보</span>
				법정동:<span id="B"></span><br>
				행정동:<span id="H"></span>
			</div>
			
			<form action="" onsubmit="searchPlaces(); return false;" id="searchWrap" style="width: 30%;">
  				<div class="gXAUDv">

					  <div class="search-input-liner" id="search">
						  <div class="input-wrap">
							  <input type="text" id="keyword" autocomplete="off" style="width: 100%;">
						  </div>
						  <div class="btn-search-wrap">
							  <button class="btn-search" type="submit"></button>
						  </div>
					  </div> 
				</div>

				<div class="slClass" id="sugguestList"></div>
			</form>
	
			<div class="info" id="buildingInfo">
	
				<div id="buildingName"></div>
				<c:if test="${member.roleDTOs[0].roleNum eq 4}">
					<button type="button" id="insertReal" style="background-color: rgb(250, 136, 11);" value="${member.userId}" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModa2" data-bs-whatever="@mdo">집 내놓기</button>			
				</c:if>

				<div id="buildingWrap">
					<div id="maemulList">
						<table class="table" id="realEstateList">
							<thead class="table-warning">
								<tr>
									<th>등록일</th>
									<th>거래가격</th>
									<th>면적</th>
									<th>층수</th>
									<th>관심</th>
								</tr>
							</thead>
						</table>
						<button id="more">더보기</button>
					</div>
				</div>
	
				<div id="reviewTitle">거주민 리뷰</div>

				<div id="review">
					<div id="houseReviewList"></div>
					<button id="reviewMore">더보기</button>		
				</div>

				<button type="button" style="background-color: rgb(250, 136, 11);;" id="writeReview" value="${member.userId}" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">리뷰 작성하기</button>
				<button type="button" id="upReview" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">수정</button>
			</div>
			
		</div>
		
		<!-- 리뷰 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">리뷰 작성하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					
					<div class="modal-body">
						<input type="text" name="" id="roadname" >
						<form>
							<input type="text" id="maemulNum" >
							<input type="text" value="${member.userId}" id="userId" >
							<input type="text" id="reviewNum">
							<div class="mb-3 mod">
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
							<div class="mb-3 mod">
								교통여건:
								<fieldset>
									<input type="radio" name="trf" id="radio6" value="5"><label for="radio6">⭐</label>
									<input type="radio" name="trf" id="radio7" value="4"><label for="radio7">⭐</label>
									<input type="radio" name="trf" id="radio8" value="3"><label for="radio8">⭐</label>
									<input type="radio" name="trf" id="radio9" value="2"><label for="radio9">⭐</label>
									<input type="radio" name="trf" id="radio10" value="1"><label for="radio10">⭐</label>
								</fieldset>
								<textarea class="form-control" id="trf-text"></textarea>
							</div>
							<div class="mb-3 mod">
								주변환경:
								<fieldset>
									<input type="radio" name="env" id="radio11" value="5"><label for="radio11">⭐</label>
									<input type="radio" name="env" id="radio12" value="4"><label for="radio12">⭐</label>
									<input type="radio" name="env" id="radio13" value="3"><label for="radio13">⭐</label>
									<input type="radio" name="env" id="radio14" value="2"><label for="radio14">⭐</label>
									<input type="radio" name="env" id="radio15" value="1"><label for="radio15">⭐</label>
								</fieldset>
								<textarea class="form-control" id="env-text"></textarea>
							</div>
							<div class="mb-3 mod">
								거주환경:
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

		<!-- 집 내놓기 모달 -->
		<div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h1 class="modal-title fs-5" id="exampleModalLabel">집 내놓기</h1>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				  <form>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">타입</label>
						<input type="text" class="form-control" id="buildType" disabled>
					  </div>
					<div class="mb-3">
					  <label for="recipient-name" class="col-form-label">지역</label>
					  <input type="text" class="form-control" id="sigungu" disabled>
					</div>
					<div class="mb-3">
					  <label for="message-text" class="col-form-label">도로명 주소</label>
					  <input class="form-control" id="roadName" disabled></input>
					</div>

					<div class="mb-3">
						<label for="message-text" class="col-form-label">건물명</label>
						<input class="form-control" id="buildingNm" disabled></input>
					</div>
					<fieldset>
						<input type="radio" name="dealType" id="meme" value="매매" checked="checked" onchange="dealTypeCheck()"><label for="meme">매매</label>
						<input type="radio" name="dealType" id="junse" value="전세" onchange="dealTypeCheck()"><label for="junse">전세</label>
						<input type="radio" name="dealType" id="walse" value="월세" onchange="dealTypeCheck()"><label for="walse">월세</label>
					</fieldset>
					<div class="mb-3" id="m">
						<label for="message-text" class="col-form-label">매매가격</label>
						<input class="form-control" id="deal"></input>
					</div>
					<div class="mb-3" id="d" style="display: none;">
						<label for="message-text" class="col-form-label">전세</label>
						<input class="form-control" id="deposit"></input>
					</div>
					<div class="mb-3" id="wd" style="display: none;">
						<label for="message-text" class="col-form-label">월세보증금</label>
						<input class="form-control" id="wdeposit"></input>
					</div>
					<div class="mb-3" id="w" style="display: none;">
						<label for="message-text" class="col-form-label">월세</label>
						<input class="form-control" id="monthly"></input>
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">면적</label>
						<input class="form-control" id="area"></input>
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">층</label>
						<input class="form-control" id="floor"></input>
					</div>
				  </form>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="addReal">등록</button>
				</div>
			  </div>
			</div>
		  </div>

	</section>
	
	<script>
		
		function dealTypeCheck(){

			if(document.getElementsByName("dealType")[0].checked==true){
				document.getElementById("m").style.display="block"
				document.getElementById("d").style.display="none"
				document.getElementById("wd").style.display="none"
				document.getElementById("w").style.display="none"
			}else if(document.getElementsByName("dealType")[1].checked==true){
				document.getElementById("d").style.display="block"
				document.getElementById("m").style.display="none"
				document.getElementById("wd").style.display="none"
				document.getElementById("w").style.display="none"
			}else if(document.getElementsByName("dealType")[2].checked==true){
				document.getElementById("wd").style.display="block"
				document.getElementById("w").style.display="block"
				document.getElementById("m").style.display="none"
				document.getElementById("d").style.display="none"
			}
		}

	</script>

	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f734c47d571810dc50360665614e2cd&libraries=services,clusterer,drawing"></script>
	<script src="/resources/js/map.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
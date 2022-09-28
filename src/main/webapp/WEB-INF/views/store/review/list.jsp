<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.star-rating {
		width: 100px;
		margin-right: 10px;
		margin-top: 3px;
	}
	
	.star-rating, .star-rating span {
		display: inline-block;
		height: 18px;
		overflow: hidden;
		background: url(/resources/images/store/review/star.png)no-repeat;
	}

	.star-rating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

	.star-detailRating {
		width: 80px;
		margin-right: 10px;
		margin-top: 3px;
	}

	.star-detailRating, .star-detailRating span {
		display: inline-block;
		height: 14.5px;
		overflow: hidden;
		background: url(/resources/images/store/review/starDetail.png)no-repeat;
	}

	.star-detailRating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

	.btnHelp {
		color: #35c5f0;
		transition: opacity .1s;
		font: inherit;
		margin: 0;
		padding: 0;
		background: none;
		border-radius: 4px;
		border: solid 1px #35c5f0;
		margin-right: 10px;
		font-weight: bold;
		padding: 5px 20px;
	}

	.bar {
		width: 60%;
		background-color: #dadce0;
		margin: 7px 8px 0 8px;
		border-radius: 5px;
		height: 10px;
		position: relative;
		z-index: 1;
	}

	.bar div {
		position: absolute;
		height: 100%;
		background-color: #35c5f0;
		z-index: 2;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="review-header d-flex">
		<div style="width: 50%;" class="d-flex justify-content-center">
			<div style="width: 67%; border: solid blue 1px;"></div>
			<div style="width: 33%;"></div>
		</div>
		<div style="width: 50%;">
			<div class="d-flex justify-content-center mt-3">
				<div style="width: 10%;"><b>5점</b></div>
				<div class="bar"><div style="width:${grade[4]/grade[5]*100}%"></div></div>
				<div style="width: 10%;">${grade[4]}</div>
			</div>
			<div class="d-flex justify-content-center">
				<div style="width: 10%;"><b>4점</b></div>
				<div class="bar"><div style="width:${grade[3]/grade[5]*100}%"></div></div>
				<div style="width: 10%;">${grade[3]}</div>
			</div>
			<div class="d-flex justify-content-center">
				<div style="width: 10%;"><b>3점</b></div>
				<div class="bar"><div style="width:${grade[2]/grade[5]*100}%"></div></div>
				<div style="width: 10%;">${grade[2]}</div>
			</div>
			<div class="d-flex justify-content-center">
				<div style="width: 10%;"><b>2점</b></div>
				<div class="bar"><div style="width:${grade[1]/grade[5]*100}%"></div></div>
				<div style="width: 10%;">${grade[1]}</div>
			</div>
			<div class="d-flex justify-content-center mb-3">
				<div style="width: 10%;"><b>1점</b></div>
				<div class="bar"><div style="width:${grade[0]/grade[5]*100}%"></div></div>
				<div style="width: 10%;">${grade[0]}</div>
			</div>
		</div>
	</div>
	<div class="d-flex mt-2">
		<button class="btnSort">베스트순</button>
		<button class="btnSort">최신순</button>
		<button class="btnSort">🖼사진리뷰</button>
	</div>
	<hr>
	<c:forEach items="${list}" var="dto">
		<div class="mt-3">
			<div class="d-flex">
				<div style="width: 10%; margin-right: 10px;">
					<img src="../../resources/upload/store/review/${dto.fileName}" 
					alt="..." style="width: 100%;">
				</div>
				<div style="width:50%;">
					<div>${dto.userId}</div>
					<div class="d-flex" style="width: 100%;">
						<div class='star-rating'>
							<span style="width:${(dto.durStar 
								+ dto.designStar 
								+ dto.priceStar 
								+ dto.deliveryStar)/4*20}%">
							</span>
						</div>
						<div style="margin-bottom: 10px;">${dto.regDate}</div>
					</div>
				</div>
			</div>
			<div class="d-flex">
				<label for="dur" style="margin-right: 5px">내구성</label>
				<div id="dur" class="star-detailRating" style="margin-right: 10px;"><span style="width:${dto.durStar * 20}%"></span></div>
				<label for="price" style="margin-right: 5px">가격</label>
				<div class="star-detailRating"><span style="width:${dto.priceStar*20}%"></span></div>
			</div>
			<div class="d-flex">
				<label for="design" style="margin-right: 5px">디자인</label>
				<div id="design" class="star-detailRating" style="margin-right: 10px;"><span style="width:${dto.designStar * 20}%"></span></div>
				<label for="delivery" style="margin-right: 5px">배송</label>
				<div id="delivery" class="star-detailRating"><span style="width:${dto.deliveryStar*20}%"></span></div>
			</div>
			<div style="width: 20%;">
				<img src="../../resources/upload/store/review/${dto.fileName}" 
				style="width: 100%;">
			</div>
			<div class="mt-3">${dto.contents}</div>
			<div class="d-flex justify-content-between mt-3">
				<div class="d-flex">
					<button class="btnHelp">도움이 돼요</button>
					<div style="margin-top: 4px;">${dto.help}명에게 도움이 되었습니다.</div>
				</div>
				<div class="d-flex">
					<button class="update btn btn-primary me-2" data-update-revnum="${dto.revNum}">수정</button>
					<button class="delete btn btn-danger" data-delete-revnum="${dto.revNum}">삭제</button>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
</body>
</html>
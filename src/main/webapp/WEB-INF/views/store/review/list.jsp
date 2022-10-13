<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.star-LargeRating {
		width: 140px;
		margin-top: 30px;
	}
	
	.star-LargeRating, .star-LargeRating span {
		display: inline-block;
		height: 26px;
		overflow: hidden;
		background: url(/resources/images/store/review/starLarge.png)no-repeat;
	}

	.star-LargeRating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

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
	
	.totalGrade {
		font-weight: 900;
		font-size: 50px;
		text-align: center;
	}

	.delete {
		cursor: pointer;
		margin-right: 10px;
	}
</style>
</head>
<body>
	<div class="review-header d-flex">
		<div style="width: 50%; padding-top: 30px;" class="d-flex justify-content-center">
			<div class="d-flex justify-content-center" style="width: 66%;">
				<div class="star-LargeRating"><span style="width:${totalGrade*20}%"></span></div>
			</div>
			<div class="totalGrade" style="width: 33%; margin-top: 7px; padding-right: 30px;">${totalGrade}</div>
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
	<div class="d-flex mt-2" id="sort" data-sort-type="${type}">
		<c:choose>
			<c:when test="${type eq 0}">
				<button class="btnSort sortList" data-sort=0 style="font-weight: bold;">베스트순</button>
				<button class="btnSort sortList" data-sort=1>최신순</button>			
				<button class="btnSort picCheck">🖼사진리뷰</button>
			</c:when>
			<c:when test="${type eq 1}">
				<button class="btnSort sortList" data-sort=0>베스트순</button>
				<button class="btnSort sortList" data-sort=1 style="font-weight: bold;">최신순</button>			
				<button class="btnSort picCheck">🖼사진리뷰</button>
			</c:when>
			<c:when test="${type eq 2}">
				<button class="btnSort sortList" data-sort=0 style="font-weight: bold;">베스트순</button>
				<button class="btnSort sortList" data-sort=1>최신순</button>			
				<button class="btnSort picCheck" style="font-weight: bold;">🖼사진리뷰</button>
			</c:when>
			<c:otherwise>
				<button class="btnSort sortList" data-sort=0>베스트순</button>
				<button class="btnSort sortList" data-sort=1 style="font-weight: bold;">최신순</button>
				<button class="btnSort picCheck" style="font-weight: bold;">🖼사진리뷰</button>
			</c:otherwise>
		</c:choose>
	</div>
	<hr>
	<c:forEach items="${list}" var="dto" varStatus="i">
		<div class="mt-3">
			<a id="${dto.revNum }"></a>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div style="width: 20%; margin-right: 10px;">
						<c:choose>
							<c:when test="${not empty profile.fileName}">
								<img style="max-width: 100%; border-radius: 50%;" src="../resources/upload/member/${profile.fileName}">
							</c:when>
							<c:otherwise>
								<img style="max-width: 100%; border-radius: 50%;" src="/resources/images/NoProfile.png">
							</c:otherwise>
						</c:choose>
					</div>
					<div style="width:60%;">
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
				<c:if test="${member.userId eq dto.userId}">
					<div class="delete" data-delete-revnum="${dto.revNum}">❌</div>
				</c:if>
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
				<c:if test="${not empty dto.fileName}">						
					<img src="../../resources/upload/store/review/${dto.fileName}" 
					alt="..." style="width: 100%;">
				</c:if>
			</div>
			<div class="mt-3">${dto.contents}</div>
			<div class="d-flex justify-content-between mt-3">
				<div class="d-flex">
					<c:choose>
						<c:when test="${chkHelp ne null}">
							<c:choose>
								<c:when test="${chkHelp[i.index] eq null}">
									<button class="btnHelp" data-help-revnum="${dto.revNum}">도움이 돼요</button>
								</c:when>
								<c:otherwise>
									<button class="btnHelp" data-help-revnum="${dto.revNum}" style="background-color: #35c5f0; color: white;">✔ 도움됨</button>						
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<button class="btnHelp" data-help-revnum="${dto.revNum}">도움이 돼요</button>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${totalCount[i.index] eq null}">
							<div class="divHelp" style="margin-top: 4px;"></div>
						</c:when>
						<c:otherwise>		
							<div class="divHelp" style="margin-top: 4px;">${totalCount[i.index]}명에게 도움이 되었습니다.</div>			
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${member.userId eq dto.userId}">
					<div class="d-flex">
						<button class="update btn btn-primary me-2" data-update-revnum="${dto.revNum}" data-bs-toggle="modal" data-bs-target="#reviewModal">수정</button>
					</div>
				</c:if>
			</div>
		</div>
		<hr>
	</c:forEach>
	
	
	<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js">
	
	
	
	
	</script>
	
</body>
</html>
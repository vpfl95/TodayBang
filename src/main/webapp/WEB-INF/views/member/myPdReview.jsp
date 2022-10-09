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
	
	상품 리뷰 페이지
	
	<c:forEach items="${list}" var="dto" varStatus="i">
		<div class="mt-3">
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div style="width: 20%; margin-right: 10px;">
						<c:if test="${not empty dto.fileName}">						
							<img src="../../resources/upload/store/review/${dto.fileName}" 
							alt="..." style="width: 100%;">
						</c:if>
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
				<div class="delete" data-delete-revnum="${dto.revNum}">❌</div>
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
				<div class="d-flex">
					<button class="update btn btn-primary me-2" data-update-revnum="${dto.revNum}" data-bs-toggle="modal" data-bs-target="#reviewModal">수정</button>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
</body>
</html>
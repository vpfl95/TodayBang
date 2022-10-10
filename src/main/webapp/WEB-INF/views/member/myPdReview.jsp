<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
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
	
	
	
	<div class="myPdReview-body">
		<h3> 상품 리뷰 페이지</h3> 
		<div class="myPdReview-div">
		
		
		
		
	
	<c:forEach items="${list}" var="dto" varStatus="i">
		<div class="mt-3">
			<div class="d-flex justify-content-between">
				<div class="d-flex" style="width: 100%;">
					<div  style="width:98%;">
						 
						<a href="/product/detail?productNum=${dto.productNum }&revNum=${dto.revNum}"><span>[${dto.brand}]</span>	<span>${dto.productName }</span></a>
					</div>
					
				</div>
			</div>
		
		
		
		
			<div class="d-flex justify-content-between flex-wrap">
				<div class="d-flex">
					<div style="width:750px;">
						
						
						<div class="d-flex" style="width: 220px;">
							<div class='star-rating'>
								<span style="width:${(dto.durStar 
									+ dto.designStar 
									+ dto.priceStar 
									+ dto.deliveryStar)/4*20}%">
								</span>
							</div>
							<div style="margin-bottom: 10px; ">${dto.regDate}</div>
						</div>
						<div class="mt-3">${dto.contents}</div>
					</div>
				</div>
				
				<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
				<div style="">
					<c:if test="${not empty dto.fileName}">						
						<img class="reviewImg" src="../../resources/upload/store/review/${dto.fileName}" 
						alt="..." style="width: 100px;">
					</c:if>
				</div>
				
				
				
			</div>
			
			
			
			
		</div>
		<hr>
	</c:forEach>
	
	</div>
	</div>
	
	
	<script type="text/javascript">
	
	myPdReview();
	
	
	</script>
</body>
</html>
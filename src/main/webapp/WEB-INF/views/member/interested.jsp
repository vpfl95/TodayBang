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

	<div id="intHouseDiv">
		<c:if test="${empty list }">
			<div class="NoItem">
				<div class="NoItemTitle">관심 매물이 없습니다. 관심 매물을 등록 해 보세요.</div>
				<br>
				<div class="NoItemLink"><a href="/apt/map" class="NoItemLink">관심매물 등록하러 가기</a></div>
			</div>
			
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="dto">
					<div class = "houseBox">
						<div class="houseImgBox">
							<img class ="houseImg" alt="" src="/resources/images/interSample.jpg">
						</div>
						<div>
							<span style="color: gray; font-weight: 400">[${dto.buildType }]</span> 
						</div>
						<div>
							${dto.sigungu }
							
						</div>
						<div>
							
							<span style=" font-weight: 600">${dto.buildingNm }</span> 
							
							
						</div>
						<div class="deleteIntersted" style="font-size: 30px" data-a="${dto.num }">
						❤️
						</div>
						
					
					
					
					</div>
					
					
			
			</c:forEach>
		</c:if>
		
	
	
	
	
	
	
	</div>

<script type="text/javascript">
interest();


</script>
</body>
</html>
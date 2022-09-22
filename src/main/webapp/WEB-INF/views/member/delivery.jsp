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

<div class = "pf-section">
	<h1>배송지 정보</h1>
	<h1>${check }</h1>
	
	
	<c:if test="${check}">
		<c:forEach items="${delivery }" var="del">
			${del.deliveryName }
			${del.address }
			${del.name }
		</c:forEach>
	
	</c:if>
	<c:if test="${!check}">
		<h1>배송지가 없습니다 설정해보세요 ! </h1>
		<button id="addDeliveryBtn" class="w-100 btn btn-lg btn-primary" type="button" data-a= "/member/addDelivery">추가하기</button>
	</c:if>

</div>

<script type="text/javascript">

	$(document).on("click","#addDeliveryBtn",function(){
		$("#profile-section").load(this.getAttribute('data-a'));
	});

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class = "pf-section">
		<h1>배송지 정보 추가</h1>
	<div>
				<form action="./addDelivery" method="post" id = "deliveryForm" >
		        		<div id = "deliveryInput">
			        		<label for="deliveryName">배송지 별칭</label>
					        <input type="text" id="deliveryName" name = "deliveryName" class="form-control nonOverlab" placeholder="배송지 별칭" required autofocus>
					        
					        <label for="name" >성함</label>
					        <input type="text" id="name" name = "name" class="form-control nonOverlab" placeholder="성함" required>
					        
					        <label for="phone" >전화번호</label>
					        <input type="text"  id="phone" name = "phone" class="form-control " placeholder="전화번호" required>
					        
					       	<label for="address" >주소</label>
					        <input type="text"  id="address" name = "address" class="form-control " placeholder="주소" required>
					       
					       	<label for="note" >요청사항</label>
					        <input type="text"  id="note" name = "note" class="form-control " placeholder="요청사항" required>
					       
					        <input type="hidden" value="${member.userId }" id="userId" name = "userId" class="form-control " placeholder="요청사항" required>
					       
					        <div></div>
					        <div></div>
					        
		        		</div>
						
				        <button id="deliveryBtn" class="w-100 btn btn-lg btn-primary" type="button">추가하기</button>
			</form>
	</div>

</div>


<script type="text/javascript">

	delivery();
</script>

</body>
</html>
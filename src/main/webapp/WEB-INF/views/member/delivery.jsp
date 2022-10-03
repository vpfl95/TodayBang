<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href= "/resources/css/member/myPage.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

 <c:import url="../template/header.jsp"></c:import>
<section class="container-fluid container-lg-8 mt-4">
	<div class="container-fluid container-lg-8 pt-4">
		<!-- 카테고리 1  --> 
			<ul id = "myPage-1">
				<li class = "myPage-list" id = "myPage-profile" > 프로필 </li>
				<li class = "myPage-list" id = "myPage-shopping"> 나의 쇼핑</li>
				<li class = "myPage-list" id = "myPage-write"> 나의 글</li>
				
			</ul>
		<hr>
		</div>
		
		<div class="container-fluid container-lg-8 mt-4 ">
		<!-- 카테고리 2 -->
			<ul id = "myPage-2">
				
			
				
			</ul>
		<hr>
</div>


<div class = "pf-section">
	<div class = "pf-body">
		<div class = "pf-title">배송지 정보</div>
		<hr>
			<c:choose>
				<c:when test="${length eq 0 }">
					<div id = "deliveryHead" title="3">
				</c:when>
				<c:otherwise>
					<div id = "deliveryHead" title=${num }>
				</c:otherwise>
			
			</c:choose>
			
		
		
			<div class = "de-ListDiv">
				
					<c:forEach items="${delivery }" var="del" varStatus="index">
						<div class = "de-ListItem" data-a = "/member/delivery?num=${index.index }">${del.deliveryName }</div> 
					</c:forEach>
				<c:if test="${length<3 }">
					<div title= "3" class = "de-ListItem" data-a = "/member/delivery?num=3">추가하기</div>
				</c:if>
				
			</div>
			
			
		</div>
		<div id = "deliveryBody">
		
		<!-- 몸통 -->
			
		<form action="./updateDelivery" method="POST" id="deliveryForm">
			<input type="hidden" value ="${delivery[num].addressNum}"  name = "addressNum" class="form-control ">
			<table class="table" id="de-table">
					  <thead>
					    
					  </thead>
					  <tbody>
					  	<tr>
					      	<th scope="row">배송지 별칭</th>
					      	
					   		<td><input type="text" value ="${delivery[num].deliveryName }"  name = "deliveryName" class="form-control "  required autofocus ></td>
						        
					    </tr>
					    <tr>
					      	<th scope="row">수령인</th>
					   		<td><input type="text" value ="${delivery[num].name }" name = "name"  class="form-control " required  ></td>
						        
					    </tr>
					    <tr>
					      <th scope="row">전화번호</th>
					      <td><div id= "phone">
						        	<input type="hidden" name = "phone" id="submitPhone" value ="${delivery[num].phone }">
							       
							        <select name="phone1" id="phoneFirst" class="form-control " required>
							         	<option value="010"  selected="selected">010</option>
							         	<option value="011"  >011</option>
							         	<option value="070"  >070</option>
							        
							        </select>
							        <label for="phone" class = "nolabel">-</label>
							        <input type="text"  id="phoneMiddle" maxlength="4" name = "phone1" class="form-control " placeholder="0000" required>
							        <label for="phoneLast" class = "nolabel">-</label>
							        <input type="text"  id="phoneLast" maxlength="4" name = "phone1" class="form-control " placeholder="0000" required>
						        </div>
					        </td>
					    </tr>
					    <tr>
					      <th scope="row">주소</th>
					      <td><input type="text" value ="${delivery[num].address }" id="address_kakao" name = "address" class="form-control" required autofocus ></td>
						   							     
					    </tr>
					    <tr>
					      <th scope="row">요청사항</th>
					      <td><input type="text" value ="${delivery[num].note }"  name = "note" class="form-control"  ></td>
						     
					    </tr>
					    
					   
					  </tbody>
					</table>
					${member.userId }
					
					
					
					
					
					
					<div class = "btnDiv">
						<button id="delDeleteBtn" class="de-Btn" type="button">삭제</button>
					  	<button id="delUpdateBtn" class="de-Btn" type="button">저장</button>
			
					</div>
				</form>
		</div>
	</div>
</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
   
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    new daum.Postcode({
							        oncomplete: function(data) {
							            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
							            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
							        }
							    }).open();
</script>
<script src="/resources/js/member.js"></script>
<script type="text/javascript">
	myPage();
	delivery();

	 $(document).ready(function(){
		
		$("#myPage-profile").trigger("click");
	});
	
	
	$("#deliveryHead").on("click",".de-ListItem",function(){
		
		$("#profile").load(this.getAttribute('data-a'));
		
	});
	
	
	
	
	
	

</script>
 
   
</body>
</html>
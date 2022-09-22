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
	<hr>
	
	<c:if test="${check}">
	
	<div id = "deliveryHead" title=${num }>
		<ul>
		<c:forEach items="${delivery }" var="del" varStatus="index">
			<li class = "deliveryList" data-a = "/member/delivery?num=${index.index }">${del.deliveryName }</li>
		</c:forEach>
		<c:if test="${length<3 }">
			<li title= "3" class = "deliveryList" data-a = "/member/delivery?num=3">추가하기</li>
		
		</c:if>
			
		
		</ul>
		
	</div>
	<div id = "deliveryBody">
	
	<!-- 몸통 -->
		
			
		<table class="table">
				  <thead>
				    
				  </thead>
				  <tbody>
				    <tr>
				      	<th scope="row">수령인</th>
				   		<td><input type="text" value ="${delivery[num].name }"   class="form-control nonOverlab" placeholder="" required autofocus ></td>
					        
				    </tr>
				    <tr>
				      <th scope="row">전화번호</th>
				      <td><div id= "phone">
					        	<input type="hidden" name = "phone" id="submitPhone" value ="${delivery[num].phone }">
						       
						        <select name="phone1" id="phoneFirst" class="form-control nonOverlab" required>
						         	<option value="010"  selected="selected">010</option>
						         	<option value="011"  >011</option>
						         	<option value="070"  >070</option>
						        
						        </select>
						        <label for="phone" class = "nolabel">-</label>
						        <input type="text"  id="phoneMiddle" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
						        <label for="phoneLast" class = "nolabel">-</label>
						        <input type="text"  id="phoneLast" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
					        </div>
				        </td>
				    </tr>
				    <tr>
				      <th scope="row">주소</th>
				      <td><input type="text" value ="${delivery[num].address }"   class="form-control nonOverlab" placeholder="" required autofocus ></td>
					     
				    </tr>
				    <tr>
				      <th scope="row">요청사항</th>
				      <td><input type="text" value ="${delivery[num].note }"   class="form-control nonOverlab" placeholder="" required autofocus ></td>
					     
				    </tr>
				    
				   
				  </tbody>
				</table>
			
		
	</div>
		
	
	</c:if>
	
	
	
	
	
	<c:if test="${!check}">
		<h3>배송지가 없습니다 설정해보세요 ! </h3>
		<button id="addDeliveryBtn" class="w-100 btn btn-lg btn-primary" type="button" data-a= "/member/addDelivery">추가하기</button>
	</c:if>

</div>

<script type="text/javascript">

	

	$(document).on("click","#addDeliveryBtn",function(){
		$("#profile-section").load(this.getAttribute('data-a'));
	});
	
	
	$("#deliveryHead").on("click",".deliveryList",function(){
		
		$("#profile-section").load(this.getAttribute('data-a'));
		
		
		
	});
	
	
	
	
	
	

</script>

</body>
</html>
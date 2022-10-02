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
					      <td><input type="text" value ="${delivery[num].address }"  name = "address" class="form-control" required autofocus ></td>
						     
					    </tr>
					    <tr>
					      <th scope="row">요청사항</th>
					      <td><input type="text" value ="${delivery[num].note }"  name = "note" class="form-control"  autofocus ></td>
						     
					    </tr>
					    
					   
					  </tbody>
					</table>
					
					<div class = "btnDiv">
						<button id="delDeleteBtn" class="de-Btn" type="button">삭제</button>
					  	<button id="delUpdateBtn" class="de-Btn" type="button">저장</button>
			
					</div>
				</form>
		</div>
	</div>
</div>

<script type="text/javascript">

	delivery();

	
	
	
	$("#deliveryHead").on("click",".de-ListItem",function(){
		
		$("#profile").load(this.getAttribute('data-a'));
		
	});
	
	
	
	
	
	

</script>

</body>
</html>
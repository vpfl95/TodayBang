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
		
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

 <c:import url="../template/header.jsp"></c:import>
<section class="container-fluid container-lg-8 mt-4">
	<c:import url="./myPageCate.jsp"></c:import>
		
		<div class="container-fluid container-lg-8 mt-4 ">
		<!-- 카테고리 2 -->
			<ul id = "myPage-2">
				
			
				
			</ul>
		<hr>
	</div>
<div class = "row justify-content-center mt-5">
<div class = " col-lg-10 d-flex justify-content-center" id = "profileDiv"  >
	<div class = "de-section">
		<div class = "pf-body">
			<div class = "pf-title">배송지 정보</div>
			<hr>
				
			<div id = "deliveryBody">
			
			<!-- 몸통 -->
				
			<form action="./updateDelivery" method="POST" id="deliveryForm">
				<input type="hidden" value ="${delivery[num].addressNum}" id="addressinput" name = "addressNum" class="form-control ">
				<table class="table" id="de-table">
						  <thead>
						    <tr>
						    
						    <c:forEach items="${delivery }" var="del" varStatus="index">
								<th><a href="/member/delivery?num=${index.index }" class = "de-ListItem" >${del.deliveryName }</a></th>
							</c:forEach>
							
							
							<c:if test="${length<3 }">
								<th><a href="/member/delivery?num=3" class = "de-ListItem" >추가하기</a></th>
							</c:if>
							<c:if test="${length<2 }">
								<th></th>
							</c:if>
					    	<c:if test="${length<1 }">
								<th></th>
							</c:if>
						    </tr>
						    
						    
						    
						  </thead>
						  <tbody>
						  	<tr>
						      	<th scope="row">배송지 별칭</th>
						      	
						   		<td><input type="text" value ="${delivery[num].deliveryName }"  name = "deliveryName" class="form-control "  required autofocus ></td>
						        <td></td>
						    </tr>
						    <tr>
						      	<th scope="row">수령인</th>
						   		<td><input type="text" value ="${delivery[num].name }" name = "name"  class="form-control " required  ></td>
						        <td></td>
						    </tr>
						    <tr>
						      <th scope="row">전화번호</th>
						      <td colspan="2"><div id= "phone">
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
						       
							   <td><input type="text" value ="${delivery[num].postcode}" name="postcode" id="sample6_postcode" class="form-control " placeholder="우편번호"></td>
								<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
								
								 <tr>
								<th></th>
								<td colspan="2"><input type="text" value ="${delivery[num].address}" name="address" id="sample6_address" class="form-control " placeholder="주소"><br></td>
								 </tr>
								<tr>
								<th></th>
								<td><input type="text" value ="${delivery[num].detailAddress}" name="detailAddress" id="sample6_detailAddress" class="form-control " placeholder="상세주소"></td>
								<td><input type="text" value ="${delivery[num].extraAddress}" name="extraAddress" id="sample6_extraAddress" class="form-control " placeholder="참고항목"></td>
							   </tr>
							      							     
						   
						    <tr>
						      <th scope="row">요청사항</th>
						      <td colspan="2"><input type="text" value ="${delivery[num].note }"  name = "note" class="form-control"  ></td>
						    </tr>
						  </tbody>
						</table>
						
						<div class = "btnDiv">
							<button id="delDeleteBtn" class="de-Btn inputbutton" type="button">삭제</button>
						  	<button id="delUpdateBtn" class="de-Btn inputbutton" type="button">저장</button>
				
						</div>
					</form>
			</div>
		</div>
	</div>
</div>
</div>
</section>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>




<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
   

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/member.js"></script>
<script type="text/javascript">
	myPage();
	delivery();

	 $(document).ready(function(){
		
		$("#myPage-profile").trigger("click");
	});
	
	
	
	

</script>
 
   
</body>
</html>
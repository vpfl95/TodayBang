<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




			<div id = "profile-id" class = "" >
					<div id = "pf-img-box" class="pf-img-box">
						<c:choose>
					         	<c:when test="${empty member.memberFileDTO }">
						         		<img class= "pf-img"alt="" src="/resources/images/NoProfile.png">
					         	</c:when>
					         	<c:when test="${not empty member.memberFileDTO }">
						         		<img class = "pf-img"alt="" src="../resources/upload/member/${member.memberFileDTO.fileName }">
					         	</c:when>
					         </c:choose>
					</div>
					<div id = "pf-userName" class = "column">
						<h2>${member.userName }</h2>
					</div>
					
					<hr>
					<div id = "pf-userAct" class = "column">
						<h4><span class="material-symbols-outlined">shopping_cart 마일리지 등급</span></h4>
					</div>

				</div>

<div id="pf-betweenSpace"></div>

<div  class="pf-section">

	<div class = "pf-body">
		<div class = "pf-pf-title">
			<div class="pf-title">내 정보 수정하기</div>
			<div id= "dropId" class= "">탈퇴하기</div>
		</div>
			
		<div>
				<form action="./update" method="post" id = "updateForm" enctype="multipart/form-data" >
		        		<div id = "updateInput">
			        		<label for="userId">아이디</label>
					        <input type="text" value ="${member.userId }" readonly="readonly" id="userId" name = "userId" class="form-control nonOverlab" placeholder="아이디" required autofocus style="background-color: #dcddde">
					        
					        <label for="nickname" >닉네임</label>
					        <input type="text" value ="${member.nickname }" id="nickname" name = "nickname" class="form-control nonOverlab" placeholder="닉네임" required>
					        
					        <label for="userName" >이름</label>
					        <input type="text" value ="${member.userName }" id="userName" name = "userName" class="form-control " placeholder="이름" required>
					        
					        <label for="inputPhone" >핸드폰</label>
					        <div id= "phone">
					        	<input type="hidden" name = "phone" id="submitPhone" value ="${member.phone }">
						        
						        <select name="phone1" id="phoneFirst" class="form-control nonOverlab" required>
						         	<option value="010"  selected="selected">010</option>
						         	<option value="011"  >011</option>
						         	<option value="070"  >070</option>
						        
						        </select>
						        <label for="phone" class="nolabel">-</label>
						        <input type="text"  id="phoneMiddle" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
						        <label for="phoneLast" class="nolabel">-</label>
						        <input type="text"  id="phoneLast" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
					        </div>
					        
					        
					        
					        
					        
					        <label for="email" >이메일</label>
					        <div id= "email">
					        <input type="hidden" value ="${member.email }" name = "email" id="submitEmail">
						        <input type="text"  id="emailFirst" name = "email1" class="form-control nonOverlab" placeholder="이메일" required>
						        <label for="emailAt" class="nolabel">@</label>
						        <select name="email1" id="emailAt" class="form-control nonOverlab" required>
						         	<option value="0" disabled selected="selected">선택해주세요</option>
						         	<option value="naver.com">naver.com</option>
								 	<option value="gmail.com">gmail.com</option>
								 	<option value="hanmail.net">hanmail.net</option>
								 	<option value="daum.net">daum.net</option>
								 	<option value="nate.com">nate.com</option>
								 	<option value="1">직접입력</option>
						        </select>
					        </div>
					        <div></div>
					        <div></div>
					        <div id= "pf-previewTitle">
					        <label for="image_container" >프로필 사진</label>
					        <div id="deleteBtn" class="">프로필사진 삭제</div>
					         </div>
					        
					          <div id="pf-previewBox">
						         
						         <c:choose>
						         	<c:when test="${empty profile }">
						         	<div  class="pf-img-box">
							         	 <label for="profileImg" class="nolabel" >
							         		<img id="previewProfile" alt="" src="/resources/images/NoProfile.png" class = "pf-img">
							         	</label>
						         	</div>
							         	
						         	</c:when>
						         	<c:when test="${not empty profile }">
						         	<div  class="pf-img-box">
							         	 <label for="profileImg" class="nolabel" >
							         		<img id="previewProfile" alt="" src="../resources/upload/member/${profile.fileName }" class = "pf-img">
							         	</label>
						         	</div>
						         	</c:when>
						         </c:choose>
						         <div id="previewNameDiv" class="d-flex justify-content-center">
					         		<label for="profileImg" class="nolabel previewName" id="previewNameLabel">${profile.oriName }</label>
						          </div>
					         </div>
					         
					         <input type="file"  id="profileImg" name = "profileImg"  class="form-control display-none" onchange="setThumbnail(event);" multiple/>
					        
					         
					         
					          
					        
					        
		        		</div>
						
				        <button id="updateBtn" class="w-100 btn btn-lg inputbutton" type="button">수정</button>
				        
				        
					</form>
		</div>
	</div>


</div>

<script type="text/javascript">

	profile();
	
	function setThumbnail(event) {
		 for (var image of event.target.files) {
	          var reader = new FileReader();

	          reader.onload = function(event) {
	         
	           	$("#previewProfile").attr('src',event.target.result);
	          };

	          reader.readAsDataURL(image);
        }
      }
</script>


</body>
</html>
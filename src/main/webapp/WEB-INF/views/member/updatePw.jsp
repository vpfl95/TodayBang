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
	
	
	
		<div class =  "pf-title">비밀번호 변경</div>
		<div id="pwCheckDiv" >
			<form action="./updatePw" id = "pwCheckForm" method="POST">
			    
			    <label for="password" >현재 비밀번호 확인</label>
			    <input type="password" id="password" name = "password" class="form-control nonOverlab" placeholder="현재 비밀번호" required>
				<button id="pwCheckBtn" class="w-50 btn btn-lg btn-primary" type="button">확인</button>
			</form>
		</div>	
		
		
		
		<div id="pwUpdateDiv" class =  "pf-hidden">
			<form action="./updatePw" id = "pwUpdateForm" method="POST">
				
			    <input type="hidden" value ="${member.userId}" id="userId" name = "userId">
			    <input type="hidden" value ="${member.password}" id="defaultPw" name = "defaultPw">
			    <label for="newPassword" >새 비밀번호</label>
			    <input type="password" id="newPassword" name = "password" class="form-control nonOverlab" placeholder="새 비밀번호" required>
				
				<label for="newPasswordCheck" >새 비밀번호 확인</label>
			    <input type="password" id="newPasswordCheck" name = "passwordCheck" class="form-control nonOverlab" placeholder="새 비밀번호 확인" required>
				<button id="pwUpdateBtn" class="w-50 btn btn-lg btn-primary" type="button">변경하기</button>
				
			</form>
		</div>	   
	     
	</div>
</div>
	
	
<script type="text/javascript">
	updatePw();
</script>
	
	
	
</body>
</html>
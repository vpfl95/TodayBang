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
        <link rel="stylesheet" href="/resources/css/store/order.css">
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5 d-flex justify-content-center">
        <div class="left_re mt-5">
            <h3 style="margin-bottom: 50px;">주문/결제</h3>
            <h4>주문자</h4>
            <hr style="width: 95%;">
            <div class="d-flex" style="height: 38px;">
                <label for="userName" style="width: 15%; line-height: 50px;">이름</label>
				<input type="text" id="userName" name = "userName" class="form-control nonOverlab" style="width: 40%;">
            </div>

            <div class="d-flex mt-3">
                <label for="email" style="width: 15%;">이메일</label>
                <div id= "email" style="width: 80%;" class="d-flex">
                    <input type="hidden" name = "email" id="submitEmail">
                    <input type="text"  id="emailFirst" name = "email1" class="form-control nonOverlab" style="width: 50%;">
                    <label for="emailAt" class="nolabel" style="width: 10%; text-align: center; font-size: 20px;">@</label>
                    <select name="email1" id="emailAt" class="form-control nonOverlab" style="width: 40%;">
                        <option value="0" disabled selected="selected">선택해주세요</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="daum.net">daum.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="1">직접입력</option>
                    </select>
                </div>
            </div>

            <div class="d-flex mt-3">
                <label for="inputPhone" style="width: 15%;">휴대전화</label>
                <input type="hidden" name = "phone" id="submitPhone">
                <div id= "phone" class="d-flex" style="width: 40%;">
                    <select name="phone1" id="phoneFirst" class="form-control nonOverlab" style="width: 30%; margin-right: 10px;">
                        <option value="010" selected="selected">010</option>
                        <option value="011" >011</option>
                        <option value="070" >070</option>
                    </select>
                    <input type="text"  id="phone" maxlength="8" name = "phone1" class="form-control nonOverlab" placeholder="입력해주세요" style="width: 70%;">
                </div>
            </div>

            <div class="d-flex justify-content-between mt-5" style="width: 95%;">
                <h4>배송지</h4>
                <button type="button" class="same">위와 동일하게 채우기</button>
            </div>
            <hr style="width: 95%;">
            <div class="d-flex" style="height: 38px;">
                <label for="deliName" style="width: 15%; line-height: 50px;">배송지명</label>
				<input type="text" id="deliName" name = "deliName" class="form-control nonOverlab" style="width: 40%;">
            </div>
            <div class="d-flex mt-3" style="height: 38px;">
                <label for="addressee" style="width: 15%; line-height: 50px;">받는 사람</label>
				<input type="text" id="addressee" name = "addressee" class="form-control nonOverlab" style="width: 40%;">
            </div>
            <div class="d-flex mt-3">
                <label for="inputPhone" style="width: 15%;">연락처</label>
                <input type="hidden" name = "phone" id="submitPhone">
                <div id= "phone" class="d-flex" style="width: 40%;">
                    <select name="phone1" id="phoneFirst" class="form-control nonOverlab" style="width: 30%; margin-right: 10px;">
                        <option value="010" selected="selected">010</option>
                        <option value="011" >011</option>
                        <option value="070" >070</option>
                    </select>
                    <input type="text"  id="phone" maxlength="8" name = "phone1" class="form-control nonOverlab" placeholder="입력해주세요" style="width: 70%;">
                </div>
            </div>
        </div>

        <div class="right_re mt-5">
            <div class="right_re1">
                <h3>결제금액</h3>
                <div class="d-flex justify-content-between mt-4">
                    <div>총 상품 금액</div>
                    <div>0원</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div>배송비</div>
                    <div>0원</div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div>포인트 사용</div>
                    <div>0원</div>
                </div>
                <hr style="width: 90%; margin: 30px auto 0 auto;">

                <div class="d-flex justify-content-between mt-2">
                    <div>최종 결제 금액</div>
                    <div>0원</div>
                </div>
                <div>0포인트 적립 예정</div>
                <hr style="width: 90%; margin: 30px auto 0 auto;">
            </div>
        </div>
	</section>
	
	<c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
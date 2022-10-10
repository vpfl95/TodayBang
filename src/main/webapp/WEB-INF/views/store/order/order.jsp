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

	<section class="container d-flex justify-content-center">
        <div class="left_re">
            <h3 style="margin-bottom: 50px;">주문/결제</h3>
            <h4>주문자</h4>
            <hr style="width: 95%; margin-top: 8px;">
            <div class="d-flex" style="height: 38px;">
                <label for="userName">이름</label>
				<input type="text" id="userName" name = "userName" class="form-control nonOverlab" style="width: 40%;">
            </div>

            <div class="d-flex mt-3">
                <label for="email">이메일</label>
                <div id= "email" style="width: 80%;" class="d-flex">
                    <input type="hidden" name = "email" id="submitEmail">
                    <input type="text"  id="emailFirst" name = "email1" class="form-control nonOverlab" style="width: 50%;">
                    <div for="emailAt" class="nolabel" style="width: 7%; text-align: center; font-size: 20px;">@</div>
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
                <label for="inputPhone">휴대전화</label>
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
                <button type="button" class="same">내 배송지 가져오기</button>
            </div>
            <hr style="width: 95%; margin-top: 8px;">
            <div class="d-flex" style="height: 38px;">
                <label for="deliName">배송지명</label>
				<input type="text" id="deliName" name = "deliName" class="form-control nonOverlab" style="width: 40%;">
            </div>
            <div class="d-flex mt-3" style="height: 38px;">
                <label for="addressee">받는 사람</label>
				<input type="text" id="addressee" name = "addressee" class="form-control nonOverlab" style="width: 40%;">
            </div>
            <div class="d-flex mt-3">
                <label for="inputPhone">연락처</label>
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
            <div class="mt-3">
                <div class="d-flex">
                    <label for="sample6_postcode">주소</label>
                    <div class="d-flex" style="width: 40%;">
                        <input type="button" class="sample-postcode searchAddress" value="주소찾기">
                        <input type="text" class="sample-postcode form-control sample-postcode-input" name="postcode" id="sample6_postcode" style="width: 70%;" readonly>
                    </div>
                </div>
                <div class="d-flex mt-3">
                    <label for="sample6_address"></label>
                    <input type="text" class="sample-postcode form-control sample-postcode-input" name="address" id="sample6_address" style="width: 80%;" readonly>
                </div>
                <div class="d-flex mt-3">
                    <label for="sample6_address"></label>
                    <input type="text" name="detailAddress" id="sample6_detailAddress" class="form-control" style="width: 80%;" placeholder="상세주소">
                </div>
            </div>

            <div class="mt-3">
                <select name="deliRequest" id="deliRequest" class="form-select" style="width: 95%;">
                    <option value="0">배송시 요청사항을 선택해주세요</option>
                    <option value="1">부재시 문앞에 놓아주세요</option>
                    <option value="2">배송전에 미리 연락주세요</option>
                    <option value="3">부재시 경비실에 맡겨 주세요</option>
                    <option value="4">부재시 전화주시거나 문자 남겨주세요</option>
                </select>
            </div>

            <h3 style="margin-top: 50px; margin-bottom: 5px;">주문상품</h3>
            <hr style="width: 95%; margin-top: 8px;">

            <div class="d-flex justify-content-between" style="margin-top: 50px; width: 95%;">
                <h3>포인트</h3>
                <div style="line-height: 40px; color: rgb(117, 117, 117); font-size: 15px;">사용 가능한 포인트가 없습니다</div>
            </div>
            <hr style="width: 95%; margin-top: 8px;">
            <div class="d-flex">
                <input type="text" class="form-control" name="pointCost" id="pointCost" style="width: 30%; margin-right: 10px;" placeholder="0">
                <input type="button" class="pointAll" value="전액사용" style="width: 15%;">
            </div>
            <div style="margin-top: 10px;">사용가능 포인트
                <span class="usePointValue">0 P</span>
            </div>
        </div>

        <div class="right_re mt-5">
            <div class="right_re1">
                <div>
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
                </div>
                <hr style="width: 100%; margin: 30px auto 0 auto;">
                <div>
                    <div>아래 내용에 모두 동의합니다</div>
                </div>
            </div>
        </div>
	</section>
	
	<c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/store/order.js"></script>
</body>
</html>
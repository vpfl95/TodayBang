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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container d-flex justify-content-center">
        <div class="left_re">
            <h3 style="margin-bottom: 50px; font-weight: 700;">주문/결제</h3>
            <h5 style="font-weight: 600;">주문자</h5>
            <hr style="width: 95%; margin-top: 8px;">
            <div class="d-flex" style="height: 38px;">
                <label for="userName">이름</label>
				<input type="text" id="userName" name="userName" class="form-control nonOverlab" style="width: 40%;" value="${member.userName}" readonly>
            </div>

            <div class="d-flex mt-3">
                <label for="email">이메일</label>
                <div id= "email" style="width: 80%;" class="d-flex" data-email="${member.email}">
                    <input type="hidden" name = "email" id="submitEmail">
                    <input type="text"  id="emailFirst" name = "email1" class="form-control nonOverlab" style="width: 50%;" readonly>
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
                <div id= "phoneWrap" class="d-flex" style="width: 40%;" data-phone-number="${member.phone}">
                    <select name="phone1" id="memberPhoneFirst" class="form-control nonOverlab" style="width: 30%; margin-right: 10px;">
                        <option value="010" selected="selected">010</option>
                        <option value="011" >011</option>
                        <option value="070" >070</option>
                    </select>
                    <input type="text"  id="memberPhone" maxlength="8" name = "phone1" class="form-control nonOverlab" placeholder="입력해주세요" style="width: 70%;">
                </div>
            </div>
            <div class="d-flex justify-content-between mt-5" style="width: 95%;">
                <h5 style="font-weight: 600;">배송지</h5>
                <div style="display: none;" id="deliveryJson">${deliveryJson}</div>
                <select class="form-control nonOverlab" id="delivery" style="width: 40%;">
                    <option value="0" disabled selected>내 배송지 가져오기</option>
                    <c:forEach items="${deliveryDTOs}" var="dto">
                    	<option value="${dto.addressNum}">${dto.deliveryName}</option>
                    </c:forEach>
                </select>
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
                    <input type="text"  id="phoneLast" maxlength="9" name = "phone1" class="form-control nonOverlab" placeholder="입력해주세요" style="width: 70%;">
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
            <input type="hidden" id="productNum" value="${detail.productNum}">
            <input type="hidden" id="productName" value="${detail.productName}">
            <h5 style="margin-top: 50px; font-weight: 600;">주문상품</h5>
            <c:forEach items="${list}" var="dto">
            	<div class="d-flex" style="width: 95%; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; margin: 5px 0;">
                    <div style="width: 10%; margin-right: 10px;">
                        <img src="../../resources/upload/store/product/${detail.productImageDTO.fileName}" style="max-width: 100%;">
                    </div>
                    <div>
                        <input type="hidden" class="optionNum" value="${dto.optionNum}">
                        <div style="font-size: 15px;">${detail.productName}</div>
                        <div style="font-size: 13px;">옵션 - ${dto.optionName}</div>
                        <div class="d-flex">
                            <div class="price" style="font-weight: 600; font-size: 14px; margin-right: 10px;">${dto.optionPrice * dto.optionCount}원</div>
                            <div class="optionCount" style="font-size: 13px;" data-option-count="${dto.optionCount}">| ${dto.optionCount}개</div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <input type="hidden" id="result" value="${result}">
            <c:if test="${result eq 0}">
            	<div class="d-flex" style="width: 95%; box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px; margin: 5px 0;">
                    <div style="width: 10%; margin-right: 10px;">
                        <img src="../../resources/upload/store/product/${detail.productImageDTO.fileName}" style="max-width: 100%;">
                    </div>
                    <div>
                        <div style="font-size: 15px;">${detail.productName}</div>
                        <div class="d-flex">
                            <div class="price" style="font-weight: 600; font-size: 14px; margin-right: 10px;">${price * productCount}원</div>
                            <div id="productCount" style="font-size: 13px;" data-product-count="${productCount}">| ${productCount}개</div>
                        </div>
                    </div>
                </div>
            </c:if>
            <hr style="width: 95%; margin-top: 8px;">

            <div class="d-flex justify-content-between" style="margin-top: 50px; width: 95%;">
                <h5 style="font-weight: 600; margin: 10px 0 0 0;">포인트</h5>
                <c:if test="${mileage eq 0}">
                	<div style="line-height: 40px; color: rgb(117, 117, 117); font-size: 15px;">사용 가능한 포인트가 없습니다</div>
                </c:if>
            </div>
            <hr style="width: 95%; margin-top: 8px;">
            <div class="d-flex">
                <input type="number" class="form-control" name="pointCost" id="pointCost" style="width: 30%; margin-right: 10px;" placeholder="0">
                <input type="button" id="pointAll" value="전액사용" style="width: 15%;">
            </div>
            <div style="margin-top: 10px;">사용가능 포인트
                <span class="usePointValue">${mileage} P</span>
            </div>
        </div>

        <div class="right_re mt-5">
            <div class="right_re1">
                <div class="right_re1_re1">
                    <div>
                        <h5 class="mt-3" style="font-weight: 600;">결제금액</h5>
                        <div class="d-flex justify-content-between mt-4">
                            <div style="font-size: 15px;">총 상품 금액</div>
                            <div><span class="price1 price">${totalPrice}</span>원</div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div style="font-size: 15px;">배송비</div>
                            <div><span class="deliFee">${detail.deliFee}</span>원</div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div style="font-size: 15px;">포인트 사용</div>
                            <div><span class="usePoint">0</span>P</div>
                        </div>
                        <hr style="width: 90%; margin: 30px auto 0 auto;">
        
                        <div class="d-flex justify-content-between mt-4">
                            <div style="font-weight: 600; font-size: 20px;">최종 결제 금액</div>
                            <div style="font-weight: 600; font-size: 20px;"><span class="totalPrice price" style="color: #35c5f0;">${totalPrice + detail.deliFee}</span> 원</div>
                        </div>
                        <div style="font-size: 14px; text-align: right; margin-top: 5px;"><span id="getPoint" style="font-weight: 600;" data-point="${(totalPrice + detail.deliFee)*0.001}"></span> 적립 예정</div>
                    </div>
                    <hr style="width: 100%; margin: 30px auto 0 auto;">
                    <div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" value="" id="orderAllCheck">
                            <button class="form-check-all">아래 내용에 모두 동의합니다. (필수)</button>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input orderCheck" type="checkbox" value="" id="orderCheck1">
                            <button class="form-check-button" id="termsAgree1">개인정보 수집 이용 및 제 3자 제공 동의 (필수)
                                <svg fill="none" viewBox="0 0 16 10" preserveAspectRatio="xMidYMid meet" class="terms-expand">
                                    <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="form-check mb-2 termSub1" id="termsAgree1_1" style="display: none;">
                            <input class="form-check-input orderCheck orderCheckSub" type="checkbox" value="" id="flexCheckDefault3">
                            <span style="font-size: 13px;">개인정보 제 3자 제공</span>
                            <button class="btnView" id="termsView1" style="float: right; line-height: 24px;" data-bs-toggle="modal" data-bs-target="#terms1">약관보기
                                <svg class="icon" fill="none" viewBox="0 0 16 10" preserveAspectRatio="xMidYMid meet">
                                    <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="form-check mb-2 termSub1" id="termsAgree1_2" style="display: none;">
                            <input class="form-check-input orderCheck orderCheckSub" type="checkbox" value="" id="flexCheckDefault4">
                            <span style="font-size: 13px;">개인정보 수집 및 이용</span>
                            <button class="btnView" id="termsView2" style="float: right; line-height: 24px;" data-bs-toggle="modal" data-bs-target="#terms2">약관보기
                                <svg class="icon" fill="none" viewBox="0 0 16 10" preserveAspectRatio="xMidYMid meet">
                                    <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input orderCheck" type="checkbox" value="" id="flexCheckDefault3">
                            <button class="form-check-button" id="termsAgree2">결제대행 서비스 이용약관 동의 (필수)
                                <svg fill="none" viewBox="0 0 16 10" preserveAspectRatio="xMidYMid meet" class="terms-expand">
                                    <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="form-check mb-2 termSub2" id="termsAgree2_1" style="display: none;">
                            <span style="font-size: 13px;">kg이니시스</span>
                            <button class="btnView" id="termsView3" style="float: right; line-height: 24px;" data-bs-toggle="modal" data-bs-target="#terms3">약관보기
                                <svg class="icon" fill="none" viewBox="0 0 16 10" preserveAspectRatio="xMidYMid meet">
                                    <path d="M1.75.833L8 6.873l6.25-6.04L15.5 1.98 8 9.167.5 1.98 1.75.833z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="terms1 mt-2">
                            본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.
                            <div class="terms2 mt-2">
                                (우리팀이름)는 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다 
                                (단, (우리팀이름)가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다).
                            </div>
                        </div>
                    </div>
                </div>

                <button class="btnPay mt-4" id="btnPay">
                    <span class="totalPrice price">${totalPrice + detail.deliFee}</span>원 결제하기
                </button>
            </div>
        </div>
        
        <!-- terms1 Modal -->
        <div class="modal fade" id="terms1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">개인정보 제 3자 제공</h1>
                </div>
                <div class="modal-body">
                    <div class="contents">
                        개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 서비스 이용이 제한될 수 있습니다.
                        일부 상품은 대행업체를 통해서 조립/설치 서비스를 제공합니다. 만약 해당상품에 대해서 조립/설치 신청(조립/설치 옵션에 체크하는 등)을 하신 경우,
                        아래와 같이 설치 대행업체에 개인정보가 추가 제공됩니다. 동의 거부시에는 조립/설치 서비스를 제공하지 않습니다.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
            </div>
        </div>

        <!-- terms2 Modal -->
        <div class="modal fade" id="terms2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">개인정보 수집 및 이용</h1>
                </div>
                <div class="modal-body">
                    <div class="contents">
                        (우리팀이름)는 원활한 서비스제공을 위해 최소한의 범위내에서 아래와 같이 개인정보를 수집, 이용합니다.
                        개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 서비스 이용이 제한될 수 있습니다.
                        그 밖의 사항은 (우리팀이름) 개인정보처리방침에 따릅니다.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
            </div>
        </div>

        <!-- terms3 Modal -->
        <div class="modal fade" id="terms3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">결제대행 서비스 이용약관 동의</h1>
                </div>
                <div class="modal-body">
                    <div class="contents">
                        주식회사 케이지이니시스(이하 “회사”)는 전자지급결제대행을 주목적으로 하는 기업으로서 이용자의 개인정보를 중요시하며,
                        전자금융거래법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률, 전기통신사업법,
                        개인정보보호법 등에 관한 법률 및 행정기관의 행정지침을 준수하고, 관련 법령에 의거한 개인정보 처리방침을 정하여
                        이용자 권익을 보호하고 있습니다.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
            </div>
        </div>
	</section>
	
	<c:import url="../../template/footer.jsp"></c:import>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/store/order.js"></script>
    <script>
        setMain();
    </script>
</body>
</html>
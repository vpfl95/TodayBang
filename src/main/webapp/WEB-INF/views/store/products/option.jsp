<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .additionalItem {
        background-color: #f5f5f5;
        padding: 0 5px;
    }

    .optionPrice {
        font-size: 20px;
        margin-top: 7px;
    }

    .sellingOption {
        font-size: 16px;
    }

    .totalPrice {
        font-size: 20px;
    }
</style>
</head>
<body>
    <c:if test="${dto.productOptionDTOs.size() ne 0}">
		<div>
            <select class="form-select option1" aria-label="Default select example">
                <c:forEach items="${dto.productOptionDTOs}" var="dto">
                	<c:if test="${dto.optionDiv eq 1}">
                		<c:choose>
	                		<c:when test="${dto.optionPrice < 0}">
	                			<option class="option1_op" value="${dto.optionNum}" data-option-price="${dto.optionPrice}">${dto.optionName}</option>
	                		</c:when>
	                		<c:otherwise>
	                			<option class="option1_op" value="${dto.optionNum}">${dto.optionName} (${dto.optionPrice}원)</option>
	                		</c:otherwise>
	                	</c:choose>
                	</c:if>
                </c:forEach>
            </select>
            <c:if test="${op2 eq 1}">
	            <select class="form-select option2" aria-label="Default select example">
	                <c:forEach items="${dto.productOptionDTOs}" var="dto">
	                	<c:if test="${dto.optionDiv eq 2}">
	                		<c:choose>
		                		<c:when test="${dto.optionPrice < 0}">
		                			<option class="option2_op" value="${dto.optionNum}" data-option-price="${dto.optionPrice}">${dto.optionName}</option>
		                		</c:when>
		                		<c:otherwise>
		                			<option class="option2_op" value="${dto.optionNum}">${dto.optionName} (${dto.optionPrice}원)</option>
		                		</c:otherwise>
		                	</c:choose>
	                	</c:if>
	                </c:forEach>
	            </select>
            </c:if>
            <c:if test="${op3 eq 1}">
	            <select class="form-select option3" aria-label="Default select example">
	                <c:forEach items="${dto.productOptionDTOs}" var="dto">
	                	<c:if test="${dto.optionDiv eq 3}">
	                		<c:choose>
		                		<c:when test="${dto.optionPrice < 0}">
		                			<option class="option3_op" value="${dto.optionNum}" data-option-price="${dto.optionPrice}">${dto.optionName}</option>
		                		</c:when>
		                		<c:otherwise>
		                			<option class="option3_op" value="${dto.optionNum}">${dto.optionName} (${dto.optionPrice}원)</option>
		                		</c:otherwise>
		                	</c:choose>
	                	</c:if>
	                </c:forEach>
	            </select>
            </c:if>
        </div>
    </c:if>
    
    <form action="/member/checkout" method="post" id="frmCheckout">
        <input type="hidden" name="productNum" class="frmProductNum">
        <div class="items">
            <c:forEach items="${options}" var="option">
                <div class="additionalItem mt-2">
                    <div class="d-flex justify-content-between">
                        <input type="hidden" value="${option.optionName}" name="optionName">
                        <div class="sellingOption">${option.optionName}</div>
                        <div class="deleteOption" data-delete-opnum="${option.optionNum}">❌</div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <input type="hidden" value="${option.optionPrice}" name="optionPrice">
                        <input type="hidden" value="1" name="optionCount">
                        <div style="width: 30%;">
                            <select class="form-select sellingOptionControll-${option.optionNum}" data-option-price="${option.optionPrice}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                        <div class="optionPrice">${option.optionPrice}원</div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${result eq 0}">
                <div class="additionalItem mt-2">
                    <input type="hidden" value="${dto.productNum}" name="optionName">
                    <div class="sellingOption">${dto.productNum}</div>
                        <div class="d-flex justify-content-between">
                            <input type="hidden" value="${price}" name="optionPrice">
                            <input type="hidden" value="1" name="optionCount">
                            <div style="width: 30%;">
                                <select class="form-select sellingOptionControll" data-option-price="${price}">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        <div class="optionPrice">${price}원</div>
                    </div>
                </div>
            </c:if>

            <div class="mt-3 d-flex justify-content-between">
                <span><b>주문금액</b></span>
                <input class="totalPrice" type="hidden" value="${totalPrice}" name="totalPrice">
                <span class="totalPrice">${totalPrice}원</span>
            </div>
        </div>
        <div class="d-flex justify-content-between mt-3">
            <button type="button" class="cart btn btn-outline-secondary" style="width: 48%;">장바구니</button>
            <button type="button" class="buy btn btn-primary" style="width: 48%;">바로구매</button>
        </div>
    </form>
</body>
</html>
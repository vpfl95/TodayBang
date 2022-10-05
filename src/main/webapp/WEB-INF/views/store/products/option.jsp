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
</style>
</head>
<body>
    <c:if test="${dto.option1DTOs.size() ne 0}">
		<div>
            <select id="option1" class="form-select" aria-label="Default select example">
                <c:forEach items="${dto.option1DTOs}" var="dto">
                	<c:choose>
                		<c:when test="${dto.optionPrice < 0}">
                			<option value="${dto.num}">${dto.optionName}</option>
                		</c:when>
                		<c:otherwise>
                			<option value="${dto.num}">${dto.optionName} (${dto.optionPrice}원)</option>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
            </select>
        </div>
    </c:if>
    <c:if test="${dto.option2DTOs.size() ne 0}">
	    <div>
            <select id="option2" class="form-select" aria-label="Default select example">
				<c:forEach items="${dto.option2DTOs}" var="dto">
                	<c:choose>
                		<c:when test="${dto.optionPrice < 0}">
                			<option value="${dto.num}">${dto.optionName}</option>
                		</c:when>
                		<c:otherwise>
                			<option value="${dto.num}">${dto.optionName} (${dto.optionPrice}원)</option>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
            </select>
        </div>
    </c:if>
    <c:if test="${dto.option3DTOs.size() ne 0}">
	    <div>
            <select id="option3" class="form-select" aria-label="Default select example">
				<c:forEach items="${dto.option3DTOs}" var="dto">
                	<c:choose>
                		<c:when test="${dto.optionPrice < 0}">
                			<option value="${dto.num}">${dto.optionName}</option>
                		</c:when>
                		<c:otherwise>
                			<option value="${dto.num}">${dto.optionName} (${dto.optionPrice}원)</option>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
            </select>
        </div>
    </c:if>

    <div class="items">
        <c:if test="${result eq 0}">
        	<div class="additionalItem mt-2">
            <div class="sellingOption">${dto.productNum}</div>
            <div class="d-flex justify-content-between">
                <div style="width: 30%;">
                    <select class="form-select sellingOptionControll">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div class="optionPrice">${price}원</div>
            </div>
        </div>
        </c:if>

    </div>
    <div class="mt-3 d-flex justify-content-between">
        <span><b>주문금액</b></span>
        <span class="totalPrice"></span>
    </div>
    <div class="d-flex justify-content-between mt-3">
        <button class="btn btn-outline-secondary" id="cart" style="width: 48%;">장바구니</button>
        <button class="btn btn-primary" id="buy" style="width: 48%;">바로구매</button>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카테고리 | 오늘의 직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/category.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <div class="tier1" data-cate-num="${categoryDTO.categoryNum}">${categoryDTO.categoryName}</div>
    <c:forEach items="${cateDetail}" var="cate">
    	<c:if test="${cate.tier eq 2}">
    		<div class="d-flex justify-content-between">
                <div class="tier2" data-cate-num="${cate.categoryNum}">${cate.categoryName}</div>
                <svg class="tier2_expand" width="12" height="12" fill="currentColor" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet" data-cate-num="${cate.categoryNum}">
                    <path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path>
                </svg>
            </div>
            <div class="tier3Wrap" style="display: none;">
                <c:forEach items="${cateDetail}" var="cate1">
                	<c:if test="${cate1.categoryRef eq cate.categoryNum}">
                		<c:choose>
                			<c:when test="${param.category eq cate1.categoryNum}">
                				<div class="tier3 selectedCate" data-cate-num="${cate1.categoryNum}">${cate1.categoryName}</div>
                			</c:when>
                			<c:otherwise>
                				<div class="tier3" data-cate-num="${cate1.categoryNum}">${cate1.categoryName}</div>
                			</c:otherwise>
                		</c:choose>
                	</c:if>
                </c:forEach>
            </div>
    	</c:if>
    </c:forEach>
    <hr class="tier_hr">
    <c:forEach items="${tier1}" var="t">
        <c:if test="${t.categoryNum ne param.category}">
	    	<div class="tier1" data-cate-num="${t.categoryNum}">${t.categoryName}</div>
        </c:if>
    </c:forEach>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
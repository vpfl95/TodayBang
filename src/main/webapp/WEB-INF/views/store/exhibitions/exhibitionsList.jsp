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
    <c:forEach items="${list}" var="dto">
    	<div class="container-fluid">
            <img src="../../resources/upload/store/product/${dto.productImageDTOs[0].fileName}" alt="">
        </div>
    </c:forEach>
</body>
</html>
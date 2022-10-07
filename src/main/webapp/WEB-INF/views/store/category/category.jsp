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
    <c:import url="../../template/header.jsp"></c:import>

    ${jsonList}
    <section class="container main">
        <div style="margin: 40px 40px 0 40px; height: 1000px;">
            <div class="d-flex justify-content-between" style="height: 100%;">
                <div style="width: 20%;" id="categorySide">
                    
                </div>
                <div style="height: 100%; width: 80%;">
                    <div id="categoryLink" class="d-flex">
                        <div id="cate1"></div>
                        <div id="cate1_1"> > </div>
                        <div id="cate2"></div>
                        <div id="cate2_1"> > </div>
                        <div id="cate3"></div>
                    </div>
                    <div id="categoryItem"></div>
                </div>
            </div>
        </div>
    </section>

    <c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <script src="/resources/js/store/category.js"></script>
    <script>
        setCategorySide();
        getList('${param.category}');
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CategoryName | 오늘의 직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/category.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

    <section class="container main">
        <div style="margin: 40px 40px 0 40px; height: 1000px;">
            <div class="d-flex justify-content-between" style="height: 100%;">
                <div style="width: 30%;">
                    <div class="category">
                        <h3><a href="#">가구</a></h3>
                    </div>

                    <ul class="category-tree">

                    </ul>
                    <ul class="category-list-others">

                    </ul>
                </div>
                <div style="border: solid 1px red; height: 100%; width: 70%;">

                </div>
            </div>
        </div>
    </section>

    <c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[1+1 행사중] 수납&생활용품 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <!-- 1+1수납 -->
    <c:import url="../../template/header.jsp"></c:import>

    <section class="container mt-5 main">
        <div class="right_re mt-5">
            <div class="right_re1">
                <p>옷 정리, 욕실 청소까지 맡겨주세요!</p>
                <h5><b>[1+1 행사중] 수납&생활용품</b></h5>
                <hr>
                <div class="d-flex justify-content-between c_btn">
                    <button>📌7509</button>
                    <button>💡2634</button>
                </div>
                <div class="d-grid gap-2 col-12 mx-auto mt-4">
                    <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                </div>
            </div>
        </div>
        <div class="left_re mt-5" style="margin-left: 70px;">
            <img src="/resources/images/store/exhibitions/ex1552/caseMain.gif" alt="">
          
            <div id="productList" data-ex-code="${exhibitionDTO.exhibitionCode}">
                <!-- 상품 리스트 자리-->
            </div>
        </div>
    </section>

    <c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
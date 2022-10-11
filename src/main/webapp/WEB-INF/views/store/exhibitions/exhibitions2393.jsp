<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[빠른배송] 오트밀하우스 ~82% 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <!-- 오트밀하우스 -->
    <c:import url="../../template/header.jsp"></c:import>

    <section class="container mt-5 main">
        <div class="right_re mt-5">
            <div class="right_re1">
                <p>일상에 영감을 주는 가구</p>
                <h5><b>[빠른배송] 오트밀하우스 ~82%</b></h5>
                <hr>
                <div class="d-grid gap-2 col-12 mx-auto mt-4">
                    <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                </div>
            </div>
        </div>
        <div class="left_re mt-5" style="margin-left: 70px;">
            <div style="position: relative;">
                <img src="/resources/images/store/exhibitions/ex2394/exclusive.jpg" style="z-index: 1;">
                <div style="position: absolute; left: 30%; top: 20%; z-index: 2; font-size: 20px;"><b>오늘의직방 익스클루시브</b></div>
            </div>
            <div class="oneThird d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2393/oatFocus.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/just.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/fastDeli.png" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2393/oatMain.gif" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/oatAbout.jpg" alt="">
            <div class="oneThird d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2393/tommyFocus.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/alvin.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/mlily.jpg" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2393/tommyMain.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/tommyPoint.jpg" alt="">
            <div class="oneHalf d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2393/tommyItem1.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/tommyItem2.jpg" alt="">
            </div>
            <div class="oneThird d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2393/tommy.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/alvinFocus.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/mlily.jpg" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2393/alvinMain.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/alvinPoint.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/alvinItem1.jpg" alt="">
            <div class="oneThird d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2393/tommy.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/alvin.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2393/mlilyFocus.jpg" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2393/mlilyMain.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/mlilyPoint.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2393/mlilyItem1.jpg" alt="">

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
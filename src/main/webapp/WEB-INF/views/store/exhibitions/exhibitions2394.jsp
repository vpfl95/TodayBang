<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[빠른배송] 저스트슬립 ~49% 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <!-- 저스트슬립 -->
    <c:import url="../../template/header.jsp"></c:import>

    <section class="container mt-5 main">
        <div class="right_re mt-5">
            <div class="right_re1">
                <p>완벽한 숙면을 위한 매트리스</p>
                <h5><b>[빠른배송] 저스트슬립 ~49%</b></h5>
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
            <div style="position: relative;">
                <img src="/resources/images/store/exhibitions/ex2394/exclusive.jpg" style="z-index: 1;">
                <div style="position: absolute; left: 30%; top: 20%; z-index: 2; font-size: 20px;"><b>오늘의직방 익스클루시브</b></div>
            </div>
            <div class="oneThird d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2394/justFocus.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2394/oat.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2394/fastDeli.png" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2394/justMain.gif" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/justAbout.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/exclusive.jpg">
            <div class="oneHalf d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2394/airFocus.webp" alt="">
                <img src="/resources/images/store/exhibitions/ex2394/deep.webp" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2394/airMain.webp" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/airPoint.webp" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/airItem1.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/airItem2.jpg" alt="">
            <div class="oneHalf d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2394/air.jpg" alt="">
                <img src="/resources/images/store/exhibitions/ex2394/deepFocus.jpg" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2394/deepMain.webp" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/deepPoint.webp" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/deepItem1.webp" alt="">
            <img src="/resources/images/store/exhibitions/ex2394/deepItem2.webp" alt="">

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
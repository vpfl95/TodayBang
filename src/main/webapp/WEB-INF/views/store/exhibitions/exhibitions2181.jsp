<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오직 여기서만, O!Goods 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <!-- 오굿즈 -->
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container mt-5">
        <div class="right_re mt-5">
            <div class="right_re1">
                <p>오늘의집 큐레이션 편집샵 오!굿즈</p>
                <h5><b>오직 여기서만, O!Goods</b></h5>
                <hr>
                <div class="d-flex justify-content-between c_btn"><button>📌0</button><button>💡2</button></div>
                <div class="d-grid gap-2 col-12 mx-auto mt-4">
                    <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                </div>
            </div>
        </div>

        <div class="left_re mt-5" style="margin-left: 70px;">
            <img src="/resources/images/store/exhibitions/ex2181/mainPage.gif" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/main2.png" alt="">
            <div class="oneHalf d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2181/bestFocus.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2181/interior.png" alt="">
            </div>
            <img src="/resources/images/store/exhibitions/ex2181/weekItem1.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/weekItem2.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/weekItem3.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/weekItem4.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/weekItem5.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/weekItem6.png" alt="">

            <div class="oneHalf d-flex justify-content-center">
                <img src="/resources/images/store/exhibitions/ex2181/best.png" alt="">
                <img src="/resources/images/store/exhibitions/ex2181/interiorFocus.png" alt="">
            </div>

            <img src="/resources/images/store/exhibitions/ex2181/interiorTip.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/interiorItem1.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/interiorItem2.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/interiorItem3.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/interiorItem4.jpg" alt="">

            <img src="/resources/images/store/exhibitions/ex2181/colorPoint.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/colorItem1.jpg" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/colorItem2.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/colorItem3.png" alt="">
            <img src="/resources/images/store/exhibitions/ex2181/colorItem4.png" alt="">

            <div id="productList" data-ex-code="${exhibitionDTO.exhibitionCode}">
                <!-- 상품 리스트 자리-->
            </div>
        </div>
	</section>
	

	<c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/store/exhibitionsDetail.js"></script>
    <script>
        getList();
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <!-- 삼성 -->
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
		<div class = "row justify-content-center mt-5">
			<div class = "col-lg-9">
                <div class="right_re mt-5">
                    <div class="right_re1">
                        <p>비스포크 인기가전 한정 특가!</p>
                        <h5><b>삼성전자 슈퍼세일</b></h5>
                        <hr>
                        <div class="d-flex justify-content-between c_btn"><button>📌0</button><button>💡2</button></div>
                        <div class="d-grid gap-2 col-12 mx-auto mt-4">
                            <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                        </div>
                    </div>
                </div>

                <div class="left_re mt-5" style="margin-left: 70px;">
                    <img src="/resources/images/store/exhibitions/ex2689/mainPage.png" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/main2.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/event.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/event2.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/tuto.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/main3.jpg" alt="">

                    <div class="oneQuarter d-flex justify-content-center">
                        <img src="/resources/images/store/exhibitions/ex2689/hotDealFocus.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/liv.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/kit.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/dress.png" alt="">
                    </div>

                    <img src="/resources/images/store/exhibitions/ex2689/hotDealMain.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/samsungItem1.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/samsungItem2.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/samsungItem3.jpg" alt="">
                    <img src="/resources/images/store/exhibitions/ex2689/samsungItem4.jpg" alt="">

                    <div class="oneQuarter d-flex justify-content-center">
                        <img src="/resources/images/store/exhibitions/ex2689/hotDeal.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/livFocus.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/kit.png" alt="">
                        <img src="/resources/images/store/exhibitions/ex2689/dress.png" alt="">
                    </div>
                    <img src="/resources/images/store/exhibitions/ex2689/livMain.jpg" alt="">
                </div>
			</div>
		</div>
	</section>
	

	<c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
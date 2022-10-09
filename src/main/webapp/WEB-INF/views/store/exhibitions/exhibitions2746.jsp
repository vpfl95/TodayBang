<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>딩동- 입점했어요! 이번주 신규 브랜드 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container mt-5">
        <div class="right_re mt-5">
            <div class="right_re1">
                <p>론칭기념 일주일간 단독 특가 ~10/16</p>
                <h5><b>딩동- 입점했어요! 이번주 신규 브랜드</b></h5>
                <hr>
                <div class="d-flex justify-content-between c_btn"><button>📌0</button><button>💡2</button></div>
                <div class="d-grid gap-2 col-12 mx-auto mt-4">
                    <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                </div>
            </div>
        </div>

        <div class="left_re mt-5" style="margin-left: 70px;">
            <img src="/resources/images/store/exhibitions/ex2746/newLineMain.webp" alt="">
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
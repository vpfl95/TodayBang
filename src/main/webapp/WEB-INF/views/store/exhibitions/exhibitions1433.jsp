<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빠른 품절! 리퍼마켓 ~85% 특별 기획전 | 예쁜 템들 모여사는 오늘의 직방 스토어</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/store/exhibitionsDetail.css">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
  <!-- 리퍼마켓 -->
  <c:import url="../../template/header.jsp"></c:import>

    <section class="container mt-5" style="text-align: center;">

        <div class="right_re mt-5">
            <div class="right_re1">
                <p>전시,반품,스크래치 득템의 기회!</p>
                <h5><b>빠른품절! 리퍼마켓 ~85%</b></h5>
                <hr>
                <div class="d-flex justify-content-between c_btn"><button>📌118,325</button><button>💡52,246</button></div>
                <div class="d-grid gap-2 col-12 mx-auto mt-4">
                    <button class="btn btn-info" type="button" style="color: white;">판매상품 목록보기</button>
                </div>
            </div>
        </div>
        <div class="left_re mt-5" style="margin-left: 70px;">
          <img src="/resources/images/store/exhibitions/ex1433/refurMain.gif" alt="">
          <div class="row refurKind d-flex justify-content-center">
            <img src="/resources/images/store/exhibitions/ex1433/refurBest.jpg" alt="" style="width: 30%; padding: 0 0 0 12px;">
            <img src="/resources/images/store/exhibitions/ex1433/refurBrand.jpg" alt="" style="width: 20%; padding: 0;">
            <img src="/resources/images/store/exhibitions/ex1433/refurCategory.jpg" alt="" style="width: 20%; padding: 0;">
            <img src="/resources/images/store/exhibitions/ex1433/refurGetItem.jpg" alt="" style="width: 30%; padding: 0 12px 0 0;">
          </div>
          <div class="bestRecom">
            <img src="/resources/images/store/exhibitions/ex1433/bestRecom.jpg" alt="">
            <div class="d-flex justify-content-center oneThird" style="height: auto;">
              <img src="/resources/images/store/exhibitions/ex1433/best1.jpg" alt="" style="width: 34%;">
              <img src="/resources/images/store/exhibitions/ex1433/best2.jpg" alt="">
              <img src="/resources/images/store/exhibitions/ex1433/best3.jpg" alt="">
            </div>
            <div class="d-flex justify-content-center oneThird" style="height: auto;">
              <img src="/resources/images/store/exhibitions/ex1433/best4.jpg" alt="" style="width: 34%;">
              <img src="/resources/images/store/exhibitions/ex1433/best5.jpg" alt="">
              <img src="/resources/images/store/exhibitions/ex1433/best6.jpg" alt="">
            </div>
            <img class="mt-5" src="/resources/images/store/exhibitions/ex1433/moreItem.jpg" alt="">
          </div>

          <div class="brandRecom">
            <img src="/resources/images/store/exhibitions/ex1433/brandRecom.jpg" alt="" style="z-index: 2;">

            <div class="oneHalf d-flex justify-content-between" style="z-index: 6;">
              <img src="/resources/images/store/exhibitions/ex1433/refurSamsung.jpg" alt="">
              <img src="/resources/images/store/exhibitions/ex1433/refurLG.jpg" alt="">
            </div>
          </div>

          <div class="categoryRecom mt-5">
            <img src="/resources/images/store/exhibitions/ex1433/categoryRecom.jpg" alt="">
            <div class="categoryRecom-cate d-flex justify-content-between">
              <img src="/resources/images/store/exhibitions/ex1433/refurHomeAppliances.jpg" alt=""  style="width: 27%;">
              <img src="/resources/images/store/exhibitions/ex1433/refurBedroomFurniture.jpg" alt="" style="width: 23%;">
              <img src="/resources/images/store/exhibitions/ex1433/refurLivingroomFurniture.jpg" alt="" style="width: 23%;">
              <img src="/resources/images/store/exhibitions/ex1433/refurFabric.jpg" alt="" style="width: 27%;">
            </div>
            <img src="/resources/images/store/exhibitions/ex1433/bridge.jpg" alt="">
          </div>

          <img src="/resources/images/store/exhibitions/ex1433/refurOgoods.jpg" alt="" class="mt-3">

          <div class="exDetail d-flex justify-content-between">
            <div><b>전체</b></div>
            <div><b>가전</b></div>
            <div><b>침실</b></div>
            <div><b>거실</b></div>
            <div><b>패브릭</b></div>
          </div>

          <img src="/resources/images/store/exhibitions/ex1433/fastSoldOut.jpg" alt="" class="mt-3">
        </div>
        
        <!--PageNation-->
        <div class="paging">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <a class="page-link text-success" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
                <li class="page-item"><a class="page-link text-success" href="#">2</a></li>
                <li class="page-item"><a class="page-link text-success" href="#">3</a></li>
                <li class="page-item"><a class="page-link text-success" href="#">4</a></li>
                <li class="page-item"><a class="page-link text-success" href="#">5</a></li>
                <li class="page-item">
                  <a class="page-link text-success" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>

    </section>

    <c:import url="../../template/footer.jsp"></c:import>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
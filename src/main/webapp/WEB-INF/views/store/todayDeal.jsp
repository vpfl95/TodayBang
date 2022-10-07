<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매일 자정마다 새로운 특가 상품 '오늘의 딜'</title>
    <link rel="stylesheet" href="/resources/css/store/todayDeal.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
  <c:import url="../template/header.jsp"></c:import>

    <section class="container">
        <div class="todayDealText">
            <h2><b>오늘의 딜</b></h2>
            <p style="color: gray;">매일 자정, 새로운 특가상품</p>
        </div>

        <div class="popularItem" style="height: 1100px;">
            <div class="todayDealImg" style="height: 343px;">
                <div class="d-flex justify-content-center center_menu">
                    <div>
                        <div class="center_menu_img">이미지</div>
                        <div>
                            글
                        </div>
                    </div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
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

    <c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>
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
    <link href="/resources/css/store/detailProduct.css" rel="stylesheet">
	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container" id="section" style="margin-top: 100px; width: 80%;">
        <div id="jsonList" style="display: none;">${jsonList}</div>
        <div id="categoryLink" class="d-flex">
            <div id="cate1"></div>
            <div id="cate2"></div>
            <div id="cate3"></div>
        </div>
        <div class="d-flex justify-content-center itemWrap">
            <div class="left_re" style="width: 60%;">
                <div class="d-flex justify-content-center" style="height: 100%;">
                    <div style="width: 10%;">
                        <ul class="productImageList">
                            <!-- 리스트 자리 -->
                        </ul>
                    </div>
                    <div style="width: 90%;">
                        <div>
                            <img id="productImage">
                        </div>
                    </div>
                </div> 
                <div>

                </div>
            </div>

            <div class="right_re" style="width: 40%;">
                <div id="brand"></div>
                <div>
                    <div id="productName"></div>
                </div>
                <div>별점자리</div>
                <div>
                    <div id="saleRate"></div>
                    <div id="price1"></div>
                </div>
                <div id="price2"></div>
                <hr>
                <div id="point"></div>
                <div id="delivery"></div>

                <div id="optionWrap">
                    <div><select id="option1" class="form-select" aria-label="Default select example"></select></div>
                    <div><select id="option2" class="form-select" aria-label="Default select example"></select></div>
                    <div><select id="option3" class="form-select" aria-label="Default select example"></select></div>

                    <div class="items">
                        <div class="additionalItem mt-2">
                            <h5 class="sellingOption"></h5>
                            <div class="d-flex justify-content-between">
                                <div style="width: 30%;">
                                    <select class="form-select sellingOptionControll">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>
                                <div class="price3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3 d-flex justify-content-between">
                        <span><b>주문금액</b></span>
                        <span class="totalPrice"></span>
                    </div>
                    <div class="d-flex justify-content-between mt-3">
                        <button class="btn btn-outline-secondary" id="cart" style="width: 48%;">장바구니</button>
                        <button class="btn btn-primary" id="buy" style="width: 48%;">바로구매</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center selling-nav">
            <div><a href="#productDetailList">상품정보</a></div>
            <div><a href="#review">리뷰</a></div>
            <div>문의</div>
        </div>
        <a name="productDetailList"></a>
        <div class="d-flex justify-content-center">
            <div class="productDetailList" style="width: 70%;"></div>
            <div style="width: 30%;">
                <div class="fixInfo"></div>
            </div>
        </div>
        <a name="review"></a>
        <div class="d-flex justify-content-center selling-nav">
            <div><a href="#productDetailList">상품정보</a></div>
            <div><a href="#review">리뷰</a></div>
            <div>문의</div>
        </div>
	</section>
	

	<c:import url="../../template/footer.jsp"></c:import>
    <script src="/resources/js/store/productDetail.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
        getProductImageCount();
        setProductImage();
        setProductInfo();
        setOption();
        getCategory();
        setItem();
    </script>
</body>
</html>
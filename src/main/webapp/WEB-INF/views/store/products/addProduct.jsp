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
    <link rel="stylesheet" href="/resources/css/store/addProduct.css">
	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
		<div class = "row justify-content-center mt-5">
			<div class = "col-lg-7">
				<form action="add" enctype="multipart/form-data" method="post" id="frmAddProduct">
                    <div class="categoryWrap" style="border: solid red 1px; height: 150px; margin-top: 100px;">
                        <div class="text"><b>Category 설정</b></div>
                        <div class="category" id="category">
                            <span>대분류</span>
                            <select name="category_1" id="cate1">       
                            </select>
                            <span>중분류</span>
                            <select name="category_2" id="cate2">
                        
                            </select>
                            <span>소분류</span>
                            <select name="category_3" id="cate3">
                            </select>
                            <input type="hidden" name="categoryNum" id="categoryNum">
                        </div>
                        <br>
                        <div class="exhibition">
                            <span>기획전</span>
                            <select name="exhibitionCode" id="exhibition">
                                <option value="0">해당사항 없음</option>
                            </select>
                        </div>  
                    </div>
                    <div class="productDetail" style="border: solid red 1px; height: auto;">
                        <div class="text mb-3"><b>상품정보 입력</b></div>
                        <div class="inputWrap">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">상품코드</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon1" name="productNum">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">상품명</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon9" name="productName">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon2">단가</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon2" name="price">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon2">매물</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon8" name="stock">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">할인율</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon3" name="saleRate">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon4">브랜드</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon4" name="brand">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon5">배송예정일</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon5" name="deliDate">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon6">오늘의딜</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon6" name="todayDeal">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon7">배송비</span>
                                <input type="text" class="form-control" aria-describedby="basic-addon7" name="deliFee">
                            </div>
                        </div>
                    </div>
                    <div class="options" style="border: solid red 1px; height: auto;">
                        <div class="text"><b>상세옵션 추가</b></div>
                        <div class="inputWrap">
                            <div class="op1 option">
                                <h4>Option1</h4>
                                <c:forEach begin="0" end="6" var="i">
	                                <div class="input-group">
	                                    <span class="input-group-text" style="width: 35%;">Name and Price</span>
	                                    <input type="text" class="form-control" name="optionName1" style="width: 50%;">
	                                    <input type="text" class="form-control" name="optionPrice1" style="width: 15%;">
	                                </div>
                                </c:forEach>
                            </div>

                            <div class="op2 option">
                                <h4>Option2</h4>
                                <c:forEach begin="0" end="6" var="i">
                                    <div class="input-group">
                                        <span class="input-group-text" style="width: 35%;">Name and Price</span>
                                        <input type="text" class="form-control" name="optionName2" style="width: 50%;">
                                        <input type="text" class="form-control" name="optionPrice2" style="width: 15%;">
                                    </div>
                                </c:forEach>
                                
                            </div>

                            <div class="op3 option">
                                <h4>Option3</h4>
                                <c:forEach begin="0" end="6" var="i">
                                    <div class="input-group">
                                        <span class="input-group-text" style="width: 35%;">Name and Price</span>
                                        <input type="text" class="form-control" name="optionName3" style="width: 50%;">
                                        <input type="text" class="form-control" name="optionPrice3" style="width: 15%;">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="images productImage" style="border: solid red 1px; height: auto;">
                        <div class="text"><b>상품이미지 추가</b></div>
                        <div class="inputWrap">
                            <c:forEach begin="0" end="7" var="i">
                                <div class="input-group mb-3">
                                    <input type="file" class="form-control" name="productImage">
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                    <div class="images productDetail" style="border: solid red 1px; height: auto;">
                        <div class="text"><b>상품 디테일 추가</b></div>
                        <div class="inputWrap">
                            <c:forEach begin="0" end="9" var="i">
                                <div class="input-group mb-3">
                                    <input type="file" class="form-control" name="productDetail">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <button id="btnAddProduct" type="button">제출</button>
                </form>
			</div>
		</div>
	</section>
	

	<c:import url="../../template/footer.jsp"></c:import>
    <script src="/resources/js/store/addProduct.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
        getCategory();
        getExhibition();
    </script>
</body>
</html>
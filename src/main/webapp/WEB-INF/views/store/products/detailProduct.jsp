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
                    <!-- 옵션자리-->
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <div style="width: 70%;">
                <a name="productDetailList"></a>
                <div class="d-flex justify-content-center selling-nav">
                    <div><a class="navigation-item" href="#productDetailList">상품정보</a></div>
                    <div><a class="navigation-item" href="#review">리뷰</a></div>
                    <div><a class="navigation-item" href="#inquiry">문의</a></div>
                </div>
                <div class="productDetailList"></div>

                <!-- 리뷰 페이지 -->
                <a name="review"></a>
                <div class="d-flex justify-content-center selling-nav">
                    <div><a class="navigation-item" href="#productDetailList">상품정보</a></div>
                    <div><a class="navigation-item" href="#review">리뷰</a></div>
                    <div><a class="navigation-item" href="#inquiry">문의</a></div>
                </div>
        
                <div class="d-flex justify-content-between mb-2">
                    <div id="review"><b>리뷰</b></div>
                    <!-- Button trigger modal -->
                    <button type="button" data-bs-toggle="modal" data-bs-target="#reviewModal" id="reviewWriter"><b>리뷰쓰기</b></button>
                </div>
                <div class="reviewList"></div>

                <!-- 문의 페이지-->
                <a name="inquiry"></a>
                <div class="d-flex justify-content-center selling-nav mt-5">
                    <div><a class="navigation-item" href="#productDetailList">상품정보</a></div>
                    <div><a class="navigation-item" href="#review">리뷰</a></div>
                    <div><a class="navigation-item" href="#inquiry">문의</a></div>
                </div>

                <div class="d-flex justify-content-between mb-2 mt-3">
                    <div id="inquiry"><b>문의</b></div>
                    <!-- Button trigger modal -->
                    <button type="button" data-bs-toggle="modal" data-bs-target="#inquiryModal" id="inqueryWriter"><b>문의하기</b></button>
                </div>
                <div class="inqueryList"></div>
            </div>
            <div style="width: 30%;">
                <div class="fixInfo">
                    <!-- 옵션자리 -->
                </div>
            </div>
        </div>
        <!-- Review Modal -->
        <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 100%;">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">리뷰 쓰기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" enctype="multipart/form-data" id="frmUpload">
                            <div class="modal-product d-flex">
                                <img src="" alt="" style="width: 20%;" class="modal-product-image">
                                <div class="modal-product-contents" style="width: 80%;">
                                    <div class="modal-product-contents-brand"></div>
                                    <div class="modal-product-contents-productName"></div>
                                </div>
                            </div>
                            <div class="modal-section">
                                <div class="modal-section-title">별점 평가</div>
                                <div class="field d-flex justify-content-center">
                                <fieldset>
                                    <input class="radio radio1" type="radio" name="rating1" value="5" id="rate1"><label for="rate1">⭐</label>
                                    <input class="radio radio1" type="radio" name="rating1" value="4" id="rate2"><label for="rate2">⭐</label>
                                    <input class="radio radio1" type="radio" name="rating1" value="3" id="rate3"><label for="rate3">⭐</label>
                                    <input class="radio radio1" type="radio" name="rating1" value="2" id="rate4"><label for="rate4">⭐</label>
                                    <input class="radio radio1" type="radio" name="rating1" value="1" id="rate5"><label for="rate5">⭐</label>
                                    <span class="field-text">내구성</span>
                                </fieldset>
                                <fieldset>
                                    <input class="radio radio2" type="radio" name="rating2" value="5" id="rate6"><label for="rate6">⭐</label>
                                    <input class="radio radio2" type="radio" name="rating2" value="4" id="rate7"><label for="rate7">⭐</label>
                                    <input class="radio radio2" type="radio" name="rating2" value="3" id="rate8"><label for="rate8">⭐</label>
                                    <input class="radio radio2" type="radio" name="rating2" value="2" id="rate9"><label for="rate9">⭐</label>
                                    <input class="radio radio2" type="radio" name="rating2" value="1" id="rate10"><label for="rate10">⭐</label>
                                    <span class="field-text">가격</span>
                                </fieldset>
                            </div>
                            <div class="field d-flex justify-content-center">
                                <fieldset>
                                    <input class="radio radio3" type="radio" name="rating3" value="5" id="rate11"><label for="rate11">⭐</label>
                                    <input class="radio radio3" type="radio" name="rating3" value="4" id="rate12"><label for="rate12">⭐</label>
                                    <input class="radio radio3" type="radio" name="rating3" value="3" id="rate13"><label for="rate13">⭐</label>
                                    <input class="radio radio3" type="radio" name="rating3" value="2" id="rate14"><label for="rate14">⭐</label>
                                    <input class="radio radio3" type="radio" name="rating3" value="1" id="rate15"><label for="rate15">⭐</label>
                                    <span class="field-text">디자인</span>
                                </fieldset>
                                <fieldset>
                                    <input class="radio radio4" type="radio" name="rating4" value="5" id="rate16"><label for="rate16">⭐</label>
                                    <input class="radio radio4" type="radio" name="rating4" value="4" id="rate17"><label for="rate17">⭐</label>
                                    <input class="radio radio4" type="radio" name="rating4" value="3" id="rate18"><label for="rate18">⭐</label>
                                    <input class="radio radio4" type="radio" name="rating4" value="2" id="rate19"><label for="rate19">⭐</label>
                                    <input class="radio radio4" type="radio" name="rating4" value="1" id="rate20"><label for="rate20">⭐</label>
                                    <span class="field-text">배송</span>
                                </fieldset>
                            </div>
                        </form>
                        </div>
                        <div class="modal-section">
                            <input type="hidden" value="${member.userId}" id="userId" name="userId">
                            <div id="thumbnail" style="width: 100%;"></div>
                            <div class="modal-section-title">사진 첨부(선택)</div>
                            <div class="modal-section-subTitle">사진을 첨부해주세요.(최대 1장)</div>
                            <input type="file" class="form-control" name="reviewImage" onchange="setThumbnail(event);" id="reviewImage">
                        </div>
                        <div class="modal-section">
                            <div class="modal-section-title">리뷰 작성</div>
                            <textarea name="contents" id="contents" cols="60" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="width: 100%;" id="btnWrite">완료</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inquery Modal -->
        <div class="modal fade" id="inquiryModal" tabindex="-1" aria-labelledby="inquiryModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 100%;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="inquiryModalLabel">상품 문의하기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-section">
                            <div class="modal-section-title">문의내용</div>
                            <textarea name="contents" id="inqueryContents" cols="60" rows="5"></textarea>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-text">
                              <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input" id="chkInquiry">
                              <span style="margin-left: 5px;">비밀글로 문의하기</span>
                            </div>
                          </div>
                        <div class="modal-section">
                            <p>- 문의내용에 대한 답변은 ‘마이페이지 > 나의 쇼핑 > 나의 문의내역’ 또는 ‘상품 상세페이지’에서 확인 가능합니다.</p>
                            <p>- 배송,결제,교환/반품 문의는 고객센터로 문의 바랍니다.</p>
                            <p>- 상품과 관련 없거나 부적합한 내용을 기재하시는 경우, 사전 고지 없이 삭제 또는 차단될 수 있습니다.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="width: 100%;" id="btnInquiry">완료</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inquery Reply Modal -->
        <div class="modal fade" id="inquiryReplyModal" tabindex="-1" aria-labelledby="inquiryReplyModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 100%;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="inquiryReplyModalLabel">문의 답변하기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-section">
                            <div class="modal-section-title">답변내용</div>
                            <textarea name="contents" id="inqueryReplyContents" cols="60" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="width: 100%;" id="btnInquiryReply">완료</button>
                    </div>
                </div>
            </div>
        </div>

        <a href="#top" class="top-button navigation-item">
            <img src="/resources/images/store/topButton.png">
        </a>
	</section>
	

	<c:import url="../../template/footer.jsp"></c:import>
    <script src="/resources/js/store/productDetail.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
        getProductImageCount();
        setProductImage();
        setProductInfo();
        getCategory();
        setModal();
        getReviewList(0);
        getInquiryList();
        setOption();
    </script>
</body>
</html>
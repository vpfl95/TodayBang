const productList = document.querySelector("#productList");
let jsonList;

function getList() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/product/today_list");
    xhttp.send();
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            jsonList = JSON.parse(this.responseText.trim());
            let j=0;
            for(let i=0; i<Math.ceil(jsonList.length/4); i++) {
                let divWrap = document.createElement("div");
                let divWrap_class = document.createAttribute("class");
                divWrap_class.value='imageList d-flex justify-content-between';
                divWrap.setAttributeNode(divWrap_class);
                for(let k=0; k<4; k++) {
                    if(j>=jsonList.length) {
                        continue;
                    }
                    let divProduct = document.createElement("div");
                    let divProduct_class = document.createAttribute("class");
                    divProduct_class.value = 'product';
                    divProduct.setAttributeNode(divProduct_class);

                    let span = document.createElement("span");
                    let span_class = document.createAttribute("class");
                    span_class.value='todayTimer';
                    span.setAttributeNode(span_class);
                    let span_text = document.createTextNode(jsonList[j].todayDeal+'일 남음');
                    span.appendChild(span_text);
                    divProduct.appendChild(span);

                    let thumbnail = document.createElement("img");
                    let thumbnail_src = document.createAttribute("src");
                    thumbnail_src.value="../../resources/upload/store/product/"+jsonList[j].productImageDTO.fileName;
                    thumbnail.setAttributeNode(thumbnail_src);
                    divProduct.appendChild(thumbnail);
                    
                    let divProductDetail = document.createElement("div");
                    let divProductDetail_class = document.createAttribute("class");
                    divProductDetail_class.value='productDetail';
                    divProductDetail.setAttributeNode(divProductDetail_class);
                    // Brand 추가
                    let divBrand = document.createElement("div");
                    let divBrand_class = document.createAttribute("class");
                    divBrand_class.value="brand";
                    divBrand.setAttributeNode(divBrand_class);
                    let divBrand_text = document.createTextNode(jsonList[j].brand);
                    divBrand.appendChild(divBrand_text);
                    divProductDetail.append(divBrand);
                    
                    // 상품명 추가
                    let divProductName = document.createElement("div");
                    let divProductName_class = document.createAttribute("class");
                    divProductName_class.value="productName";
                    divProductName.setAttributeNode(divProductName_class);
                    let divProductName_text = document.createTextNode(jsonList[j].productName);
                    divProductName.appendChild(divProductName_text);
                    divProductDetail.append(divProductName);
                    
                    // 할인율 추가
                    let divPriceWrap = document.createElement("div");
                    let divSaleRate = document.createElement("div");
                    let divSaleRate_class = document.createAttribute("class");
                    divSaleRate_class.value="saleRate";
                    divSaleRate.setAttributeNode(divSaleRate_class);
                    let divSaleRate_text = document.createTextNode(jsonList[j].saleRate + "%");
                    divSaleRate.appendChild(divSaleRate_text);
                    divPriceWrap.appendChild(divSaleRate);

                    // 가격 추가
                    let divPrice = document.createElement("div");
                    let divPrice_class = document.createAttribute("class");
                    divPrice_class.value="price";
                    divPrice.setAttributeNode(divPrice_class);
                    let divPrice_text = document.createTextNode(jsonList[j].price * ((100 - jsonList[j].saleRate)/100));
                    divPrice.appendChild(divPrice_text);
                    divPriceWrap.appendChild(divPrice);
                    divProductDetail.appendChild(divPriceWrap);

                    // 평점 추가
                    let divGradeWrap = document.createElement("div");
                    let divGrade = document.createElement("div");
                    let divGrade_class = document.createAttribute("class");
                    divGrade_class.value="grade";
                    divGrade.setAttributeNode(divGrade_class);
                    let divGrade_text = document.createTextNode(0);
                    divGrade.appendChild(divGrade_text);
                    divGradeWrap.appendChild(divGrade);

                    // 리뷰 수
                    let divReviewNum = document.createElement("div");
                    let divReviewNum_class = document.createAttribute("class");
                    divReviewNum_class.value="reviewNum";
                    divReviewNum.setAttributeNode(divReviewNum_class);
                    let divReviewNum_text = document.createTextNode('리뷰 ' + 0);
                    divReviewNum.appendChild(divReviewNum_text);
                    divGradeWrap.appendChild(divReviewNum);
                    divProductDetail.appendChild(divGradeWrap);

                    // a태그 추가
                    let subA = document.createElement("a");
                    let href = document.createAttribute("href");
                    href.value="../product/detail?productNum="+jsonList[j].productNum;
                    subA.setAttributeNode(href)
                    let subA_class = document.createAttribute("class");
                    subA_class.value='subA';
                    subA.setAttributeNode(subA_class);
                    let subA_data = document.createAttribute("data-product-productnum");
                    subA_data.value=jsonList[j].productNum;
                    subA.setAttributeNode(subA_data);
                    
                    divProduct.appendChild(divProductDetail);
                    divProduct.appendChild(subA);
                    divWrap.appendChild(divProduct);

                    j++;
                }
                productList.append(divWrap);
            }
        }
    }
}
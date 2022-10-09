const categorySide = document.querySelector("#categorySide");
const categoryItem = document.querySelector("#categoryItem");
const cate1 = document.querySelector('#cate1');
const cate1_1 = document.querySelector('#cate1_1');
const cate2 = document.querySelector('#cate2');
const cate2_1 = document.querySelector('#cate2_1');
const cate3 = document.querySelector('#cate3');

let tier1;

function setCategorySide() {
    let query = window.location.search;
    let param = new URLSearchParams(query);
    let category = param.get('category');
    category = category.match(/^[0-9]+/g);
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/category/setSide?category="+category);
    xhttp.send();
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            categorySide.innerHTML = this.responseText.trim();
        }
    }
}

categorySide.onclick=function(event) {
    if(event.target.classList.contains("tier1")) {
        let url = location.href;
        url = url.replace(/category=([0-9]+)(_?)([0-9]*)(_?)([0-9]*)/ig,'');
        url += 'category='+event.target.dataset.cateNum;
        history.pushState(null,null,url);
        setCategorySide();
        getList(event.target.dataset.cateNum);
    }

    if(event.target.classList.contains("tier2")) {
        let url = location.href;
        url = url.replace(/category=([0-9]+)(_?)([0-9]*)(_?)([0-9]*)/ig,'');
        url += 'category='+event.target.dataset.cateNum;
        history.pushState(null,null,url);
        getList(event.target.dataset.cateNum);
    }

    if(event.target.classList.contains("tier2_expand")) {
        let tier3 = event.target.parentNode.nextSibling.nextSibling
        if(event.target.classList.contains("open")) {
            event.target.classList.remove('open');
            tier3.setAttribute("style", 'display:none;');
        } else {
            event.target.classList.add('open');
            tier3.setAttribute("style", '');
        }
    }

    if(event.target.classList.contains("tier3")) {
        let url = location.href;
        url = url.replace(/category=([0-9]+)(_?)([0-9]*)(_?)([0-9]*)/ig,'');
        url += 'category='+event.target.dataset.cateNum;
        history.pushState(null,null,url);
        getList(event.target.dataset.cateNum);
    }
    setExpand();
}

function getList(category) {
    categoryItem.innerHTML='';
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/product/cateItem?category="+category);
    xhttp.send();
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            let jsonList = JSON.parse(this.responseText.trim());
            let j=0;
            for(let i=0; i<Math.ceil(jsonList.length/4); i++) {
                let divWrap = document.createElement("div");
                let divWrap_class = document.createAttribute("class");
                divWrap_class.value='imageList d-flex';
                divWrap.setAttributeNode(divWrap_class);
                for(let k=0; k<4; k++) {
                    if(j>=jsonList.length) {
                        continue;
                    }
                    let divProduct = document.createElement("div");
                    let divProduct_class = document.createAttribute("class");
                    divProduct_class.value = 'product';
                    divProduct.setAttributeNode(divProduct_class);

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
                categoryItem.append(divWrap);
            }
            getCategory();
        }
    }
}

function getCategory() {
    let query = window.location.search;
    let param = new URLSearchParams(query);
    let category = param.get('category');
    cate1.innerHTML='';
    cate2.innerHTML='';
    cate3.innerHTML='';

    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", '/category/get');
    xhttp.send();
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            let categoryList = JSON.parse(this.responseText.trim());
            let cates = category.split('_');
            let ca1 = categoryList.filter(function(element) {
                return element.categoryNum==cates[0];
            })
            let ca2 = categoryList.filter(function(element) {
                return element.categoryNum==cates[0]+'_'+cates[1];
            })
            let ca3 = categoryList.filter(function(element) {
                return element.categoryNum==cates[0]+'_'+cates[1]+'_'+cates[2];
            })
        
            cate1.innerHTML=ca1[0].categoryName;
            if(cates[1] == null) {
                cate1_1.setAttribute("style", 'display:none;');
                cate2_1.setAttribute("style", 'display:none;');
            } else {
                cate1_1.setAttribute("style", '');
                cate2_1.setAttribute("style", '');
            }
            if(cates[2] == null) {
                cate2_1.setAttribute("style", 'display:none;');
            } else {
                cate2_1.setAttribute("style", '');
            }
            if(ca2[0] != null) {
                cate2.innerHTML=ca2[0].categoryName;
            }
            if(ca3[0] != null) {
                cate3.innerHTML=ca3[0].categoryName;
            }
        }
    }
}

function setExpand() {
    console.log($("#categorySide").find('.tier3Wrap'));
}
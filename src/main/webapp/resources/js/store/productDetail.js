const productImageList = document.querySelectorAll('.productImageList');
const productDetailList = document.querySelectorAll('.productDetailList');
const productImage = document.querySelector('#productImage');
const categoryLink = document.querySelector('#categoryLink');
const optionWrap = document.querySelector('#optionWrap');
const section = document.querySelector('#section');
const additionalItem = document.querySelectorAll('.additionalItem');
const fixInfo = document.querySelectorAll('.fixInfo');
const brand = document.querySelector('#brand');
const productName = document.querySelector('#productName');
const saleRate = document.querySelector('#saleRate');
const sellingOption = document.querySelectorAll('.sellingOption');
const sellingOptionControll = document.querySelectorAll('.sellingOptionControll');
const price1 = document.querySelector('#price1');
const price2 = document.querySelector('#price2');
const price3 = document.querySelectorAll('.price3');
const totalPrice = document.querySelectorAll('.totalPrice');
const modal_brand = document.querySelectorAll('.modal-product-contents-brand');
const modal_productName = document.querySelectorAll('.modal-product-contents-productName');
const modal_image = document.querySelectorAll('.modal-product-image');
const point = document.querySelector('#point');
const delivery = document.querySelector('#delivery');
const option1 = document.querySelector('#option1');
const option2 = document.querySelector('#option2');
const option3 = document.querySelector('#option3');
const cate1 = document.querySelector('#cate1');
const cate2 = document.querySelector('#cate2');
const cate3 = document.querySelector('#cate3');
const radio = document.querySelectorAll('.radio');
const radio1 = document.querySelectorAll('.radio1');
const radio2 = document.querySelectorAll('.radio2');
const radio3 = document.querySelectorAll('.radio3');
const radio4 = document.querySelectorAll('.radio4');
const reviewList = document.querySelectorAll('.reviewList');
const btnWrite = document.querySelector('#btnWrite');
const btnInquiry = document.querySelector('#btnInquiry');
const reviewWriter = document.querySelector('#reviewWriter');
const userId = document.querySelector('#userId');
const contents = document.querySelector('#contents');
const inqueryContents = document.querySelector('#inqueryContents');
const chkInquiry = document.querySelector('#chkInquiry');
const reviewImage = document.querySelector('#reviewImage');
const exampleModalLabel = document.querySelector('#exampleModalLabel');
let product = document.querySelector('#jsonList').innerHTML;
let jsonList = JSON.parse(product);
let productImageCount=0;
let category = jsonList[0].categoryDTO.categoryNum;
let items = document.querySelectorAll('.items');
let realPrice;


function getProductImageCount() {
    for(let i=0; i<jsonList[0].productImageDTOs.length; i++) {
        if(jsonList[0].productImageDTOs[i].detail == 0) {
            productImageCount++;
        }
    }
    for(let i=0; i<productImageCount; i++) {
        let li = document.createElement('li');
        let img = document.createElement('img');
        let img_src = document.createAttribute('src');
        img_src.value='../../resources/upload/store/product/'+jsonList[0].productImageDTOs[i].fileName;
        img.setAttributeNode(img_src);
        li.appendChild(img);
        productImageList[0].append(li);
    }

    for(let i=productImageCount; i<jsonList[0].productImageDTOs.length; i++) {
        let img = document.createElement('img');
        let img_src = document.createAttribute('src');
        img_src.value='../../resources/upload/store/product/'+jsonList[0].productImageDTOs[i].fileName;
        img.setAttributeNode(img_src);
        productDetailList[0].append(img);
    }
}

function setProductImage() {
    productImage.setAttribute('src','../../resources/upload/store/product/'+jsonList[0].productImageDTOs[0].fileName);
}

function setProductInfo() {
    realPrice = jsonList[0].price * ((100 - jsonList[0].saleRate)/100);
    brand.innerHTML=jsonList[0].brand;
    productName.innerHTML=jsonList[0].productName;
    saleRate.innerHTML=jsonList[0].saleRate+'%';
    price1.innerHTML=jsonList[0].price+'원';
    price2.innerHTML= realPrice +'원';
    point.innerHTML= '포인트 '+ Math.ceil(realPrice * 0.001)+'P 적립';
    if(jsonList[0].deliFee == 0) {
        delivery.innerHTML='무료 배송';
    } else {
        delivery.innerHTML='배송비 ' + jsonList[0].deliFee + '원';
    }
}

function setOption() {
    if(jsonList[0].option1DTOs.length == 0) {
        option1.setAttribute('style', 'display:none');
    }
    if(jsonList[0].option2DTOs.length == 0) {
        option2.setAttribute('style', 'display:none');
    }
    if(jsonList[0].option3DTOs.length == 0) {
        option3.setAttribute('style', 'display:none');
    }

    for(let i=0; i<jsonList[0].option1DTOs.length; i++) {
        let option = document.createElement('option');
        let option_value = document.createAttribute('value');
        option_value.value=jsonList[0].option1DTOs[i].num;
        option.setAttributeNode(option_value);
        let option_text;
        if(jsonList[0].option1DTOs[i].optionPrice < 0) {
            option_text = document.createTextNode(jsonList[0].option1DTOs[i].optionName);
        } else {
            option_text = document.createTextNode(jsonList[0].option1DTOs[i].optionName + '(' + jsonList[0].option1DTOs[i].optionPrice + '원)');
        }
        option.appendChild(option_text);
        option1.append(option);
    }

    for(let i=0; i<jsonList[0].option2DTOs.length; i++) {
        let option = document.createElement('option');
        let option_value = document.createAttribute('value');
        option_value.value=jsonList[0].option2DTOs[i].num;
        option.setAttributeNode(option_value);
        let option_text;
        if(jsonList[0].option2DTOs[i].optionPrice < 0) {
            option_text = document.createTextNode(jsonList[0].option2DTOs[i].optionName);
        } else {
            option_text = document.createTextNode(jsonList[0].option2DTOs[i].optionName + '(' + jsonList[0].option2DTOs[i].optionPrice + '원)');
        }        
        option.appendChild(option_text);
        option2.append(option);
    }

    for(let i=0; i<jsonList[0].option3DTOs.length; i++) {
        let option = document.createElement('option');
        let option_value = document.createAttribute('value');
        option_value.value=jsonList[0].option3DTOs[i].num;
        option.setAttributeNode(option_value);
        let option_text;
        if(jsonList[0].option3DTOs[i].optionPrice < 0) {
            option_text = document.createTextNode(jsonList[0].option3DTOs[i].optionName);
        } else {
            option_text = document.createTextNode(jsonList[0].option3DTOs[i].optionName + '(' + jsonList[0].option3DTOs[i].optionPrice + '원)');
        }        
        option.appendChild(option_text);
        option3.append(option);
    }
    fixInfo[0].innerHTML = optionWrap.innerHTML;
}

function getCategory() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", 'category');
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
                return element.categoryNum==category;
            })
            
            if(cates.length == 3) {
                cate1.innerHTML=ca1[0].categoryName + ' > ';
                cate2.innerHTML=ca2[0].categoryName + ' > ';
                cate3.innerHTML=ca3[0].categoryName;
            }
        }
    }
}

function setItem() {
    let check = true;
    if(jsonList[0].option1DTOs.length != 0) {
        if(jsonList[0].option1DTOs[0].optionPrice == -2 || jsonList[0].option1DTOs[0].optionPrice == -3) {
            check = false;
            additionalItem[0].setAttribute("style", 'display:none')
        }
    }
    if(jsonList[0].option2DTOs.length != 0) {
        if(jsonList[0].option2DTOs[0].optionPrice == -2 || jsonList[0].option2DTOs[0].optionPrice == -3) {
            check = false;
            additionalItem[0].setAttribute("style", 'display:none')
        }
    }
    if(jsonList[0].option3DTOs.length != 0) {
        if(jsonList[0].option3DTOs[0].optionPrice == -2 || jsonList[0].option3DTOs[0].optionPrice == -3) {
            check = false;
            additionalItem[0].setAttribute("style", 'display:none')
        }
    }

    if(check) {
        for(let i=0; i<sellingOption.length; i++) {
            sellingOption[i].innerHTML=jsonList[0].productNum;
            price3[i].innerHTML=realPrice*sellingOptionControll[i].value+'원';
            totalPrice[i].innerHTML=realPrice*sellingOptionControll[i].value+'원'
        }
    }
    fixInfo[0].innerHTML = optionWrap.innerHTML;
}



productImageList[0].onmouseover=function(event){
    productImage.setAttribute('src', event.target.getAttribute('src'));
}

option1.onchange=function() {
    // let divItem = document.createElement('div');
    // let divTitle = document.createElement('div');


    // if(jsonList[0].option1DTOs[0].optionPrice == -1) {

    // } else if(jsonList[0].option1DTOs[0].optionPrice == -2) {
        
    // } else {          
    // }
}

section.onchange=function(event) {
    if(event.target.classList.contains('sellingOptionControll')) {
        let target_class = event.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
        let fixed = section.lastChild.previousSibling.lastChild.previousSibling.lastChild.previousSibling;
        let fixed_select = fixed.children[3].firstChild.nextSibling.firstChild.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nextSibling;
        let wrap = section.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling;
        let wrap_items = wrap.firstChild.nextSibling.nextSibling.nextSibling
        .lastChild.previousSibling.lastChild.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling;
        let wrap_select = wrap_items.firstChild.nextSibling.firstChild.nextSibling.nextSibling.nextSibling.firstChild.nextSibling.firstChild.nextSibling;
        let fix_span = fixed_items.parentNode.lastChild.previousSibling.previousSibling.previousSibling.lastChild.previousSibling;
        let wrap_span = wrap_items.parentNode.lastChild.previousSibling.previousSibling.previousSibling.lastChild.previousSibling;
        
        if(target_class.classList.contains('itemWrap')) {
            for(let j=0; j<3; j++) {
                if(event.target.value == fixed_select.options[j].value) {
                    fixed_select.options[j].selected = true;
                }
            }
        } else {
            for(let j=0; j<3; j++) {
                if(event.target.value == wrap_select.options[j].value) {
                    wrap_select.options[j].selected = true;
                }
            }
        }
        fix_span.innerHTML=realPrice*event.target.value+'원';
        wrap_span.innerHTML=realPrice*event.target.value+'원'
        fixed_select.parentNode.nextSibling.nextSibling.innerHTML=realPrice*event.target.value+'원';
        wrap_select.parentNode.nextSibling.nextSibling.innerHTML=realPrice*event.target.value+'원';
    }
}

// modal Setting
function setModal() {
    modal_brand[0].innerHTML=jsonList[0].brand;
    modal_productName[0].innerHTML=jsonList[0].productName;
    modal_image[0].setAttribute('src', '../../resources/upload/store/product/'+jsonList[0].productImageDTOs[0].fileName);
}

// 리뷰 쓰기 버튼 클릭 시 입력된 정보들 초기화
reviewWriter.onclick=function() {
    exampleModalLabel.innerHTML = '리뷰 쓰기';
    for(r of radio) {
        r.checked = false;
    }
    document.querySelector('#thumbnail').innerHTML='';
    reviewImage.value='';
    contents.value='';
}

// modal 입력 버튼
btnWrite.onclick=function() {
    let durStar;
    let priceStar;
    let designStar;
    let deliveryStar;
    let btnClose = document.querySelectorAll('.btn-close');
    
    for(r of radio1) {
        if(r.checked) {
            durStar = r.value;
        }
    }
    for(r of radio2) {
        if(r.checked) {
            priceStar = r.value;
        }
    }
    for(r of radio3) {
        if(r.checked) {
            designStar = r.value;
        }
    }
    for(r of radio4) {
        if(r.checked) {
            deliveryStar = r.value;
        }
    }
    let form = $('#frmUpload')[0];
    let formData = new FormData(form);
    formData.append("fileObj", $("#reviewImage")[0].files[0]);
    
    formData.append("durStar", durStar);
    formData.append("priceStar", priceStar);
    formData.append("designStar", designStar);
    formData.append("deliveryStar", deliveryStar);
    formData.append("userId", userId.value);
    formData.append("contents", contents.value);
    formData.append("productNum", jsonList[0].productNum);
    if(exampleModalLabel.innerHTML == '리뷰 수정') {
        formData.append("revNum", revNum);
        $.ajax({
            url: '/review/update',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function(result) {
                alert('수정 성공!');
                btnClose[0].click();
                getReviewList(0);
            }
        });
    } else {
        $.ajax({
            url: '/review/add',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            success: function(result) {
                alert('작성 성공!');
                btnClose[0].click();
                getReviewList(0);
            }
        });
    }
}

btnInquiry.onclick=function() {
    let priStatus;
    if(chkInquiry.checked) {
        priStatus=1;
    } else {
        priStatus=0;
    }

    const xhttp = new XMLHttpRequest();
    xhttp.open('POST', '/inquiry/add');
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send('contents='+inqueryContents.value+'&priStatus='+priStatus+'&productNum='+jsonList[0].productNum+'&userId='+userId.value);
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            console.log(this.responseText.trim());
        }
    }
}

// 업로드 이미지 미리보기
function setThumbnail(event) {
    let reader = new FileReader();
    reader.onload = function(event) {
        document.querySelector('#thumbnail').innerHTML='';
        let img = document.createElement('img');
        img.setAttribute('src',event.target.result);
        document.querySelector('#thumbnail').append(img);
    }
    reader.readAsDataURL(event.target.files[0]);
}

// 리뷰 리스트
function getReviewList(type) {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/review/list?productNum="+jsonList[0].productNum+"&type="+type);
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            reviewList[0].innerHTML=this.responseText.trim();
        }
    }
}

let revNum;
// review/list.jsp 안 클릭 리스너
reviewList[0].onclick=function(event) {
    if(event.target.classList[0] == 'update') {
        revNum = event.target.getAttribute("data-update-revnum");
        exampleModalLabel.innerHTML = '리뷰 수정';
        reviewImage.value='';
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/review/detail?revNum="+event.target.dataset.updateRevnum);
        xhttp.send();
        xhttp.onreadystatechange=function() {
            if(this.readyState == 4 && this.status == 200) {
                document.querySelector('#thumbnail').innerHTML='';
                let result = JSON.parse(this.responseText.trim());
                contents.value = result.contents;
                $("input:radio[name='rating1']:radio[value="+result.durStar+"]").prop('checked', true); 
                $("input:radio[name='rating2']:radio[value="+result.priceStar+"]").prop('checked', true); 
                $("input:radio[name='rating3']:radio[value="+result.designStar+"]").prop('checked', true); 
                $("input:radio[name='rating4']:radio[value="+result.deliveryStar+"]").prop('checked', true); 
            
                let img = document.createElement('img');
                let img_revNum = document.createAttribute('data-revNum');
                img_revNum.value=event.target.dataset.updateRevnum;
                img.setAttributeNode(img_revNum);
                if(result.fileName != null) {
                    img.setAttribute('src','../../resources/upload/store/review/'+result.fileName);
                }
                document.querySelector('#thumbnail').append(img);
            }
        }
    }

    if(event.target.classList[0] == 'delete') {
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "/review/delete");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("revNum="+event.target.dataset.deleteRevnum);
        xhttp.onreadystatechange=function() {
            if(this.readyState==4 && this.status==200) {
                if(this.responseText.trim()) {
                    alert('삭제 성공');
                    getReviewList(0);
                }
            }
        }
    }

    if(event.target.classList[0] == 'btnHelp') {
        const xhttp = new XMLHttpRequest();
        xhttp.open('POST', '/review/help');
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId.value+'&revNum='+event.target.dataset.helpRevnum);

        let divHelp = event.target.nextSibling.nextSibling;
        let regex = /[^0-9]/g;
        let helpCount = divHelp.innerHTML.replace(regex,"");

        xhttp.onreadystatechange=function() {
            if(this.readyState==4 && this.status==200) {
                let result = this.responseText.trim();
                if(result == 1) {
                    if(helpCount == '') {
                        helpCount = 1;
                    } else {
                        helpCount++;
                    }
                    divHelp.innerHTML=helpCount+'명에게 도움이 되었습니다.'
                    event.target.innerHTML='✔ 도움됨'
                    event.target.setAttribute('style', 'background-color: #35c5f0; color: white;')
                } else {
                    if(helpCount == 1) {
                        divHelp.innerHTML='';
                    } else {
                        divHelp.innerHTML=(helpCount--)+'명에게 도움이 되었습니다.';
                    }
                    event.target.innerHTML='도움이 돼요';
                    event.target.setAttribute('style', '');
                }
            }
        }
    }

    if(event.target.classList[1] == 'sortList') {
        let type = event.target.parentNode.dataset.sortType;
        if(type == 2 || type == 3) {
            getReviewList(event.target.dataset.sort+2);
        } else {
            getReviewList(event.target.dataset.sort);
        }
    }

    if(event.target.classList[1] == 'picCheck') {
        let type = event.target.parentNode.dataset.sortType;
        if(type == 0) {
            getReviewList(2);
        } else if(type == 1) {
            getReviewList(3);
        } else if(type == 2) {
            getReviewList(0);
        } else {
            getReviewList(1);
        }
    }
}
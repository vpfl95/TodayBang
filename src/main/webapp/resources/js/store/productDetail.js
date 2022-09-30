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
const point = document.querySelector('#point');
const delivery = document.querySelector('#delivery');
const option1 = document.querySelector('#option1');
const option2 = document.querySelector('#option2');
const option3 = document.querySelector('#option3');
const cate1 = document.querySelector('#cate1');
const cate2 = document.querySelector('#cate2');
const cate3 = document.querySelector('#cate3');
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
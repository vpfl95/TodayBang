const productImageList = document.querySelectorAll('.productImageList');
const productDetailList = document.querySelectorAll('.productDetailList');
const productImage = document.querySelector('#productImage');
const categoryLink = document.querySelector('#categoryLink');
const optionWrap = document.querySelector('#optionWrap');
const section = document.querySelector('#section');
const fixInfo = document.querySelectorAll('.fixInfo');
const brand = document.querySelector('#brand');
const productName = document.querySelector('#productName');
const saleRate = document.querySelector('#saleRate');
const price1 = document.querySelector('#price1');
const price2 = document.querySelector('#price2');
const modal_brand = document.querySelectorAll('.modal-product-contents-brand');
const modal_productName = document.querySelectorAll('.modal-product-contents-productName');
const modal_image = document.querySelectorAll('.modal-product-image');
const point = document.querySelector('#point');
const delivery = document.querySelector('#delivery');
const cate1 = document.querySelector('#cate1');
const cate2 = document.querySelector('#cate2');
const cate3 = document.querySelector('#cate3');
const radio = document.querySelectorAll('.radio');
const radio1 = document.querySelectorAll('.radio1');
const radio2 = document.querySelectorAll('.radio2');
const radio3 = document.querySelectorAll('.radio3');
const radio4 = document.querySelectorAll('.radio4');
const reviewList = document.querySelectorAll('.reviewList');
const inqueryList = document.querySelectorAll('.inqueryList');
const btnWrite = document.querySelector('#btnWrite');
const btnInquiry = document.querySelector('#btnInquiry');
const reviewWriter = document.querySelector('#reviewWriter');
const userId = document.querySelector('#userId');
const contents = document.querySelector('#contents');
const inqueryContents = document.querySelector('#inqueryContents');
const inqueryReplyContents = document.querySelector('#inqueryReplyContents');
const chkInquiry = document.querySelector('#chkInquiry');
const reviewImage = document.querySelector('#reviewImage');
const exampleModalLabel = document.querySelector('#exampleModalLabel');
const btnInquiryReply = document.querySelector('#btnInquiryReply');
const btnClose = document.querySelectorAll('.btn-close');
const navigationItem = document.querySelectorAll('.navigation-item');
let product = document.querySelector('#jsonList').innerHTML;
let jsonList = JSON.parse(product);
let productImageCount=0;
let category = jsonList[0].categoryDTO.categoryNum;
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
    const xhttp = new XMLHttpRequest();
    xhttp.open('GET', '/product/option?productNum='+jsonList[0].productNum+"&optionList="+optionList);
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            optionWrap.innerHTML = this.responseText.trim();
            fixInfo[0].innerHTML = this.responseText.trim();

            setPrice();
        }
    }
}

function getCategory() {
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

productImageList[0].onmouseover=function(event){
    productImage.setAttribute('src', event.target.getAttribute('src'));
}

// 옵션 변경 시 실행 이벤트
let optionList=[];
section.onchange=function(event) {
    if(event.target.classList.contains('sellingOptionControll')) {
        $('section').find('select.sellingOptionControll').val(event.target.value).prop("selected", true);
        event.target.parentNode.nextSibling.nextSibling.innerHTML = event.target.dataset.optionPrice * event.target.value+'원';
        $('section').find('select.sellingOptionControll')[1].parentNode.nextSibling.nextSibling.innerHTML = event.target.dataset.optionPrice * event.target.value+'원';
        let price=0;
        for(let i=0; i<$('section').find('div.optionPrice').length; i++) {
            let temp = $('section').find('div.optionPrice')[i].innerHTML.replace(/,+/g, '');
            price += parseInt(temp);
        }
        price /= 2;
        $('section').find('span.totalPrice')[0].innerHTML = price+'원';
        $('section').find('span.totalPrice')[1].innerHTML = price+'원';
        $('section').find('input.totalPrice')[0].value = price;
        $('section').find('input.totalPrice')[1].value = price;

        setPrice();
    }

    for(option of optionList) {
        if(event.target.classList.contains('sellingOptionControll-'+option)) {
            $('section').find('select.sellingOptionControll-'+option).val(event.target.value).prop("selected", true);
            event.target.parentNode.nextSibling.nextSibling.innerHTML = event.target.dataset.optionPrice * event.target.value+'원';
            $('section').find('select.sellingOptionControll-'+option)[1].parentNode.nextSibling.nextSibling.innerHTML = event.target.dataset.optionPrice * event.target.value+'원';
            let price=0;
            for(let i=0; i<$('section').find('div.optionPrice').length; i++) {
                let temp = $('section').find('div.optionPrice')[i].innerHTML.replace(/,+/g, '');
                price += parseInt(temp);
            }
            price /= 2;
            $('section').find('span.totalPrice')[0].innerHTML = price+'원';
            $('section').find('span.totalPrice')[1].innerHTML = price+'원';
            $('section').find('input.totalPrice')[0].value = price;
            $('section').find('input.totalPrice')[1].value = price;

            setPrice();
        }
    }

    if(event.target.classList.contains('option1')) {
        if(optionList.includes(event.target.value)) {
            alert('이미 선택한 옵션입니다.');
        } else {
            optionList.push(event.target.value);
        }
        $('section').find('select.option1 option:eq(0)').prop("selected", true);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/product/option?optionList="+optionList+"&productNum="+jsonList[0].productNum);
        xhttp.send();
        xhttp.onreadystatechange=function(){
            optionWrap.innerHTML = this.responseText.trim();
            fixInfo[0].innerHTML = this.responseText.trim();
            setPrice();
        }
    }

    if(event.target.classList.contains('option2')) {
        if(optionList.includes(event.target.value)) {
            alert('이미 선택한 옵션입니다.');
        } else {
            optionList.push(event.target.value);
        }
        $('section').find('select.option2 option:eq(0)').prop("selected", true);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/product/option?optionList="+optionList+"&productNum="+jsonList[0].productNum);
        xhttp.send();
        xhttp.onreadystatechange=function(){
            optionWrap.innerHTML = this.responseText.trim();
            fixInfo[0].innerHTML = this.responseText.trim();
            setPrice();
        }
    }

    if(event.target.classList.contains('option3')) {
        if(optionList.includes(event.target.value)) {
            alert('이미 선택한 옵션입니다.');
        } else {
            optionList.push(event.target.value);
        }
        $('section').find('select.option3 option:eq(0)').prop("selected", true);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/product/option?optionList="+optionList+"&productNum="+jsonList[0].productNum);
        xhttp.send();
        xhttp.onreadystatechange=function(){
            optionWrap.innerHTML = this.responseText.trim();
            fixInfo[0].innerHTML = this.responseText.trim();
            setPrice();
        }
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
            if(this.responseText.trim() == 1) {
                btnClose[1].click();
                getInquiryList();
            }
        }
    }
}

btnInquiryReply.onclick=function() {
    const xhttp = new XMLHttpRequest();
    xhttp.open('POST', '/inquiry/reply');
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send('contents='+inqueryReplyContents.value+'&productNum='+jsonList[0].productNum+'&userId='+userId.value+'&inqNum='+inqNum);
    xhttp.onreadystatechange=function(){
        if(this.readyState==4 && this.status==200) {
            if(this.responseText.trim() == 1) {
                btnClose[2].click();
                getInquiryList();
            }
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

    let param = getParameter("revNum");
    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    
   
    

    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/review/list?productNum="+jsonList[0].productNum+"&type="+type);
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            reviewList[0].innerHTML=this.responseText.trim();
            
            if(param != ""){
                let elem = document.getElementById(param);
                let rect = elem.getBoundingClientRect();
                console.log(param);
                console.log(rect.x);
                console.log(rect.y);
                window.scrollTo(rect.x, rect.y);
            }




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
        let regex = /[^0-9]+/g;
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

function getInquiryList() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/inquiry/list?productNum="+jsonList[0].productNum);
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            inqueryList[0].innerHTML=this.responseText.trim();
        }
    }
}

let inqNum;
inqueryList[0].onclick=function(event) {
    if(event.target.classList[0] == 'delete') {
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "/inquiry/delete");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("inqNum="+event.target.dataset.deleteInqnum);
        xhttp.onreadystatechange=function() {
            if(this.readyState==4 && this.status==200) {
                if(this.responseText.trim() == 1) {
                    alert('삭제 성공');
                    getInquiryList();
                }
            }
        }
    }

    if(event.target.classList[0] == 'reply') {
        inqNum=event.target.dataset.replyInqnum;
    }
}

// 섹션 클릭리스너
section.onclick=function(event) {
    if(event.target.classList.contains('deleteOption')) {
        if(optionList.includes(event.target.dataset.deleteOpnum)) {
            optionList.splice(optionList.indexOf(event.target.dataset.deleteOpnum),1);
        }

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/product/option?optionList="+optionList+"&productNum="+jsonList[0].productNum);
        xhttp.send();
        xhttp.onreadystatechange=function(){
            optionWrap.innerHTML = this.responseText.trim();
            fixInfo[0].innerHTML = this.responseText.trim();
        }
    }

    if(event.target.classList.contains('buy')) {
        check=true;
        if($('section').find('select.option1').length != 0) {
            if($('section').find('select.option1')[0].firstChild.nextSibling.dataset.optionPrice == -2) {
                check=false;
                for(let i=0; i<$('section').find('option.option1_op').length; i++) {
                    if(optionList.includes($('section').find('option.option1_op')[i].value)) {
                        check=true;
                        break;
                    }
                }
            }
        }
        if($('section').find('select.option2').length != 0) {
            if($('section').find('select.option2')[0].firstChild.nextSibling.dataset.optionPrice == -2) {
                check=false;
                for(let i=0; i<$('section').find('option.option2_op').length; i++) {
                    if(optionList.includes($('section').find('option.option2_op')[i].value)) {
                        check=true;
                        break;
                    }
                }
            }
        }
        if($('section').find('select.option3').length != 0) {
            if($('section').find('select.option3')[0].firstChild.nextSibling.dataset.optionPrice == -2) {
                check=false;
                for(let i=0; i<$('section').find('option.option3_op').length; i++) {
                    if(optionList.includes($('section').find('option.option3_op')[i].value)) {
                        check=true;
                        break;
                    }
                }
            }
        }
        if(check) {
            $('section').find('input.frmProductNum')[0].value=jsonList[0].productNum;
            $('section').find('input.frmProductNum')[1].value=jsonList[0].productNum;
            $('section').find('form#frmCheckout').submit();
        } else {
            alert("필수 옵션을 선택해주세요");
        }
    }
}

for(navi of navigationItem) {
    navi.onclick=function(e) {
        let url = location.href;
        location.replace(url+e.target.dataset.anchorCase);
        url = url.replace(/(#.*)/ig,'');
        history.replaceState(null, null, url);
    }
}

function setPrice() {
    let price = $('section').find('div.price');
    let price2 = $('section').find('span.price');

    for(let p=0; p<price.length; p++) {
        price[p].innerHTML = price[p].innerHTML.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }

    for(let p=0; p<price2.length; p++) {
        price2[p].innerHTML = price2[p].innerHTML.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    }
}
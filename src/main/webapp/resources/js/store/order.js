const samplePostcode = document.querySelectorAll('.sample-postcode');
const termsAgree1 = document.querySelector('#termsAgree1');
const termsAgree2 = document.querySelector('#termsAgree2');
const termsAgree1_1 = document.querySelector('#termsAgree1_1');
const termsAgree1_2 = document.querySelector('#termsAgree1_2');
const termsAgree2_1 = document.querySelector('#termsAgree2_1');
const delivery = document.querySelector('#delivery');
const deliveryJson = document.querySelector('#deliveryJson');
const getPoint = document.querySelector('#getPoint');
const btnPay = document.querySelector('#btnPay');
const result = document.querySelector('#result');
const productCount = document.querySelector('#productCount');

const deliName = document.querySelector('#deliName');
const addressee = document.querySelector('#addressee');
const phoneFirst = document.querySelector('#phoneFirst');
const phoneLast = document.querySelector('#phoneLast');
const sample6_postcode = document.querySelector('#sample6_postcode');
const sample6_address = document.querySelector('#sample6_address');
const sample6_detailAddress = document.querySelector('#sample6_detailAddress');
const email = document.querySelector('#email');
const emailFirst = document.querySelector('#emailFirst');
const emailAt = document.querySelector('#emailAt');
const phoneWrap = document.querySelector('#phoneWrap');
const memberPhone = document.querySelector('#memberPhone');

const totalPrice = document.querySelectorAll('.totalPrice');
const productName = document.querySelector('#productName');
const productNum = document.querySelector('#productNum');

const orderAllCheck = document.querySelector('#orderAllCheck');
const orderCheck = document.querySelectorAll('.orderCheck');
const orderCheck1 = document.querySelector('#orderCheck1');
const orderCheckSub = document.querySelectorAll('.orderCheckSub');
const pointAll = document.querySelector('#pointAll');
const usePointValue = document.querySelectorAll('.usePointValue');
const pointCost = document.querySelector('#pointCost');
const usePoint = document.querySelectorAll('.usePoint');
const price1 = document.querySelectorAll('.price1');
const deliFee = document.querySelectorAll('.deliFee');


for(sp of samplePostcode) {
    sp.onclick=sample6_execDaumPostcode;
}


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

            // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var addr = ''; // ?????? ??????

            //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
            if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                addr = data.roadAddress;
            } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                addr = data.jibunAddress;
            }
            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // ????????? ???????????? ????????? ????????????.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

termsAgree1.onclick=function(event) {
    console.log(event.target);
    if(event.target.classList.contains('terms-expand') || event.target.classList.contains('terms-expand-click')) {
        let svg = event.target;
        svg.classList.toggle('terms-expand');
        svg.classList.toggle('terms-expand-click');
        if(svg.classList.contains('terms-expand')) {
            termsAgree1_1.setAttribute('style', 'display: none');
            termsAgree1_2.setAttribute('style', 'display: none');
        } else {
            termsAgree1_1.setAttribute('style', '');
            termsAgree1_2.setAttribute('style', '');
        }
    } else {
        let svg = $(event.target).find('svg');
        svg[0].classList.toggle('terms-expand');
        svg[0].classList.toggle('terms-expand-click');
        if(svg[0].classList.contains('terms-expand')) {
            termsAgree1_1.setAttribute('style', 'display: none');
            termsAgree1_2.setAttribute('style', 'display: none');
        } else {
            termsAgree1_1.setAttribute('style', '');
            termsAgree1_2.setAttribute('style', '');
        }
    }
}

termsAgree2.onclick=function(event) {
    if(event.target.classList.contains('terms-expand') || event.target.classList.contains('terms-expand-click')) {
        let svg = event.target;
        svg.classList.toggle('terms-expand');
        svg.classList.toggle('terms-expand-click');
        if(svg.classList.contains('terms-expand')) {
            termsAgree2_1.setAttribute('style', 'display: none');
        } else {
            termsAgree2_1.setAttribute('style', '');
        }
    } else {
        let svg = $(event.target).find('svg');
        svg[0].classList.toggle('terms-expand');
        svg[0].classList.toggle('terms-expand-click');
        if(svg[0].classList.contains('terms-expand')) {
            termsAgree2_1.setAttribute('style', 'display: none');
        } else {
            termsAgree2_1.setAttribute('style', '');
        }
    }
}

delivery.onchange=function(event){
    let jsonDelivery = JSON.parse(deliveryJson.innerHTML);
    let delivery = jsonDelivery.filter(function(element) {
        return element.addressNum==event.target.value;
    })
    deliName.value = delivery[0].deliveryName;
    addressee.value = delivery[0].name;
    sample6_postcode.value = delivery[0].postcode;
    sample6_address.value = delivery[0].address;
    sample6_detailAddress.value = delivery[0].extraAddress + ' ' + delivery[0].detailAddress;
    let first = delivery[0].phone.match(/(^[0-9]+)/g);
    let last = delivery[0].phone.match(/([0-9]{4})-([0-9]+)/g); 
    $('select#phoneFirst').val(first).prop("selected", true);
    phoneLast.value = last;
}

function setMain() {
    let emails = email.dataset.email.split('@');
    emailFirst.value=emails[0];
    $('select#emailAt').val(emails[1]).prop('selected', true);

    let first = phoneWrap.dataset.phoneNumber.match(/(^[0-9]+)/g);
    let last = phoneWrap.dataset.phoneNumber.match(/([0-9]{4})-([0-9]+)/g);
    $('select#memberPhoneFirst').val(first).prop("selected", true);
    memberPhone.value = last;

    let point = Math.ceil(getPoint.dataset.point);
    getPoint.innerHTML=point+' P';
    setPrice();
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

btnPay.onclick=function(){
    let check = true;
    if(!orderAllCheck.checked){
        check = false;
    }

    if(check){
        requestPay();
    } else {
        Swal.fire({
            icon: 'warning',
            text: '????????? ?????? ??????????????????',
          })
    }
};

function requestPay() {  
    var IMP = window.IMP; // ?????? ??????
    IMP.init("imp62542227"); // ???: imp00000000
    // IMP.request_pay(param, callback) ????????? ??????
    let d = new Date();
    let n = d.getMilliseconds();
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: n, // ???????????? ???????????? ?????? ????????? ??????
        name : productName.value,
        amount : totalPrice[0].innerHTML.replace(/,+/g, ''),
        buyer_name : addressee.value,
        buyer_tel : phoneFirst.value+'-'+phoneLast.value,
        buyer_addr : sample6_address.value+' '+sample6_detailAddress.value,
        buyer_postcode : sample6_postcode.value,
    }, function(rsp) { // callback ??????
        if ( rsp.success ) {
            //[1] ??????????????? ???????????? ????????? ?????? jQuery ajax??? imp_uid ????????????
            jQuery.ajax({
                url: "/member/orderComplete", //cross-domain error??? ???????????? ????????? ??????????????????
                type: 'POST',
                // dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //?????? ????????? ???????????? ????????? ?????? ??????
                }
            }).done(function(data) {
                //[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
                if(rsp.paid_amount == data.response.amount) {
                     // ????????????????????? ??????
                    let num = [];
                    let count = [];
                    const optionNum = document.querySelectorAll('.optionNum');
                    const optionCount = document.querySelectorAll('.optionCount');
                    for(op of optionNum) {
                        num.push(op.value);
                    }
                    for(op of optionCount) {
                        count.push(op.dataset.optionCount);
                    }
                    const xhttp = new XMLHttpRequest();
                    xhttp.open("POST", "/member/addOrder");
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    let point = getPoint.innerHTML.split(' ');
                    if(result.value == 0) {
                        xhttp.send('imp_uid='+rsp.imp_uid+'&delivery='+delivery.value+'&result='+result.value+'&productCount='+productCount.dataset.productCount+'&optionNum='+num+'&optionCount'+count+'&productNum='+productNum.value+'&point='+point[0]);
                    } else {
                        xhttp.send('imp_uid='+rsp.imp_uid+'&delivery='+delivery.value+'&result='+result.value+'&optionNum='+num+'&optionCount='+count+'&productNum='+productNum.value+'&point='+point[0]);
                    }
                    xhttp.onreadystatechange=function() {
                        console.log(this.responseText);
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: '?????? ??????',
                        footer: '<a href="">Why do I have this issue?</a>'
                      })
                }
            });
        } else {
            var msg = '????????? ?????????????????????.';
            msg += ' ???????????? : ' + rsp.error_msg;
            
            Swal.fire({
                icon: 'error',
                text: msg,
                footer: '<a href="">Why do I have this issue?</a>'
              })
        }
    });
}

orderAllCheck.onclick=function() {
    for(ch of orderCheck) {
        ch.checked = orderAllCheck.checked;
    }
}

for(ch of orderCheck){
    ch.onclick=function(){
        let check = true;
        for(ch of orderCheck){
            if(!ch.checked){
                check=false;
            }
        }
        if(check){
            orderAllCheck.checked = true;

        }else{
            orderAllCheck.checked = false;
        }
    }
}

orderCheck1.onclick=function(){
    for(ch of orderCheckSub) {
        ch.checked = orderCheck1.checked;
    }
}

for(ch of orderCheckSub){
    ch.onclick=function(){
        let check = true;
        for(ch of orderCheckSub){
            if(!ch.checked){
                check=false;
            }
        }
        if(check){
            orderCheck1.checked = true;

        }else{
            orderCheck1.checked = false;
        }
    }
}

pointAll.onclick=function() {
    let mileage = usePointValue[0].innerHTML.split(' ');
    pointCost.value=mileage[0];

    usePoint[0].innerHTML=mileage[0];
    totalPrice[0].innerHTML= parseInt(price1[0].innerHTML.replace(/,+/g, ''))+parseInt(deliFee[0].innerHTML)-mileage[0];
    totalPrice[1].innerHTML= parseInt(price1[0].innerHTML.replace(/,+/g, ''))+parseInt(deliFee[0].innerHTML)-mileage[0];
    setPrice();
}

pointCost.onkeyup=function() {
    let mileage = usePointValue[0].innerHTML.split(' ');
    if(parseInt(pointCost.value) > parseInt(mileage[0])) {
        pointCost.value = mileage[0];
    }
    usePoint[0].innerHTML=pointCost.value;
    totalPrice[0].innerHTML= parseInt(price1[0].innerHTML.replace(/,+/g, ''))+parseInt(deliFee[0].innerHTML)-usePoint[0].innerHTML;
    totalPrice[1].innerHTML= parseInt(price1[0].innerHTML.replace(/,+/g, ''))+parseInt(deliFee[0].innerHTML)-usePoint[0].innerHTML;
    setPrice();
}
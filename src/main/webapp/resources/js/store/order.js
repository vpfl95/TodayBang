const samplePostcode = document.querySelectorAll('.sample-postcode');
const termsAgree1 = document.querySelector('#termsAgree1');
const termsAgree2 = document.querySelector('#termsAgree2');
const termsAgree1_1 = document.querySelector('#termsAgree1_1');
const termsAgree1_2 = document.querySelector('#termsAgree1_2');
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



for(sp of samplePostcode) {
    sp.onclick=sample6_execDaumPostcode;
}


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

termsAgree1.onclick=function(event) {
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
    console.log(event.target.firstChild.nextSibling);
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

btnPay.onclick=requestPay;

function requestPay() {  
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp62542227"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: "order_no_0023", // 상점에서 관리하는 주문 번호를 전달
        name : productName.value,
        // amount : totalPrice[0].innerHTML.replace(/,+/g, ''),
        amount : 100,
        buyer_name : addressee.value,
        buyer_tel : phoneFirst.value+'-'+phoneLast.value,
        buyer_addr : sample6_address.value+' '+sample6_detailAddress.value,
        buyer_postcode : sample6_postcode.value,
    }, function(rsp) { // callback 로직
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/member/orderComplete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                // dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if(rsp.paid_amount == data.response.amount) {
                    alert('결제 성공');
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
                    if(result.value == 0) {
                        xhttp.send('imp_uid='+rsp.imp_uid+'&delivery='+delivery.value+'&result='+result.value
                    +'&productCount='+productCount.dataset.productCount+'&optionNum='+num+'&optionCount'+count+'&productNum='+productNum.value);
                    } else {
                        xhttp.send('imp_uid='+rsp.imp_uid+'&delivery='+delivery.value+'&result='+result.value
                    +'&optionNum='+num+'&optionCount='+count+'&productNum='+productNum.value);
                    }
                    xhttp.onreadystatechange=function() {
                        console.log(this.responseText);
                    }
                } else {
                    alert('결제 실패');
                }
            });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });
}
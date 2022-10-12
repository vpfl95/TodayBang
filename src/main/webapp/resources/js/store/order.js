const samplePostcode = document.querySelectorAll('.sample-postcode');
const termsAgree1 = document.querySelector('#termsAgree1');
const termsAgree2 = document.querySelector('#termsAgree2');
const termsAgree1_1 = document.querySelector('#termsAgree1_1');
const termsAgree1_2 = document.querySelector('#termsAgree1_2');
const delivery = document.querySelector('#delivery');
const deliveryJson = document.querySelector('#deliveryJson');
const getPoint = document.querySelector('#getPoint');

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
}
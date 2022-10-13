profileDiv = document.querySelector('#profileDiv');

profileDiv.onclick=function(event) {
    if(event.target.getAttribute('id') == 'payBtn') {
        // requestPay();
        console.log($('#profileDiv').find('.cart-pd-detail-contents').find('#cart-product').find('a')[0].innerHTML);
    }
}

function requestPay() {  // 데이터 값 바꾸기
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp62542227"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    let d = new Date();
    let n = d.getMilliseconds();
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: n, // 상점에서 관리하는 주문 번호를 전달
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
                     // 결제성공페이지 이동
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
                        text: '결제 실패',
                        footer: '<a href="">Why do I have this issue?</a>'
                      })
                }
            });
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            Swal.fire({
                icon: 'error',
                text: msg,
                footer: '<a href="">Why do I have this issue?</a>'
              })
        }
    });
}
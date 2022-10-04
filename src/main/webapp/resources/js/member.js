
// 로그인 부분
function login() {

    const findId = document.querySelector("#findId");
    const loginBtn =  document.querySelector("#loginBtn");
    const userId = document.querySelector("#userId");
    const password = document.querySelector("#password");
    loginBtn.addEventListener("click",function(){

        xhttp = new XMLHttpRequest();

        xhttp.open("POST","./login");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId.value+"&password="+password.value);
        xhttp.onreadystatechange= function(){

            if(xhttp.readyState == 4 && xhttp.status ==200){
                let result = xhttp.responseText.trim();
                
                if(result == 1){
                    Swal.fire({
                        
                        icon: "success",
                        button : false
                    } )

                    setTimeout(() => {
                        location.href = document.referrer;
                    }, 700)
        
                }else if(result == 0){
                    Swal.fire({
                        title: "로그인 실패",
                        text : "존재하지 않는 계정입니다.",
                        icon: "error"
        
                    } ).then((result) => {
                        
                    })
                    
                }
            }
        }
    })


    findId.addEventListener("click",function(){

        Swal.fire({
            title: 'ID 찾기',
            html :
            '  이름 : <input id="swalinput1" name = "swalinput1" class="swal2-input">' +
            '<br>이메일 : <input id="swalinput2" class="swal2-input">',

            reverseButtons:true,
            showCancelButton: true,
            confirmButtonText: '찾기',
            
            showLoaderOnConfirm: true, // 데이터 결과를 받을때까지, 버튼에다가 로딩바를 표현
            preConfirm: () => { // 확인 버튼 누르면 실행되는 콜백함수
              return  fetch(`/member/findId?userName=`+swalinput1.value+`&email=`+swalinput2.value)
                .then(response => {
                  if (!response.ok) {
                    throw new Error(response.statusText)
                  }
                  return response.text();

                })
                .catch(error => {
                  Swal.showValidationMessage(
                    `없는 ID 입니다. error : ${error}`
                  )
                })
            }, allowOutsideClick: () => !Swal.isLoading() 
            
          }).then((result) => {
            let map = JSON.parse(JSON.stringify(result.value));
            if (result.isConfirmed) {
              Swal.fire({
                title: `ID 찾기`,
                text: '찾으시는 ID는 '+map + " 입니다.",
                showCancelButton: true,
                cancelButtonText:"확인",
                confirmButtonText: 'PW 찾기',
                reverseButtons:true
              }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: `PW 찾기`,
                        html :
                        '  이름 : <input id="swalinput1" name = "swalinput1" class="swal2-input">' +
                        '<br>이메일 : <input id="swalinput2" class="swal2-input">',
                    })


                }

            })


          }})


    })
}









//회원가입 부분
function join(){

    const userId = document.querySelector("#userId");
    const password = document.querySelector("#password");
    const pwCheck = document.querySelector("#pwCheck");
    const nickname = document.querySelector("#nickname");
    const userName = document.querySelector("#userName");
    const phoneM = document.querySelector("#phoneMiddle");
    const phoneF = document.querySelector("#phoneFirst");
    const phoneL = document.querySelector("#phoneLast");
    const emailF = document.querySelector("#emailFirst");
    const emailAt = document.querySelector("#emailAt");
    const joinBtn = document.querySelector("#joinBtn");
    const phone = document.querySelector("#phone");
    const email = document.querySelector("#email");
    let message = "";
    const submitPhone = document.querySelector("#submitPhone");
    const submitEmail = document.querySelector("#submitEmail");
    const nonOverlab = document.getElementsByClassName("nonOverlab");
    const emailBtn = document.querySelector("#emailBtn");
    const joinForm = document.querySelector("#joinForm");


    emailBtn.addEventListener("click",function(){
        let email = document.createAttribute("data-email");
        email.value="317tmdgjs@naver.com";
        joinForm.setAttributeNode(email);
        

        joinForm.action ="https://script.google.com/macros/s/AKfycbySnDCL1mwgmsqaeS5TuQZvDCnwNIvyWbbB_8UjuGxA5Fiaq4srE3O-KDA0lcENcWKvTQ/exec"
        joinForm.submit();

    })

    password.addEventListener("blur",function(){

        

        if(pwCheck.value == ""){
            
            return;
        }else if(password.value != pwCheck.value){
            message = "비밀번호가 일치 하지 않습니다.";;

        }else{

          
            message = "";
        }
        textmessage(pwCheck,message);
    })
    pwCheck.addEventListener("blur",function(){

        if(password.value == ""){
            
            return;
        }else if(password.value != pwCheck.value){
            message = "비밀번호가 일치 하지 않습니다.";

        }else{
            message = "";
        }
        textmessage(pwCheck,message);
        
    })


    function textmessage(input,message) {
        let text = document.createElement("p");
        let textArr = document.createAttribute("id");
        textArr.value = input.id + "Text";
        
        if(input.nextSibling.nextSibling.id == textArr.value ){

            input.nextSibling.nextSibling.remove();
            
        }else if(input.nextSibling.id == textArr.value){

            input.nextSibling.remove();
            

        }
        if(message != ""){
            
            input.after(text);
            text.innerText= message;
            text.setAttributeNode(textArr);

            
            input.previousSibling.previousSibling.style.color='red';
            input.nextSibling.style.color = 'red';

            if(input == email || input == phone){
                let inputlist = input.getElementsByClassName("nonOverlab");
                
                for(inl of inputlist){
                    inl.style.borderColor = 'red';
                }


            }else if(input == pwCheck){
                password.previousSibling.previousSibling.style.color='red';
                password.style.borderColor = 'red';

            }else{
                input.style.borderColor = 'red';
            }

        }else{
            
            input.previousSibling.previousSibling.style.color='';
            input.style.borderColor = '';
            

            if(input == pwCheck){
                password.previousSibling.previousSibling.style.color='';
                password.style.borderColor = '';

            }else if(input == email || input == phone){
                let inputlist = input.getElementsByClassName("nonOverlab");
                
                for(inl of inputlist){
                    inl.style.borderColor = '';
                }


            }
        }
    }


    phoneF.addEventListener("change",function(){
        phoneM.focus();
        
    })

    phoneM.addEventListener("keyup",function(){

        if(phoneM.value.length ==4){
            phoneL.focus();
        }

    })

    // 중복 확인 부분
    for(NOL of  nonOverlab){
        NOL.addEventListener("change", function(event){

            
            if(event.target.name =="phone1" ){
                if(phoneM.value== "" || phoneL.value == ""){
                    
                    return;

                }else{
                    let phoneValue = phoneF.value + "-" + phoneM.value + "-" + phoneL.value;
                    submitPhone.value = phoneValue;
                    
                    checkOvetlab(phoneValue,phone);
                }
                
            }
            else if(event.target.name == "email1"){

                if(emailF.value== "" || emailAt.value == "0"){
                    return;

                }else{
                    let emailValue = emailF.value + "@" + emailAt.value;
                    submitEmail.value = emailValue;
                    
                    checkOvetlab(emailValue,email);
                }
            }else if(event.target.name == "userId"){

                if(userId.value.length < 3){
                    message = "ID는 2글자 이상"
                    textmessage(userId,message);;
                }else{
                    checkOvetlab(event.target.value,event.target);
                }
                

            }else if(event.target.name == "nickname"){
                if(nickname.value.length < 3){
                    message = "닉넴은 2글자 이상"
                    textmessage(nickname,message);;
                }else{
                    checkOvetlab(event.target.value,event.target);
        
                }
            }
        })
    }

// 중복 확인 Ajax
    function checkOvetlab(value,inputForm){

        if(value != ""){
            const xhttp = new XMLHttpRequest();

            xhttp.open("POST","./joinOverlab");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send(inputForm.id +"="+ value)
            xhttp.onreadystatechange= function(){

                if(xhttp.readyState == 4 && xhttp.status ==200){
                    let result = xhttp.responseText.trim();
                    
                    if(result == 0){
                        message = "이미 사용중인 " +inputForm.previousSibling.previousSibling.innerText + "입니다." ;
                        textmessage(inputForm,message);

                    }else if(result == 1){
                        message = ""
                        textmessage(inputForm,message);
                        
                    }
                }
            }
        }
    }
    


    // 회원가입 제출
    joinBtn.addEventListener("click",function(){

        let redCheck = joinInput.getElementsByTagName('p');
        let nullCheck = joinInput.getElementsByTagName('input');
        let result = 0;
        for(nu of nullCheck){

            if(nu.value == ""){
                result += 1;
            }

        }





        if(redCheck.length == 0 && result == 0){

            swal({
                title: "회원가입 성공",
                icon: "success"

            } ).then((result) => {
                joinForm.submit();
            })
        }else if(result !=0){
          
            swal({
                title: "회원가입 실패",
                text: "입력되지 않은 란이 있습니다.",
                icon: "error"

            } )
            

        }else{

            swal({
                title: "회원가입 실패",
                text: "가입 조건을 맞추어 주세요.",
                icon: "error"

            } )

        }

    })
}








// 약관동의 부분
function joincheck(){

    const nextBtn = document.querySelector("#nextBtn");
    const joinAllCheck = document.querySelector("#joinAllCheck");
    const joinCheck = document.getElementsByClassName("joinCheck");
    const mustCheck = document.getElementsByClassName("mustCheck");
    const joinCheckForm = document.querySelector("#joinCheckForm");
    
    nextBtn.addEventListener("click",function(){
        let check = true;
        let nocheck;
        for(ch of mustCheck){
            if(!ch.checked){
                
                check = false;
                nocheck = ch;
            }
        }
    
        if(check){
    
            joinCheckForm.submit();
    
        }else{
            
            // check 박스 빨갛게 표시
    
        }
    })
    
    
    joinAllCheck.addEventListener("click",function(){
        
        for(ch of joinCheck){
            
            ch.checked = joinAllCheck.checked;
    
    
        }
    
    })
    
    for(ch of joinCheck){
    
        ch.addEventListener("click", function(){
            let check = true;
            for(ch of joinCheck){
                if(!ch.checked){
                    check=false;
                }
            }
    
            if(check){
                joinAllCheck.checked = true;
    
            }else{
                joinAllCheck.checked = false;
            }
        })
    }



}


// 마이페이지 부분
function myPage(){

    const myPage1 = document.querySelector("#myPage-1");
    const myPagelist = document.querySelectorAll(".myPage-list");
    
    
    for(category of myPagelist){

        category.addEventListener("click",function(event){
            
            let arr ;
            let url ;


            for(ct of myPagelist){
                ct.style.color = "";
            }
            event.target.style.color = "#38b9e0";

            if(event.target.id == "myPage-profile"){
    
                 arr = ['정보수정', '비밀번호변경','멤버등급', '배송지정보'];
                 url = ['profile','updatePw' ,'rank', 'delivery'];
        
                
            }else if(event.target.id == "myPage-shopping"){
    
                 arr = ['장바구니', '배송내역', '구매내역','관심매물'];
                 url = ['store/url1', 'store/url2', 'store/url3' , 'store/url4'];
        
                
            }else if(event.target.id == "myPage-write"){
    
                 arr = ['내 문의', '내 상품리뷰', '내 방리뷰', '내 게시글', '내 댓글'];
                 url = ['/member/myQna', '/member/myPReview', '/member/myPReview','store/url4','store/url5'];
        
               
            }




            profileCategory(event.target , arr , url);
            
        })


    }
    

    function profileCategory(cate , arr , url){

        const subMenu = document.querySelector("#myPage-2");

        for(let i = 0 ; i < subMenu.children.length ; ){
            subMenu.children[i].remove();
        }
    
        if(arr.length != url.length){
            return;
        }
    
        



    
        for(let i = 0 ; i < arr.length; i ++){

            if(cate.id == "myPage-profile"){
                if(url[i] == "delivery"){
                    let li = document.createElement("li");
                    let liText = document.createTextNode(arr[i]);
                    
        
                    let aTag = document.createElement("a");
                    let aAttri = document.createAttribute("href");
                    aAttri.value = "/member/"+url[i];
                    aTag.setAttributeNode(aAttri);
        
        
                    li.appendChild(aTag);
                    aTag.appendChild(liText);
                    subMenu.append(li);
    
    
                    continue;
                }else{
                    
                    let locate = location.href.split("/")
                    locate = locate[4].split("?")
                    

                    if(locate[0] != "myPage"){


                        let li = document.createElement("li");
                        let liText = document.createTextNode(arr[i]);
                        
                        let aTag = document.createElement("a");
                        let aAttri = document.createAttribute("href");
                        aAttri.value = "/member/myPage?page="+url[i];
                        aTag.setAttributeNode(aAttri);
            
                        li.appendChild(aTag);
                        aTag.appendChild(liText);
                        subMenu.append(li);
                        continue;
                    }else{
                       
                        let li = document.createElement("li");
                        let liText = document.createTextNode(arr[i]);
                        
            
                        let aAttri = document.createAttribute("data-a");
                        aAttri.value = "/member/"+ url[i];
                        li.setAttributeNode(aAttri);
            

                        aAttri = document.createAttribute("id");
                        aAttri.value = url[i];
                        li.setAttributeNode(aAttri);
            
                        aAttri = document.createAttribute("class");
                        aAttri.value = "submenuList";
                        li.setAttributeNode(aAttri);
                        
                        li.appendChild(liText);
                        subMenu.append(li);

                        continue;
                    }


                }
            }



           
        }



    }


    


}

// 마이페이지 - 프로필 부분
function profile() {

    const emailF = document.querySelector("#emailFirst");
    const emailAt = document.querySelector("#emailAt");
    const submitEmail = document.querySelector("#submitEmail");

    let splitEmail =  submitEmail.value.split("@");
    
    emailF.value = splitEmail[0];
    emailAt.value = splitEmail[1];

    const phoneF = document.querySelector("#phoneFirst");
    const phoneM = document.querySelector("#phoneMiddle");
    const phoneL = document.querySelector("#phoneLast");
    const submitPhone = document.querySelector("#submitPhone");


    let splitPhone =  submitPhone.value.split("-");
    if(splitPhone != ""){
        phoneF.value = splitPhone[0];
        phoneM.value = splitPhone[1];
        phoneL.value = splitPhone[2];
    }



    const nonOverlab = document.getElementsByClassName("nonOverlab");
    const phone = document.querySelector("#phone");
    const email = document.querySelector("#email");
    const previewNameLabel = document.querySelector("#previewNameLabel");

    
    if( previewNameLabel.innerText == "" ){
        previewNameLabel.innerText ="프로필 없음";
    }





 // 중복 확인 부분
    for(NOL of  nonOverlab){
        NOL.addEventListener("change", function(event){

            
            if(event.target.name =="phone1" ){
                if(phoneM.value== "" || phoneL.value == ""){
                    
                    return;

                }else{
                    let phoneValue = phoneF.value + "-" + phoneM.value + "-" + phoneL.value;
                    submitPhone.value = phoneValue;
                    
                    checkOvetlab(phoneValue,phone);
                }
                
            }
            else if(event.target.name == "email1"){

                if(emailF.value== "" || emailAt.value == "0"){
                    return;

                }else{
                    let emailValue = emailF.value + "@" + emailAt.value;
                    submitEmail.value = emailValue;
                    
                    checkOvetlab(emailValue,email);
                }
            }else if(event.target.name == "nickname"){
                if(nickname.value.length < 3){
                    message = "닉넴은 2글자 이상"
                    textmessage(nickname,message);;
                }else{
                    checkOvetlab(event.target.value,event.target);
        
                }
            }
        })
    }

    // 중복 확인 Ajax
    function checkOvetlab(value,inputForm){

        if(value != ""){
            const xhttp = new XMLHttpRequest();

            xhttp.open("POST","./updateOverlab");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send(inputForm.id +"="+ value)
            xhttp.onreadystatechange= function(){

                if(xhttp.readyState == 4 && xhttp.status ==200){
                    let result = xhttp.responseText.trim();
                    
                    if(result == 0){
                        message = "이미 사용중인 " +inputForm.previousSibling.previousSibling.innerText + "입니다." ;
                        textmessage(inputForm,message);

                    }else if(result == 1){
                        message = ""
                        textmessage(inputForm,message);
                        
                    }
                }
            }
        }
    }

    function textmessage(input,message) {
        let text = document.createElement("p");
        let textArr = document.createAttribute("id");
        textArr.value = input.id + "Text";
        
        if(input.nextSibling.nextSibling.id == textArr.value ){

            input.nextSibling.nextSibling.remove();
            
        }else if(input.nextSibling.id == textArr.value){

            input.nextSibling.remove();
            

        }
        if(message != ""){
            
            input.after(text);
            text.innerText= message;
            text.setAttributeNode(textArr);

            
            input.previousSibling.previousSibling.style.color='red';
            input.style.borderColor = 'red';
            input.nextSibling.style.color = 'red';

            if(input == email || input == phone){
                let inputlist = input.getElementsByClassName("nonOverlab");
                
                for(inl of inputlist){
                    inl.style.borderColor = 'red';
                }
            }
        }else{
            
            input.previousSibling.previousSibling.style.color='';
            input.style.borderColor = '';
            if(input == email || input == phone){
                let inputlist = input.getElementsByClassName("nonOverlab");
                
                for(inl of inputlist){
                    inl.style.borderColor = '';
                }
            }
        }
    }

    const profileImg = document.querySelector("#profileImg");
   
    profileImg.addEventListener("change",function(){


        let labelvalue = profileImg.value.split("\\");
        previewNameLabel.innerText = labelvalue[2];

    })



    // 수정 제출
    updateBtn.addEventListener("click",function(){

        let redCheck = updateInput.getElementsByTagName('p');
        let nullCheck = updateInput.getElementsByTagName('input');
        const profileImg = document.querySelector("#profileImg");
        let result = 0;
        const previewProfile = document.querySelector("#previewProfile");


        for(nu of nullCheck){

            if(nu.value == "" && profileImg.id != nu.id ){
                result += 1;
            }

        }





        if(redCheck.length == 0 && result == 0 && previewProfile.title !=  "NoProfile"){


            Swal.fire({
                title: "프로필 수정 성공",
                icon: "success"

            } ).then((result) => {
                updateForm.submit();
            })

            


        }else if(redCheck.length == 0 && result == 0 && previewProfile.title ==  "NoProfile"){
            updateForm.setAttribute("action","./delete");
            Swal.fire({
                title: "프로필 수정 성공",
                icon: "success"

            } ).then((result) => {
                updateForm.submit();
            })
            
        }else if(result !=0){
            Swal.fire({
                title: "프로필 수정 실패",
                text : "입력되지 않은 란이 있습니다.",
                icon: "error"

            } )


        }else{

            Swal.fire({
                title: "프로필 수정 실패",
                text : "수정 조건을 만족해 주세요!",
                icon: "error"

            } )

        }

    })

    const deleteBtn = document.querySelector("#deleteBtn");
    // 프로필 삭제 버튼 클릭 시
    deleteBtn.addEventListener("click",function(){
        previewProfile.setAttribute("src","/resources/images/NoProfile.png");
        previewProfile.setAttribute("title","NoProfile");
        previewNameLabel.innerText = "프로필 없음";
    })


    const dropId = document.querySelector("#dropId");

    dropId.addEventListener("click",function(){
        
            Swal.fire({
              title: '정말로 회원탈퇴 하시겠습니까?',
              text: "다시 되돌릴 수 없습니다. ",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '승인',
              cancelButtonText: '취소',
              reverseButtons: true, // 버튼 순서 거꾸로
              
            }).then((result) => {
              if (result.isConfirmed) {
                
                



                Swal.fire(
                    
                  '회원탈퇴가 완료되었습니다.',
                  '언젠가 다시 만나요',
                  'success'
                ).then((result) => {
                    updateForm.action = "./dropMember";
                    updateForm.submit();
                })

                setTimeout(() => {
                    updateForm.action = "./dropMember";
                    updateForm.submit();
                }, 3000)
    
                
              }
            })
          
     



    });



}








// 비밀번호 변경 페이지 부분
function updatePw() {

    const pwCheckBtn = document.querySelector("#pwCheckBtn");
    const password = document.querySelector("#password");
    const pwCheckDiv = document.querySelector("#pwCheckDiv");
    const pwUpdateDiv = document.querySelector("#pwUpdateDiv");
    const pwUpdateBtn = document.querySelector("#pwUpdateBtn");
    const pwUpdateForm = document.querySelector("#pwUpdateForm");
    const newPassword = document.querySelector("#newPassword");
    const newPasswordCheck = document.querySelector("#newPasswordCheck");
    const defaultPw = document.querySelector("#defaultPw");
    const Pvalue = defaultPw.value;
    defaultPw.remove();




    pwCheckBtn.addEventListener("click",function(){
        
        if( password.value == Pvalue){
    
            pwCheckDiv.classList.toggle("pf-hidden");
            pwUpdateDiv.classList.toggle("pf-hidden");

        }else{

            Swal.fire({
                title: "비밀번호가 일치하지 않습니다.",
                
                icon: "error"

            } )

        }

        



    })


    pwUpdateBtn.addEventListener("click",function(){

        if( newPassword.value == newPasswordCheck.value){
            Swal.fire({
                title: '비밀번호를 변경하시겠습니까?',
                text: "",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로
                
              }).then((result) => {
                if (result.isConfirmed) {
                  Swal.fire({
                    title: "비밀번호 변경이 완료되었습니다.",
                    icon: "success"

                } ).then((result) => {
                    pwUpdateForm.submit();
                  })
  
                }
              }
              
              )
        }else{
                Swal.fire({
                    title: "비밀번호가 일치하지 않습니다.",
                    
                    icon: "error"

                } )
        }

            
          
          
     



    })


}

function addDelivery(){
    const deliveryBtn = document.querySelector("#deliveryBtn");
    const deliveryForm = document.querySelector("#deliveryForm");

    deliveryBtn.addEventListener("click",function(){

        // check


        //submit
        deliveryForm.submit();



    })




}


function delivery(){

    const delUpdateBtn = document.querySelector("#delUpdateBtn");
    const deliveryForm = document.querySelector("#deliveryForm");
    const deliveryHead = document.querySelector("#deliveryHead");
    const phoneF = document.querySelector("#phoneFirst");
    const phoneM = document.querySelector("#phoneMiddle");
    const phoneL = document.querySelector("#phoneLast");
    const submitPhone = document.querySelector("#submitPhone");
    const deleteBtn = document.querySelector("#delDeleteBtn");

    let splitPhone =  submitPhone.value.split("-");

    if(splitPhone != ""){
        phoneF.value = splitPhone[0];
        phoneM.value = splitPhone[1];
        phoneL.value = splitPhone[2];

    }

    delUpdateBtn.addEventListener("click",function(){

    let phoneValue = phoneF.value + "-" + phoneM.value + "-" + phoneL.value;
    submitPhone.value = phoneValue;
    var regex = /[^0-9]/g;	
    let results = location.search.replaceAll(regex,"");
    const addressinput = document.querySelector("#addressinput");
        
    console.log("addressinput.value" +addressinput.value);
        if(results == '3'||addressinput.value==""){
           

           Swal.fire({
            title: "배송지 저장 성공",
            icon: "success"

        } ).then((result) => {
            deliveryForm.action="./addDelivery";
            deliveryForm.submit();
        })
           
        }else{

            Swal.fire({
                title: "배송지 수정 성공",
                icon: "success"
    
            } ).then((result) => {
                deliveryForm.submit();
            })
        }


    })

    deleteBtn.addEventListener("click", function(){

        

        Swal.fire({
            title: "정말로 삭제하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true
        } ).then((result) => {
            if (result.isConfirmed) {
                deliveryForm.action="./deleteDelivery";
                deliveryForm.submit();
            }
           
        })

        


    })
  
}
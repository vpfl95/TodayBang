
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
            input.style.borderColor = 'red';
            input.nextSibling.style.color = 'red';

            if(input == pwCheck){
                password.previousSibling.previousSibling.style.color='red';
                password.style.borderColor = 'red';

            }



        }else{
            
            input.previousSibling.previousSibling.style.color='';
            input.style.borderColor = '';
            

            if(input == pwCheck){
                password.previousSibling.previousSibling.style.color='';
                password.style.borderColor = '';

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


    // 중복 확인 부분
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



    joinBtn.addEventListener("click",function(){

        
        
        





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
            console.log("clcicc")


            for(ct of myPagelist){
                ct.style.color = "";
            }
            event.target.style.color = "#38b9e0";

            if(event.target.id == "myPage-profile"){
    
                 arr = ['프로필 홈', '내정보수정', '배송내역'];
                 url = ['store/url1', 'store/url2', 'store/url3'];
        
                if(arr.length != url.length){
                    console.log(" arr url 사이즈 다름");
                    return;
                }
            }else if(event.target.id == "myPage-shopping"){
    
                 arr = ['쇼핑 홈', 'ㅂㅈㄷ', 'ㄷㄷㅈㄷㅈㄷ'];
                 url = ['store/url1', 'store/url2', 'store/url3'];
        
                if(arr.length != url.length){
                    console.log(" arr url 사이즈 다름");
                    return;
                }
            }else if(event.target.id == "myPage-write"){
    
                 arr = ['프ㅌㅋㅊㅌㅋ로필 홈', 'ㅋㅌㅊ', 'ㅊㅊ'];
                 url = ['store/url1', 'store/url2', 'store/url3'];
        
                if(arr.length != url.length){
                    console.log(" arr url 사이즈 다름");
                    return;
                }
            }




            profileCategory(event.target , arr , url);
            
        })


    }
    

    function profileCategory(cate , arr , url){

        const subMenu = document.querySelector("#myPage-2");

        for(let i = 0 ; i < subMenu.children.length ; ){
            subMenu.children[i].remove();
        }
    
        
    
    
    
            for(let i = 0 ; i < arr.length; i ++){
                let li = document.createElement("li");
                let liText = document.createTextNode(arr[i]);
                let liAttri = document.createAttribute("class");
                liAttri.value = "submenuList";
                li.setAttributeNode(liAttri);
                li.appendChild(liText);
                subMenu.append(li);
            }



    }


    


}


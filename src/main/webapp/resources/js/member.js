
//회원가입 부분
function join(){

    const userId = document.querySelector("#userId");
    const password = document.querySelector("#password");
    const pwCheck = document.querySelector("#pwCheck");
    const nickname = document.querySelector("#nickname");
    const userName = document.querySelector("#userName");
    const phone = document.querySelector("#phone");
    const email = document.querySelector("#email");
    let message = "";
    



    userId.addEventListener("keyup",function(){

        console.log("keyup");
        if(userId.value.length < 3){
            
            message = "ID는 2글자 이상"
        }else{

            message = ""

        }



        textmessage(userId,message);;
    })

    password.addEventListener("blur",function(){

        

        if(pwCheck.value == ""){
            

        }else if(password.value != pwCheck.value){
            message = "비밀번호가 일치 하지 않습니다.";;

        }else{

            console.log("nice");
            message = "비밀번호가 일치 합니다.";
        }
        textmessage(pwCheck,message);
    })
    pwCheck.addEventListener("blur",function(){

        if(password.value == ""){
            

        }else if(password.value != pwCheck.value){
            message = "비밀번호가 일치 하지 않습니다.";

        }else{

            
            message = "비밀번호가 일치 합니다.";
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
        
            console.log("생성" + input.nextSibling.id);
            input.after(text);
            text.innerText= message;
            text.setAttributeNode(textArr);

        

        

    }




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
            console.log("click" + check);
            // check 박스 빨갛게 표시
    
        }
    })
    
    
    joinAllCheck.addEventListener("click",function(){
        console.log("click");
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




//회원가입 부분
function join(){

    const userId = document.querySelector("#userId");
    const password = document.querySelector("#password");
    const pwCheck = document.querySelector("#pwCheck");
    const nickname = document.querySelector("#nickname");
    const userName = document.querySelector("#userName");
    const phone = document.querySelector("#phone");
    const email = document.querySelector("#email");
    const joinBtn = document.querySelector("#joinBtn");
    let message = "";
    
    const nonOverlab = document.getElementsByClassName("nonOverlab");


    userId.addEventListener("keyup",function(){

        
        if(userId.value.length < 3){
            
            message = "ID는 2글자 이상"
        }else{

            message = ""

        }



        textmessage(userId,message);;
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
        console.log("tt" + textArr.value);
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

    nonOverlab


    for(NOL of nonOverlab){
        NOL.addEventListener("blur", function(event){

            console.log(event.target.value);
            
            if(event.target.value != ""){
                const xhttp = new XMLHttpRequest();

                xhttp.open("POST","./joinOverlab");
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send(event.target.id +"="+ event.target.value)
                
                xhttp.onreadystatechange= function(){

                    if(xhttp.readyState == 4 && xhttp.status ==200){
                        let result = xhttp.responseText.trim();
                        
                        if(result == 0){
                            console.log("사용불가");
                            message = "이미 사용중인 " +event.target.previousSibling.previousSibling.innerText + "입니다." ;
                            textmessage(event.target,message);


                        }else if(result == 1){
                            message = ""
                            textmessage(event.target,message);
                            console.log("사용가능");

                        }

                    }

                }

            }
            

        })

    }


    function checkOverlab() {
NOL.addEventListener("blur", function(event){

            console.log(event.target.value);
            
            if(event.target.value != ""){
                const xhttp = new XMLHttpRequest();

                xhttp.open("POST","./joinOverlab");
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send(event.target.id +"="+ event.target.value)
                
                xhttp.onreadystatechange= function(){

                    if(xhttp.readyState == 4 && xhttp.status ==200){
                        let result = xhttp.responseText.trim();
                        
                        if(result == 0){
                            console.log("사용불가");
                            message = "이미 사용중인 " +event.target.previousSibling.previousSibling.innerText + "입니다." ;
                            textmessage(event.target,message);


                        }else if(result == 1){
                            message = ""
                            textmessage(event.target,message);
                            console.log("사용가능");

                        }

                    }

                }

            }
            

        })


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



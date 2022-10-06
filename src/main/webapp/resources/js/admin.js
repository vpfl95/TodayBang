function getParam() {
    
    let param;
    
    var regex = /[^0-9^=^F^s^p]/g;	

    let results = location.search.replaceAll(regex,"");
    param = results.split("F=");
            //?page=2&kind=&search=?memberFilter=1&memberFilter=2
            // p=1s=1=5=10=20=40 
    console.log(results);
    console.log(param);
    const checkbox = document.getElementsByTagName("input");
    let pass = false;
    
    const searchIn = document.querySelector("#search");

    let param1 = param[0].split("s=");
    
    // p = 2 s = 2 // s = 3
    console.log("search = " + param1);
    if(param1[1] != undefined){
        searchIn.value = param1[1];

    }
    
   



    for(par of param){ // p 2s 3 10 1
        
        console.log("비교 pa" + par);


        for(ch of checkbox){
            if(ch.name == "memberFilter"){
                if(ch.value == par){

                   ch.checked = true;


                }

            }
            
        }
    }
}

function member(){

    const memberClass = document.getElementsByClassName("memberClass");
    const memberDiv = document.querySelector("#memberDiv");
    const member = document.querySelector("#member");
    memberDiv.addEventListener("click",function(event){

        if(event.target.value == 5){
            for(mem of memberClass){
                mem.checked = event.target.checked;
            }
        }else{
            let checked = true;
            for(mem of memberClass){
                if(!mem.checked){
                    checked =false;
                }
            }
                member.checked = checked;
            
        }
    })


    const operatorClass = document.getElementsByClassName("operatorClass");
    const operatorDiv = document.querySelector("#operatorDiv");
    const operator = document.querySelector("#operator");
    operatorDiv.addEventListener("click",function(event){

        if(event.target.value == 0){
            for(mem of operatorClass){
                mem.checked = event.target.checked;
            }
        }else{
            let checked = true;
            for(mem of operatorClass){
                if(!mem.checked){
                    checked =false;
                }
            }
            operator.checked = checked;
            
        }
    })

    const OnlyBan = document.querySelector("#OnlyBan");
    const OnlyNoBan = document.querySelector("#OnlyNoBan");

    OnlyBan.addEventListener("click",function(){
        if(OnlyBan.checked){
            OnlyNoBan.checked = false;
        }
    })
    OnlyNoBan.addEventListener("click",function(){
        if(OnlyNoBan.checked){
            OnlyBan.checked = false;
        }
    })

    
    const operatorKindLabel = document.getElementsByClassName("operatorKindLabel");
    const operatorKind =  document.getElementsByClassName("operatorKind");
    const operatorKindTd =  document.getElementsByClassName("operatorKindTd");
    for(opKL of operatorKindLabel){
        opKL.addEventListener("mouseover",function(event){
            
            event.target.classList.toggle("hidden");
            
            event.target.nextSibling.nextSibling.classList.toggle("hidden");
        })
            


        let select =  opKL.getAttribute("data-a");
        
            for(op of opKL.nextSibling.nextSibling.options){
                if(op.value == select){
                    op.selected = true;
                }
            }
        
    }
  

    for(opK of operatorKind){
        opK.addEventListener("mouseleave",function(event){
            
                    event.target.classList.toggle("hidden");
                    
                    event.target.previousSibling.previousSibling.classList.toggle("hidden");
        })
            
        opK.addEventListener("change",function(event){
            let url =event.target.getAttribute("data-a")
            let roleNum;
            for(op of event.target.options){
                if(op.selected == true){
                    roleNum = op.value;

                }
                
            }

            
            console.log("change" +url+"&roleNum=" + roleNum)

            const xhttp = new XMLHttpRequest();

            xhttp.open("GET",url +"&roleNum=" + roleNum);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send();
            xhttp.onreadystatechange= function(){

                if(xhttp.readyState == 4 && xhttp.status ==200){
                    let result = xhttp.responseText.trim();
                    console.log("AJAX")
                    if(result == 0){
                        console.log("result == 0")

                    }else if(result == 1){
                        console.log("result == 1")
                        
                    }
                }
            }







        })
    }
   
    




}
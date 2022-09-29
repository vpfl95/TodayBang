function getParam() {
    
    let param;
    
    var regex = /[^0-9^=^p]/g;	

    let results = location.search.replaceAll(regex,"");
    param = results.split("=");
            //?page=2&kind=&search=?memberFilter=1&memberFilter=2
            // 
    console.log(results);
    console.log(param);
    const checkbox = document.getElementsByTagName("input");
    let pass = false;
    for(par of param){ // p 2 10 1
        if(par == "p"){
            pass=true;
            continue;

        }
        if(pass==true){
            pass = false;
            continue;
        }

        console.log("비교 pa" + par);


        for(ch of checkbox){

            if(ch.value == par){

                ch.checked = true;


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
}
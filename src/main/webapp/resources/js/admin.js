function getParam() {
    
    let param;
    
    var regex = /[^0-9^=]/g;	

    let results = location.search.replaceAll(regex,"");
    param = results.split("=");
            
    
    const checkbox = document.getElementsByTagName("input");

    for(par of param){
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
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
}
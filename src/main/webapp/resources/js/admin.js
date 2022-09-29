
function member() {

    let param;
    getParameter();
    
    
    


    function getParameter(name) {
           //?memberFilter=1&memberFilter=2&memberFilter=13
           var regex = /[^0-9^=]/g;	

           let results = location.search.replaceAll(regex,"");
           console.log(results);
            param = results.split("=");
            console.log(param);
    }


    const checkbox = document.getElementsByTagName("input");

    for(par of param){
        for(ch of checkbox){

            if(ch.value == par){

                ch.checked = true;


            }



        }



    }



}





function board() {

    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    const boardUpdateBtn = document.querySelector("#boardUpdateBtn");
    boardBtn.addEventListener("click",function(){

        if(boardBtn.title == "update"){

            boardForm.action = "./update";

        }
        boardForm.submit();

        


    })

  

}


function answer(){
    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");

    boardBtn.addEventListener("click",function(){
        if(boardBtn.title == "update"){
            boardForm.action = "./updateAnswer";
        }
        boardForm.submit();

        


    })

}
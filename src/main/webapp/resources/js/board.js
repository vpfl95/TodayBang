




function board() {

    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    const fileInputDiv = document.querySelector("#fileInputDiv");


    boardBtn.addEventListener("click",function(){


        Swal.fire({
            title: "게시하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#61b6dc',
            
            confirmButtonText: '수정',
            cancelButtonText: '취소',
            reverseButtons: true
        } ).then((result) => {
            if (result.isConfirmed) {


                if(boardBtn.title == "update"){

            
                    boardForm.action = "./update";
        
                    const boardFile = document.getElementsByClassName("boardFile");
                    const boardNum = document.querySelector("#boardNum");
                   
                    let noNumber = 0;
        
                    console.log("title = " +fileInputDiv.title);
                    console.log("title = " +boardFile.length);
                    for(let i = 1 ; i <= fileInputDiv.title ; i ++ ){
                        let check = false;
                        for(boF of boardFile){
                            if(boF.title == i){
                                check = true;
                                // 있다.
                                break;
                            }else{
                                // i 가 없는 번호
                               
                            }
                        }
        
                        if(!check){
                            noNumber += 1;
                        }
                        
                        console.log("noNum" + noNumber);
        
                    }
                    console.log("noNum" + noNumber);
                    let input = document.createElement("input");
                    let inputArr = document.createAttribute("type");
                    inputArr.value = "hidden";
                    input.setAttributeNode(inputArr);
                    inputArr = document.createAttribute("name");
                    inputArr.value = "number";
                    input.setAttributeNode(inputArr);
        
                    inputArr = document.createAttribute("value");
                    inputArr.value = noNumber;
                    input.setAttributeNode(inputArr);
                    fileInputDiv.append(input);
        
                }
               boardForm.submit();













                
               
            }
           
        })

        

    })


}


function answer(){
    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    
    boardBtn.addEventListener("click",function(){



        Swal.fire({
            title: "게시하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#61b6dc',
            
            confirmButtonText: '수정',
            cancelButtonText: '취소',
            reverseButtons: true
        } ).then((result) => {
            if (result.isConfirmed) {


                if(boardBtn.title == "update"){
                    boardForm.action = "./updateAnswer";
                    const boardFile = document.getElementsByClassName("boardFile");
                    const boardNum = document.querySelector("#boardNum");
                   
                    let noNumber = "";
        
                    console.log("title = " +fileInputDiv.title);
                    console.log("title = " +boardFile.length);
                    for(let i = 1 ; i <= fileInputDiv.title ; i ++ ){
                        let check = false;
                        for(boF of boardFile){
                            if(boF.title == i){
                                check = true;
                                // 있다.
                                break;
                            }else{
                                // i 가 없는 번호
                               
                            }
                        }
        
                        if(!check){
                            noNumber += i;
                        }
                        
                        console.log("noNum" + noNumber);
        
                    }
                    
                    let input = document.createElement("input");
                    let inputArr = document.createAttribute("type");
                    inputArr.value = "hidden";
                    input.setAttributeNode(inputArr);
                    inputArr = document.createAttribute("name");
                    inputArr.value = "number";
                    input.setAttributeNode(inputArr);
        
                    inputArr = document.createAttribute("value");
                    inputArr.value = noNumber;
                    input.setAttributeNode(inputArr);
                    fileInputDiv.append(input);
        
                }
               boardForm.submit();










            }

        })

       

        


    })
    
}


function fileJs() {
    const addFileBtn = document.querySelector("#addFileBtn");
    const fileInputDiv = document.querySelector("#fileInputDiv");
    
    
    let countFile = fileInputDiv.getElementsByTagName("input").length;
    let title  = fileInputDiv.getElementsByTagName("input").length;
    addFileBtn.addEventListener("click",function(){
        

        if(countFile < 3){
            countFile ++;
            title++;

            let div = document.createElement("div");

            let input = document.createElement("input");

            let inputArr = document.createAttribute("type");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            


            inputArr = document.createAttribute("id");
            inputArr.value = "file" + title;
            input.setAttributeNode(inputArr);

                let label = document.createElement("label");
                let labelArr = document.createAttribute("for");
                labelArr.value = inputArr.value;
                label.setAttributeNode(labelArr);

                labelArr= document.createTextNode("파일선택");
                label.appendChild(labelArr);

            inputArr = document.createAttribute("name");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("class");
            inputArr.value = "form-control boardFile hideBoardFile";
            input.setAttributeNode(inputArr);
    
            

                let deleteFile = document.createElement("span");
                let deleteFileAttr = document.createTextNode("❌");
                
                deleteFile.appendChild(deleteFileAttr);

                deleteFileAttr = document.createAttribute("class");
                deleteFileAttr.value = "boardFileDelete";
                deleteFile.setAttributeNode(deleteFileAttr);

                deleteFileAttr = document.createAttribute("title");
                deleteFileAttr.value = title;
                deleteFile.setAttributeNode(deleteFileAttr);

            
            fileInputDiv.append(div);
            fileInputDiv.append(label);
            fileInputDiv.append(input);
            fileInputDiv.append(deleteFile);
            input.click();
        }else{

            alert("파일은 3개까지만 추가가 가능합니다 .")
        }
       



    })


    fileInputDiv.addEventListener("click",function(event){

        if(event.target.className == "boardFileDelete"){
            
            if(countFile >0){
                countFile--;
               console.log("delete")
               ;
           
                for(ch of fileInputDiv.children){
                    if(ch.id == "file"+event.target.title){
                         event.target.previousElementSibling.previousElementSibling.remove();
                        ch.remove();
                        event.target.remove();
                        
                    }
                    
                    
                }




            }

        }


        let boardFile = document.getElementsByClassName("boardFile");
        for(BF of boardFile){

            BF.addEventListener("change",function(event){
                              
                let fileValue = event.target.value.split('\\');
                event.target.previousElementSibling.innerText = fileValue[2];

            })


        }


       

    })


    



}


function board2() {


    const boardDeleteBtn =document.getElementsByClassName("boardDeleteBtn");
    const boardUpdateBtn =document.getElementsByClassName("boardUpdateBtn");
    const submitBoardBtn =document.getElementsByClassName("submitBoardBtn");
    
    for(bd of boardDeleteBtn){

        bd.addEventListener("click",function(event){


            Swal.fire({
                title: "정말로 삭제하시겠습니까?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: '#61b6dc',
                
                confirmButtonText: '삭제', 
                cancelButtonText: '취소',
                reverseButtons: true
            } ).then((result) => {
                if (result.isConfirmed) {


                    Swal.fire({
                        title: "삭제 되었습니다.",
                        icon: "success",
                        confirmButtonColor: '#61b6dc',
                        
                        confirmButtonText: '확인'
                    } ).then((result) => {
                        if (result.isConfirmed) {
                            let atag=event.target.getAttribute("data-a");
                            location.href = atag;
                        }


                    })
                }
               
            })



        })

    }        

    for(bu of boardUpdateBtn){

        bu.addEventListener("click",function(event){

            let atag=event.target.getAttribute("data-a");
            location.href = atag;



        })

    }   

  







}
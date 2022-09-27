




function board() {

    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    const boardUpdateBtn = document.querySelector("#boardUpdateBtn");
    const addFileBtn = document.querySelector("#addFileBtn");
    const fileInputDiv = document.querySelector("#fileInputDiv");
   
    boardBtn.addEventListener("click",function(){

        if(boardBtn.title == "update"){

            boardForm.action = "./update";

        }
        boardForm.submit();

        


    })

    let countFile = 0;
    let title = 0;
    addFileBtn.addEventListener("click",function(){
        

        if(countFile < 3){
            countFile ++;
            title++;
            let input = document.createElement("input");

            let inputArr = document.createAttribute("type");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("id");
            inputArr.value = "file" + title;
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("name");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("class");
            inputArr.value = "form-control boardFile";
            input.setAttributeNode(inputArr);
    
            

                let deleteFile = document.createElement("button");
                let deleteFileAttr = document.createTextNode("파일삭제");
                
                deleteFile.appendChild(deleteFileAttr);

                deleteFileAttr = document.createAttribute("class");
                deleteFileAttr.value = "boardFileDelete";
                deleteFile.setAttributeNode(deleteFileAttr);

                deleteFileAttr = document.createAttribute("title");
                deleteFileAttr.value = title;
                deleteFile.setAttributeNode(deleteFileAttr);


            
            fileInputDiv.append(input);
            fileInputDiv.append(deleteFile);
        }else{

            alert("파일은 3개까지만 추가가 가능합니다 .")
        }
       



    })


    fileInputDiv.addEventListener("click",function(event){

        if(event.target.className == "boardFileDelete"){
            console.log("click" + countFile)
            console.log("click" + event.target.className)
            if(countFile >0){
                countFile--;
                console.log("파일 삭제"+event.target.title)
           
                for(ch of fileInputDiv.children){
                    if(ch.id == "file"+event.target.title){
                        ch.remove();
                        event.target.remove();

                    }


                }




            }

        }

    })



  

}


function answer(){
    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    const addFileBtn = document.querySelector("#addFileBtn");
    const fileInputDiv = document.querySelector("#fileInputDiv");
    boardBtn.addEventListener("click",function(){
        if(boardBtn.title == "update"){
            boardForm.action = "./updateAnswer";
        }
        boardForm.submit();

        


    })
    let countFile = 0;
    let title = 0;
    addFileBtn.addEventListener("click",function(){
        

        if(countFile < 3){
            countFile ++;
            title++;
            let input = document.createElement("input");

            let inputArr = document.createAttribute("type");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("id");
            inputArr.value = "file" + title;
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("name");
            inputArr.value = "file";
            input.setAttributeNode(inputArr);
    
            inputArr = document.createAttribute("class");
            inputArr.value = "form-control boardFile";
            input.setAttributeNode(inputArr);
    
            

                let deleteFile = document.createElement("button");
                let deleteFileAttr = document.createTextNode("파일삭제");
                
                deleteFile.appendChild(deleteFileAttr);

                deleteFileAttr = document.createAttribute("class");
                deleteFileAttr.value = "boardFileDelete";
                deleteFile.setAttributeNode(deleteFileAttr);

                deleteFileAttr = document.createAttribute("title");
                deleteFileAttr.value = title;
                deleteFile.setAttributeNode(deleteFileAttr);


            
            fileInputDiv.append(input);
            fileInputDiv.append(deleteFile);
        }else{

            alert("파일은 3개까지만 추가가 가능합니다 .")
        }
       



    })


    fileInputDiv.addEventListener("click",function(event){

        if(event.target.className == "boardFileDelete"){
            console.log("click" + countFile)
            console.log("click" + event.target.className)
            if(countFile >0){
                countFile--;
                console.log("파일 삭제"+event.target.title)
           
                for(ch of fileInputDiv.children){
                    if(ch.id == "file"+event.target.title){
                        ch.remove();
                        event.target.remove();

                    }


                }




            }

        }

    })
}
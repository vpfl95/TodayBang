




function board() {

    const boardBtn = document.querySelector("#boardBtn");
    const boardForm = document.querySelector("#boardForm");
    
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


function fileJs() {
    const addFileBtn = document.querySelector("#addFileBtn");
    const fileInputDiv = document.querySelector("#fileInputDiv");


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
    
            

                let deleteFile = document.createElement("button");
                let deleteFileAttr = document.createTextNode("파일삭제");
                
                deleteFile.appendChild(deleteFileAttr);

                deleteFileAttr = document.createAttribute("class");
                deleteFileAttr.value = "boardFileDelete";
                deleteFile.setAttributeNode(deleteFileAttr);

                deleteFileAttr = document.createAttribute("title");
                deleteFileAttr.value = title;
                deleteFile.setAttributeNode(deleteFileAttr);


            fileInputDiv.append(label);
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
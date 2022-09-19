const subMenu = document.querySelector("#subMenu");
const menus = document.getElementsByClassName("menu");
const header = document.querySelector("#header");




for(mn of menus){

    mn.addEventListener("mouseover", function(event){
        
        for(mn of menus){

            mn.style.color = "";

        }

        event.target.style.color = "#38b9e0";


        if(subMenu.previousElementSibling != null){
            subMenu.previousElementSibling.remove();

        } 

        let li = document.createElement("hr");
        let liAttri = document.createAttribute("id");
        liAttri.value = "hr";
        li.setAttributeNode(liAttri);
        subMenu.before(li);

        if(event.target.id == "storeMenu"){

            let arr = ['스토어 홈', '카테고리', '오늘의딜'];
            let url = ['store/url1', 'store/url2', 'store/url3'];

            profileCategory(event.target , arr , url)

        }else if(event.target.id == "roomMenu"){

            let arr = ['직방 홈', '아파트', '빌라'];
            let url = ['store/url1', 'store/url2', 'store/url3'];

           
            profileCategory(event.target , arr , url)

        }else if(event.target.id == "comMenu"){

            let arr = ['커뮤니티 홈', '이달의 회원', '내 게시글 보기','사진','집들이','노하우'];
            let url = ['store/url1', 'store/url2', 'store/url3', 'store/url3', 'store/url3', 'store/url3'];


            profileCategory(event.target , arr , url)

        }else if(event.target.id == "serviceMenu"){

            let arr = ['공지사항', 'QnA'];
            let url = ['store/url1', 'store/url2'];


            profileCategory(event.target , arr , url)

        }
    
    
    })


   

    header.addEventListener("mouseleave", function(event){

        for(mn of menus){

            mn.style.color = "";

        }


    })

}



function profileCategory(cate , arr , url){



    for(let i = 0 ; i < subMenu.children.length ; ){
        subMenu.children[i].remove();
    }

    if(arr.length != url.length){
        console.log(" arr url 사이즈 다름");
        return;
    }



        for(let i = 0 ; i < arr.length; i ++){
            let li = document.createElement("li");
            let liText = document.createTextNode(arr[i]);
            let liAttri = document.createAttribute("class");
            liAttri.value = "submenuList";
            li.setAttributeNode(liAttri);

            li.appendChild(liText);
            subMenu.append(li);
        }



}



subMenu.addEventListener("mouseover",function(event){

  

    const submenuList = document.querySelectorAll(".submenuList");

    for(sub of submenuList){
        if(event.target == sub){
            sub.style.color = "#38b9e0";


        }else{
            sub.style.color = "";
        }

    }




})
const subMenu = document.querySelector("#subMenu");
const menus = document.getElementsByClassName("menu");
const header = document.querySelector("#header");




for(mn of menus){

    mn.addEventListener("mouseover", function(event){
        let arr;
        let url;


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

             arr = ['스토어 홈', '카테고리', '오늘의딜'];
             url = ['store/url1', 'store/url2', 'store/url3'];

        }else if(event.target.id == "roomMenu"){

             arr = ['직방 홈', '아파트', '빌라'];
             url = ['store/url1', 'store/url2', 'store/url3'];

        }else if(event.target.id == "comMenu"){

             arr = ['커뮤니티 홈', '이달의 회원', '내 게시글 보기','사진','집들이','노하우'];
             url = ['store/url1', 'store/url2', 'store/url3', 'store/url4', 'store/url5', 'store/url6'];


        }else if(event.target.id == "serviceMenu"){

             arr = ['공지사항', 'QnA'];
             url = ['/service/notice', '/service/qna'];



        }
        headerCategory(event.target , arr , url)
    
    })


   

    header.addEventListener("mouseleave", function(event){

        for(mn of menus){

            mn.style.color = "";

        }


    })

}



function headerCategory(cate , arr , url){



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
            

            let a = document.createElement("a");
            aAttri = document.createAttribute("href");
            aAttri.value = url[i];
            a.setAttributeNode(aAttri);


            aAttri = document.createAttribute("class");
            aAttri.value = "submenuList";
            a.setAttributeNode(aAttri);


            
            a.appendChild(liText);
            li.appendChild(a);
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
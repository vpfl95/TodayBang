const subMenu = document.querySelector("#subMenu");
const menus = document.getElementsByClassName("menu");
const header = document.querySelector("#header");
const loginBtn = document.querySelector("#loginBtn");

let defaultSelected=null ;


for(mn of menus){

    mn.addEventListener("mouseover", function(event){
       

        for(mn of menus){

            mn.style.color = "";
            mn.classList.remove("selectColor");
            
        }

        

        event.target.classList.add("selectColor");


        if(subMenu.previousElementSibling != null){
            subMenu.previousElementSibling.remove();

        } 

        let li = document.createElement("hr");
        let liAttri = document.createAttribute("id");
        liAttri.value = "hr";
        li.setAttributeNode(liAttri);
        subMenu.before(li);

        
        headerCategory(event.target.id);
    
    })
    mn.addEventListener("mouseleave", function(event){

        event.target.classList.remove("selectColor");

    })
}





function headerCategory(cate){

    let arr = null;
    let url = null;

    
    if(cate == "storeMenu"){
        
        arr = ['스토어 홈', '카테고리', '오늘의딜', '리퍼마켓', '오!굿즈', '빠른배송', '기획전'];
        url = ['/store', '/category/main?category=3', '/todayDeals', '/exhibitions/detail?exhibitionCode=1433', '/exhibitions/detail?exhibitionCode=2181', '/exhibitions/detail?exhibitionCode=1763', '/exhibitions/main'];
    
    } else if(cate == "roomMenu"){

        arr = ['아파트', '빌라'];
        url = ['/apt/map', '/villa/map'];

   
   }else if(cate == "serviceMenu"){

        arr = ['공지사항', 'QnA'];
        url = ['/service/notice/list', '/service/qna/list'];



   } 



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







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<header class="p-3 mb-3 border-bottom fixed-top text-bg-white" id = "header">
    <div class="container mt-2">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
         <img alt="" src="/resources/images/MainLogo.png" width="230px">
        </a>
		<div></div>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mt-3 " id="homeCate">
          <li><a href="/store" class=" px-2  fs-5 menu" id= "storeMenu">스토어</a>
    		</li>	
    			
          <li><a href="/apt/map" class=" px-2  fs-5 menu" id= "roomMenu">방구하기</a>
   			</li>
          <li><a href="/community/home" class=" px-2  fs-5 menu" id= "comMenu">커뮤니티</a></li>
          <li><a href="/service/notice/list" class=" px-2  fs-5 menu" id= "serviceMenu">고객센터</a></li>
        </ul>

       <!--  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control" placeholder="검색" aria-label="Search">
        </form> -->

        <div class="dropdown text-end ">
        
        	
        
        
	       	<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mt-3">
	       	
	       		<c:if test="${empty member }">
       			 <!-- 로그인 XXX -->
	        		<li><a id="loginBtn" href="/member/login" class="nav-link px-2 link-secondary">로그인</a></li>
		         	<li><div style="flex: 0 0 auto; width: 1px; height: 16px; margin-top:13px; margin-left: 8px; margin-right: 8px; background: rgba(55, 53, 47, 0.16);"></div></li>
		         	<li><a href="/member/joinCheck" class="nav-link px-2 link-secondary">회원가입</a></li>
	        
        		</c:if>
        		<c:if test="${not empty member }">
        		
        			<c:if test="${member.roleDTOs[0].roleNum eq 1 }">
        			<li><a href="/admin/main" class="nav-link px-2 link-secondary">관리자 페이지</a></li>
        			<li><div style="flex: 0 0 auto; width: 1px; height: 16px; margin-top:13px; margin-left: 8px; margin-right: 8px; background: rgba(55, 53, 47, 0.16);"></div></li>
		         	
        			
        			</c:if>
        		<!-- 로그인 OOO -->
        			<li><a href="/member/myPage" class="nav-link px-2 link-secondary">마이페이지</a></li>
		         	<li><div style="flex: 0 0 auto; width: 1px; height: 16px; margin-top:13px; margin-left: 8px; margin-right: 8px; background: rgba(55, 53, 47, 0.16);"></div></li>
		         	<li><a href="/member/logout" class="nav-link px-2 link-secondary">로그아웃</a></li>
        		</c:if>
	          </ul>
        
     
        </div>
      </div>
    </div>
    
    
     <div>
	    	<ul	class = "hide" id = "subMenu">
	    		
			    		<!-- 리스트 들어가는 영역 -->
	    	</ul>
    
     	</div>
     
    
    
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="/resources/js/header.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>    $(document).ready(function(){
     				var submenu = $(".hide");
    				var url = location.href.split("/");
    	        	$(".menu").mouseover(function(){            
						submenu.slideDown(150);        
					})
					
					$("header").mouseleave(function(){
    		                         
    		            if( submenu.is(":visible") ){
   			                submenu.slideUp(150);       
   							$("#hr").remove();     
    					}     
    				});   
    				
    				$(".menu").each (function(index,me){
    					
    					var tag = me.href;
    					tag = tag.split("/",4);
    					
    					
    					if(url[3] ==  tag[3]){
    						$(this).addClass('selectColor');
    						let title = document.createAttribute("title");
    				        title.value = "selected";
    				        me.setAttributeNode(title);
    					}else if(url[3] == "exhibitions" && index == 0){
    						$(this).addClass('selectColor');
    						let title = document.createAttribute("title");
    				        title.value = "selected";
    				        me.setAttributeNode(title);
    						
    						
    					}
    				});
   				});
    
    /* header scroll down  */
    	window.addEventListener('wheel', (e) => { 
    		var submenu = $(".hide");
    		var linkArr =  document.location.href.split("/");
    		var linkArr2 = linkArr[4].split("?");
    		
    		var storeMenu = $("#storeMenu");
    		
        if(e.deltaY < 0){

        	if(linkArr2[0] != "myPage" && linkArr[3] != "admin" && linkArr2[0] != "delivery"){
        		console.log("ll " +  linkArr[3]);
        		
                const hr = document.querySelector("#hr");

                        if(hr){
                            hr.remove();
                        }


               let li = document.createElement("hr");
               let liAttri = document.createAttribute("id");
               liAttri.value = "hr";
               li.setAttributeNode(liAttri);
               subMenu.before(li);
               
               if(linkArr[3] == ""){
            	   headerCategory("storeMenu");
               }else{
            	   $(".menu").each (function(index,me){
   					if(me.title ==  "selected"){
   						headerCategory(me.id);
   				        
   					}
   					});
            	   
               }
               submenu.slideDown(150); 
              
            }
        		

       }else{
        	 if( submenu.is(":visible") ){
    			  submenu.slideUp(150);       
    			$("#hr").remove();     
     		} 
        	
        	
        }


      });
    
    	
    
    
    </script>

   
  </header>
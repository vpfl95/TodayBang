<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="wrap">
<header class="p-3 mb-3 border-bottom fixed-top text-bg-white" id = "header">
    <div class="container mt-2">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/store" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
         <img alt="" src="/resources/images/MainLogo.png" width="230px">
        </a>
		<div></div>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mt-3 " id="homeCate">
          <li><a href="/store" class=" px-2  fs-5 menu" id= "storeMenu">스토어</a></li>	
          <li><a href="/apt/map" class=" px-2  fs-5 menu" id= "roomMenu">방구하기</a></li>
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
        		
        			<c:if test="${ not empty ManagerRole}">
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
    					tag = tag.split("/");
    					
    					
    					if(url[3] ==  tag[3]){
    						$(this).addClass('selectColor');
    						$(this).addClass('selectMenu');
    					}else if(url[3] =="todayDeals"){
    						
    						$("#storeMenu").addClass('selectMenu');
    					}else if(url[3]=="category"){
    						$("#storeMenu").addClass('selectMenu');
    						
    					}else if(url[3]=="exhibitions"){
    						$("#storeMenu").addClass('selectMenu');
    						
    					}
    					else if(url[3]==""){
    						$("#storeMenu").addClass('selectMenu');
    						
    					}
    					
    					
    				});
   				});
    
    /* header scroll down  */
    	window.addEventListener('wheel', (e) => { 
    		var submenu = $(".hide");
    		var linkArr2 =  document.location.href.replace("?","/");
    		var linkArr =  linkArr2.split("/");
    		
    		
    		var storeMenu = $("#storeMenu");
    		
        if(e.deltaY < 0){ // 상단 스크롤

        	if(linkArr[3] != "member" && linkArr[3] != "admin"  // 스크롤 차단
        		&& linkArr[4] != "map"
        	){
        		
        		
                const hr = document.querySelector("#hr");

                        if(hr){
                            hr.remove();
                        }


               let li = document.createElement("hr");
               let liAttri = document.createAttribute("id");
               liAttri.value = "hr";
               li.setAttributeNode(liAttri);
               subMenu.before(li);
               
               if(linkArr[3] == "category"){
            	   headerCategory("storeMenu");
            	
               }else if(linkArr[3] == "todayDeals"){
                	   headerCategory("storeMenu");
            	   
               }else if(linkArr[3] == "exhibitions"){
                	   headerCategory("storeMenu");
            	   
               }
               else if(linkArr[3] == "store"){
            	   headerCategory("storeMenu");
        	   
           		}else if(linkArr[3] == "product"){
            	   headerCategory("storeMenu");
        	   
           		}
               else if (linkArr[3] == "service"){
            	   headerCategory("serviceMenu");
            	   
               }else if(linkArr[3] == ""){
            	   headerCategory("storeMenu");
            	   
          		}
               submenu.slideDown(150); 
              
            }
        		

       }else{ //하단 스크롤
        	 if( submenu.is(":visible") ){
    			  submenu.slideUp(150);       
    			$("#hr").remove();     
     		} 
        	
     		
        	
        }


      });
    
    	
    
    
    </script>

   
  </header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<header class="p-3 mb-3 border-bottom">
    <div class="container mt-2">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
         <img alt="" src="/resources/images/MainLogo.png" width="230px">
        </a>
		<div></div>
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mt-3">
          <li><a href="#" class="nav-link px-2 link-secondary fs-5">스토어</a></li>
          <li><a href="#" class="nav-link px-2 link-dark fs-5">방구하기</a></li>
          <li><a href="#" class="nav-link px-2 link-dark fs-5">커뮤니티</a></li>
          <li><a href="#" class="nav-link px-2 link-dark fs-5">고객센터</a></li>
        </ul>

       <!--  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control" placeholder="검색" aria-label="Search">
        </form> -->

        <div class="dropdown text-end ">
        
	       	<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mt-3">
	          <li><a href="/member/login" class="nav-link px-2 link-secondary">로그인</a></li>
	          <li><div style="flex: 0 0 auto; width: 1px; height: 16px; margin-top:13px; margin-left: 8px; margin-right: 8px; background: rgba(55, 53, 47, 0.16);"></div></li>
	          <li><a href="/member/join" class="nav-link px-2 link-secondary">회원가입</a></li>
	        </ul>
        
          <!-- <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
            <li><a class="dropdown-item" href="#">설정</a></li>
            <li><a class="dropdown-item" href="#">프로필</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul> -->
        </div>
      </div>
    </div>
  </header>
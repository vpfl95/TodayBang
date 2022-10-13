<%@page import="java.util.List"%>
<%@page import="com.goodee.home.member.MemberDTO"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <% 
     
     	String url = "";
     	String param = request.getParameter("page"); 
     
     	if(param == null) param = "1";
     	String [] filter = request.getParameterValues("memberFilter");
     	
     	String param2 = "";
     	if(filter != null ){
     		for(String fi :filter){
         		param2 += "memberFilter=";
         		param2 += fi;
         		param2 += "&";
         		
         		
         		
         	}
     		
     	}
     	String param3 = request.getParameter("search"); 
     	if(param3 == null){
     		param3="";
     		
     	}
     	
     	
     	url="page="+param+"&search="+param3+"&"+param2;
     	
     	
     	
     %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/css/admin/admin.css" rel="stylesheet">
		
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5 ">
				<div class = " col-lg-7 shadowBox" style="padding: 15px">
					<div style="font-weight: 600;font-size: 25px;margin: 20px">회원 관리</div>
					<div style="font-weight: 600;font-size: 20px;color: #47484b; margin-left: 20px">필터</div>
					<hr style="margin: 5px">
					<form action="./member" method="get">
					<input type="text" id = "search"  name="search" placeholder="검색" style="height: 40px; margin-left: 8px; border-radius: 10px; border: 1px solid; margin: 5px 0;">
					<table class = "table">
						<thead>
						</thead>
						<tbody>
							
							<tr id = "operatorDiv">
							
								<th><label for="operator"><input id= "operator" type="checkbox" name= "memberFilter" value="0">운영진</label>
								<td><label for="admin"><input id= "admin" class = "operatorClass" type="checkbox" name= "memberFilter" value="1">관리자</label>
								
								<td><label for="manager"><input id= "manager" class = "operatorClass" type="checkbox" name= "memberFilter" value="2">매니저</label>
								<td><label for="storePartner"><input id= "storePartner" class = "operatorClass" type="checkbox" name= "memberFilter" value="3">스토어 파트너</label>
								<td><label for="zicbangPartner"><input id= "zicbangPartner" class = "operatorClass" type="checkbox" name= "memberFilter" value="4">직방 파트너</label>
							
							</tr>
							
						<tr id = "memberDiv">
							<th><label for="member"><input id= "member"  type="checkbox" name= "memberFilter" value="5">회원</label>
							<td><label for="diamond"><input id= "diamond" class = "memberClass" type="checkbox" name= "memberFilter" value="10">Diamond</label>
							<td><label for="gold"><input id= "gold" class = "memberClass" type="checkbox" name= "memberFilter" value="20">Gold</label>
							
							<td><label for="silver"><input id= "silver" class = "memberClass" type="checkbox" name= "memberFilter" value="30">Silver</label>
							<td><label for="white"><input id= "white" class = "memberClass" type="checkbox" name= "memberFilter" value="40">White</label>
						</tr>
						<tr id = "banDiv">
							<td><label for="OnlyBan"><input id= "OnlyBan" type="checkbox" name= "memberFilter" value="100">OnlyBan</label>
							<td><label for="OnlyNoBan"><input id= "OnlyNoBan" type="checkbox" name= "memberFilter" value="200">OnlyNoBan</label>
						
							<td></td>
							<td></td>
							<td colspan="1"></td>
							
						</tr>
						
							
						
						
							
						</tbody>
					</table>
					<div style="display: flex; justify-content: flex-end; margin-bottom: 20px; ">
							<button type="submit" id="memberFilterBtn" class="boardBlueBtn"  style="font-weight: 600 "> 적용 </button>
							<button type="reset" id="memberFilterResetBtn" class="boardBlueBtn" style="margin-left: 20px;font-weight: 600"> 초기화 </button>
					</div>
					
					</form>
					
					
					
					<div style="font-weight: 600; margin-left: 15px; margin-bottom:15px; font-size: 16px;">[회원 수 : <span style="font-size: 20px">${totalCount }</span>명]</div>
					<table class = "table table-hover">
						<thead>
							<tr>
								
								<th>ID</th>
								<th>NICKNAME</th>
								<th>관리자 등급</th>
								<th>회원 등급 </th>
								<th>접속 가능</th>
							</tr>
						
						
						
						</thead>
						
						<tbody>
						
						
						</tbody>
							<c:forEach items="${memberList}" var="list">
								<c:set var="ban" value="false"/>
								
								<c:if test="${list.roleNum /100 >= 1 }">
									<c:set var="ban" value="true"/>
								</c:if>
								
							
								<c:if test="${ban}">
									<tr class = "ban">
								</c:if>
								<c:if test="${!ban}">
									<tr>
								</c:if>
								
									
									<td>${list.userId }</td>
									<td>${list.nickname }</td>
									
									<td >
									<c:choose>
										<c:when test="${(list.roleNum % 100) % 10 >0}">
											<c:forEach items="${roleList }" var="role">
													<c:if test="${role.roleNum eq list.roleNum % 10}">
															<label for="operatorKind" class = "operatorKindLabel" id="operatorKindLabel" data-a="${(list.roleNum % 100) % 10}">${role.roleName }</label>
													</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										
											<label for="operatorKind" class = "operatorKindLabel"  id= "operatorKindLabel">&nbsp</label>
										</c:otherwise>
									</c:choose>
										<select name="operatorKind" class="form-select hidden operatorKind"  id="operatorKind" data-a="./updateOperatorRank?<%=url%>&userId=${list.userId}&action=operator">
												  <option  class = "operatorKinds" value="9">&nbsp</option>
											      <option class = "operatorKinds" value="1">Admin</option>
											      <option class = "operatorKinds" value="2">Manager</option>
											      <option class = "operatorKinds" value="3">스토어파트너</option>
											      <option class = "operatorKinds" value="4">직방파트너</option>
											      
										</select>
									</td>
									
									<td>
										<c:if test="${(list.roleNum % 100)  >=10}">
												
												<c:forEach items="${roleList }" var="role">
												
												<c:if test="${role.roleNum eq (list.roleNum % 100)-(list.roleNum % 10)}">
													<a href="./updateRank?<%=url%>&userId=${list.userId}&action=up"><img alt="" src="/resources/images/rank/up.png" width="15px;" style="margin-top: -5px"></a>
													${role.roleName }
													<a href="./updateRank?<%=url%>&userId=${list.userId}&action=down"><img alt="" src="/resources/images/rank/down.png" width="15px;" style="margin-bottom: -5px"></a>
												</c:if>
											
											
											</c:forEach>
										</c:if>
									</td>
									
									
										
									
									
									
									
									<c:if test="${ban}">
										<td><a href="./updateRank?<%=url%>&userId=${list.userId}&action=noBan">❌</a></td>
									</c:if>
									<c:if test="${!ban}">
										<td><a href="./updateRank?<%=url%>&userId=${list.userId}&action=ban">⭕</a></td>
									</c:if>
							
								</tr>
							</c:forEach>
						
					</table>
					
					<c:import url="../template/navPager.jsp"></c:import>
	
	
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
   <script src="/resources/js/admin.js"></script>
	<script type="text/javascript">
	getParam();
	member();
	
	
	$(document).ready(function(){        
		var select = $("select#operatorKind");        
		select.change(function(){        
			var select_name = $(this).children("option:selected").text();        
			$(this).siblings("label").text(select_name);    
			});});
	
	</script>
   
</body>
</html>
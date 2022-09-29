<%@page import="java.util.List"%>
<%@page import="com.goodee.home.member.MemberDTO"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <% 
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
			<div class = "row justify-content-center mt-5">
				<div class = " col-lg-7 ">
					<h1>회원 관리</h1>
					<h3>필터</h3>
					<hr>
					<form action="./member" method="get">
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
							<td><label for="gold"><input id= "gold" class = "memberClass" type="checkbox" name= "memberFilter" value="11">Gold</label>
							
							<td><label for="silver"><input id= "silver" class = "memberClass" type="checkbox" name= "memberFilter" value="12">Silver</label>
							<td><label for="white"><input id= "white" class = "memberClass" type="checkbox" name= "memberFilter" value="13">White</label>
						</tr>
						<tr>
							<td><label for="ban"><input id= "ban" type="checkbox" name= "memberFilter" value="20">Ban</label>
							
						</tr>
						<tr>
							<td><button type="submit" id="memberFilterBtn" class="btn btn-primary"> 적용 </button>
							<td><button type="reset" id="memberFilterResetBtn" class="btn btn-primary"> 초기화 </button>
						
						</tr>
							
						</tbody>
					
					
					</table>
						
						
						
						
					</form>
					
					<table class = "table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>NICKNAME</th>
								<th>관리자 등급</th>
								<th>회원 등급</th>
							</tr>
						
						
						
						</thead>
						
						<tbody>
						
						
						</tbody>
							<c:forEach items="${memberList}" var="list">
								<c:set var="ban" value="false"/>
								<c:forEach items="${list.roleDTOs }" var="role">
									<c:if test="${role.roleNum eq 20 }">
										<c:set var="ban" value="true"/>
									</c:if>
								</c:forEach>
							
								<c:if test="${ban}">
									<tr class = "ban">
								</c:if>
								<c:if test="${!ban}">
									<tr>
								</c:if>
								
								
									<td>${list.userId }</td>
									<td>${list.nickname }</td>
									<c:set var="done" value="false"/>
									<td>
										<c:if test="${list.roleDTOs[0].roleNum < 10}">
											${list.roleDTOs[0].roleName}
										<c:set var="done" value="true"/>
										</c:if>
									</td>
									
									<td>
										<c:if test="${list.roleDTOs[0].roleNum >9}">
											<c:if test="${done }">
												${list.roleDTOs[1].roleName}
											</c:if>
											<c:if test="${!done }">
												${list.roleDTOs[0].roleName}
											</c:if>
										</c:if>
									</td>
									
									
										
									
									<td><a href="./updateRank?page=<%=param %>&<%=param2 %>&userId=${list.userId}&action=up">등급업</a></td>
									<td><a href="./updateRank?page=<%=param %>&<%=param2 %>&userId=${list.userId}&action=down">등급다운</a></td>
									
									<c:if test="${ban}">
										<td><a href="./updateRank?page=<%=param %>&<%=param2 %>&userId=${list.userId}&action=noBan">벤해제</a></td>
									</c:if>
									<c:if test="${!ban}">
										<td><a href="./updateRank?page=<%=param %>&<%=param2 %>&userId=${list.userId}&action=ban">벤</a></td>
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
	</script>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	<c:choose>
				  		<c:when test="${pager.startNum <= 1}">
				  			<li class="page-item disabled">
				      			<a class="page-link">Previous</a>
							</li>
				  		</c:when>
				  		<c:otherwise> 
				  		<li class="page-item"><a class="page-link" href="./${pager.url }?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">Previous</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  		<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
						  			<li class="page-item"><a class="page-link" href="./${pager.url }?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					  	</c:forEach>
				   	 	<c:choose>
				  		<c:when test="${pager.lastNum - pager.startNum < 4}">
				  			<li class="page-item disabled">
				  			<a class="page-link" href="./${pager.url }?page=${pager.lastNum+1}">Next</a>
						  </li>
				  		</c:when>
				  		<c:otherwise> 
				  		 	<li class="page-item">
				  		 	<a class="page-link" href="./${pager.url }?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">Next</a>
						  </li>
				  		</c:otherwise>
				  	</c:choose>
				  </ul>
				</nav>
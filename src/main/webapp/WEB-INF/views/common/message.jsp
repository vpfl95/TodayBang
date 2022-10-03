<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<body>

	<script type="text/javascript">
		if (${not empty msg}) {
			alert("${msg}");
			
		}
		
		location.href= "${url}";
	
	
	
	</script>

<script src="/resources/js/alert/sweetalert2.min.js"></script>

</body>
</html>
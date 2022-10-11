<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/css/board/board.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5">
				<div class = " col-lg-7 ">
		
		
					<c:if test="${board=='NOTICE'}">
						<div>
							<h3>공지사항 글쓰기</h3>
						</div>
					</c:if>
					<c:if test="${board=='QNA'}">
						<div>
							<h3>문의하기</h3>
						</div>
					</c:if>
					<hr>
					<form action="./add" method="post" id = "boardForm"  enctype="multipart/form-data">
					<input type="hidden" value="${update.boardNum }"  id="boardNum" name="boardNum" class="form-control" >
						        
					
					<table class = "table">
						<thead>
						</thead>
						
						<tbody>
							<tr>
								<td colspan="2">
						        	<input type="text" value="${update.title }"  id="title" name="title" class="form-control" placeholder="제목을 입력해 주세요." required>
						        	<input type="hidden" value="${member.userId }"  id="userId" name="userId"  readonly="readonly" class="form-control" placeholder="작성자" required>
						        </td>
							</tr>
							
							<tr>
								<td colspan="2"><textarea   id="summernote" name="contents"></textarea></td>
							</tr>
							
							<tr>
								<th width="100px"><p id = "addFileBtn" >파일추가</p></th>
							
								<td>
									<div id = "fileInputDiv" title = "${updateSize }">
									<!-- 파일선택 input -->
										<c:forEach items="${update.boardFileDTOs }" var="file" varStatus="status">
										<c:if test="${not file.sort}">
										
											<label for="file${status.count }">${file.fileName }</label>
											<input type="file" id="file${status.count }" value="${file}" name="file" class="form-control boardFile hideBoardFile" title="${status.count }">
											<button class="boardFileDelete" title="${status.count }">파일삭제</button>
											
										</c:if>
										</c:forEach>
									
									</div>
								</td>
								
								
							</tr>
							<tr>
							
							<c:choose>
								<c:when test="${empty update }">
									<td><button id="boardBtn" class="btn btn-lg btn-primary" type="button" title = "add">게시</button></td>
								</c:when>
								<c:otherwise>
									<td><button id="boardBtn" class="btn btn-lg btn-primary" type="button" title = "update">수정</button></td>
								</c:otherwise>
								
							</c:choose>
							
							
							
							</tr>
							
						</tbody>
							
								
						
					</table>
				</form>
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/board.js"></script>
    
   	<script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	
   	<script type="text/javascript">
   	
   		board();
   		fileJs();
   	 	
   		$(document).ready(function() {
   			
   			var toolbar = [
   				    // 글꼴 설정
   				    ['fontname', ['fontname']],
   				    // 글자 크기 설정
   				    ['fontsize', ['fontsize']],
   				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
   				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
   				    // 글자색
   				    ['color', ['forecolor','color']],
   				    // 표만들기
   				    ['table', ['table']],
   				    // 글머리 기호, 번호매기기, 문단정렬
   				    ['para', ['ul', 'ol', 'paragraph']],
   				    // 줄간격
   				    ['height', ['height']],
   				    // 그림첨부, 링크만들기, 동영상첨부
   				    ['insert',['picture','link','video']],
   				    // 코드보기, 확대해서보기, 도움말
   				    ['view', ['codeview','fullscreen', 'help']]
   				  ];

   			var setting = {
   		            height : 300,
   		            minHeight : null,
   		            maxHeight : null,
   		            focus : true,
   		            lang : 'ko-KR',
   		            toolbar : toolbar,
   		            callbacks : { //여기 부분이 이미지를 첨부하는 부분
   		            onImageUpload : function(files, editor,
   		            welEditable) {
   		            for (var i = files.length - 1; i >= 0; i--) {
   		            uploadSummernoteImageFile(files[i],
   		            this);
   		            		}
   		            	}
   		            }
   		         };

   		        $('#summernote').summernote(setting);
   		     $('#summernote').summernote('pasteHTML', '${update.contents}');
   		        });
   		
   		
   		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
   	</script>
   
</body>
</html>
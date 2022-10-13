<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/realestate.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>
	<section class="container-fluid container-lg-8 mt-5">
        <div class = "row justify-content-center mt-5">
			<div class = "col-lg-7">
                <form action="./add" method="post">
                    <div style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;" class="p-4">
                        <div style="font-size: 32px; font-weight: bold; margin-bottom: 14px;">집내놓기</div>
                        <fieldset>  
                            <input type="radio" name="buildType" id="apart" value="아파트" checked="checked"><label for="apart" style="font-weight: bold;">아파트</label>
                            <input type="radio" name="buildType" id="villa" value="빌라"><label for="villa" style="font-weight: bold;">빌라</label>
                        </fieldset>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label" style="font-weight: bold;">지역</label>
                            <input type="text" name="sigungu" class="form-control" id="sigungu">
                        <div class="slClass" id="sigunguList"></div>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">도로명 주소</label>
                            <input class="form-control" name="roadName" id="roadName" onclick="sample6_execDaumPostcode()"></input>
                        </div>
    
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">건물명</label>
                            <input class="form-control" name="buildingNm" id="buildingNm"></input>
                        </div>
                        <fieldset>
                            <input type="radio" name="dealType" id="meme" value="매매" checked="checked" onchange="dealTypeCheck()"><label for="meme" style="font-weight: bold;">매매</label>
                            <input type="radio" name="dealType" id="junse" value="전세" onchange="dealTypeCheck()"><label for="junse" style="font-weight: bold;">전세</label>
                            <input type="radio" name="dealType" id="walse" value="월세" onchange="dealTypeCheck()"><label for="walse" style="font-weight: bold;">월세</label>
                        </fieldset>
                        <div class="mb-3" id="m">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">매매가격</label>
                            <input class="form-control" name="deal" id="deal"></input>
                        </div>
                        <div class="mb-3" id="d" style="display: none;">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">전세</label>
                            <input class="form-control" name="deposit" id="deposit"></input>
                        </div>
                        <div class="mb-3" id="wd" style="display: none;">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">보증금</label>
                            <input class="form-control" name="wdeposit" id="wdeposit"></input>
                        </div>
                        <div class="mb-3" id="w" style="display: none;">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">월세</label>
                            <input class="form-control" name="monthly" id="monthly"></input>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">면적</label>
                            <input class="form-control" name="area" id="area"></input>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label" style="font-weight: bold;">층</label>
                            <input class="form-control" name="floor" id="floor"></input>
                        </div>
    
                        <button type="submit">등록</button>
                    </div>
                </form>
            </div>
        </div>
      </section>

      <script>
		function dealTypeCheck(){
			if(document.getElementsByName("dealType")[0].checked==true){
				document.getElementById("m").style.display="block"
				document.getElementById("d").style.display="none"
				document.getElementById("wd").style.display="none"
				document.getElementById("w").style.display="none"
			}else if(document.getElementsByName("dealType")[1].checked==true){
				document.getElementById("d").style.display="block"
				document.getElementById("m").style.display="none"
				document.getElementById("wd").style.display="none"
				document.getElementById("w").style.display="none"
			}else if(document.getElementsByName("dealType")[2].checked==true){
				document.getElementById("wd").style.display="block"
				document.getElementById("w").style.display="block"
				document.getElementById("m").style.display="none"
				document.getElementById("d").style.display="none"
			}
		}
	</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					arr = data.roadAddress.split(" ")
					let first = arr[arr.length-2]
					let second = arr[arr.length-1]
					

                    addr = first +' '+ second
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					arr = data.roadAddress.split(" ")
					let first = arr[arr.length-2]
					let second = arr[arr.length-1]
					

                    addr = first +' '+ second
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("roadName").value = addr;
            }
        }).open();
    }
</script>
    <c:import url="../template/footer.jsp"></c:import>
    <script src="/resources/js/realestate.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>


</body>
</html>
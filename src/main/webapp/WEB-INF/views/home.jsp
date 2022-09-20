<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
   	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
	
    	<c:import url="./template/header.jsp"></c:import>
	
	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5"> 
               
			 <div class="col-12 pt-5"  style=" margin-top : -35px; height: 500px; background-image: url('/resources/images/Main.png');">
                        <div class="text-center">
                            
                            <h1 class="mb-5 " style="margin-top: 330px;"></h1>
                            
                            <form class="form-subscribe" id="contactForm" >
                                <!-- Email address input-->
                                <div class="row justify-content-center">
                                    <div class="col-5">
                                        <input class="form-control form-control-lg" id="textSearch" type="text" placeholder="검색" >
                                        </div>
                                    <div class="col-auto"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">검색</button></div>
                                </div>
                               
                                <div class="d-none" id="submitSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">Form submission successful!</div>
                                        <p>To activate this form, sign up at</p>
                                        <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                    </div>
                                </div>
                             
                                <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            </form>
                        </div>
                    </div>
			 
			
				<div class = " col-lg-7 ">
				
					
				
            
       
            <div class="container features-icons bg-light text-center" style="height: 500px; border: 1px;">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3" >
                            <div class="features-icons-icon d-flex"><i class="bi-window m-auto text-primary"></i></div>
                            <h3>스토어</h3>
                            <div class="container features-icons bg-white text-center col-12" style="height: 400px; ">
                            
                            
                            </div>
                        </div>
                    </div>
                  </div>
            </div>
             <div class="container features-icons bg-light text-center" style="height: 500px;">
                <div class="row">  
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3" >
                            <div class="features-icons-icon d-flex"><i class="bi-layers m-auto text-primary"></i></div>
                            <h3>방구하기</h3>
                            <div class="container features-icons bg-white text-center col-12" style="height: 400px; ">
                            
                            
                            </div>
                        </div>
                    </div>
                   </div>
            </div>
                    
                    
                    
             <div class="container features-icons bg-light text-center" style="height: 500px;">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-0 mb-lg-3" >
                            <div class="features-icons-icon d-flex"><i class="bi-terminal m-auto text-primary"></i></div>
                            <h3>커뮤니티</h3>
                            <div class="container features-icons bg-white text-center col-12" style="height: 400px; ">
                            
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
       </div>
        
        
        
				
	</section>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f734c47d571810dc50360665614e2cd"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
					detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
					
					var content = '<div class="bAddr">' +
									'<span class="title">법정동 주소정보</span>' + 
									detailAddr + 
								'</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}   
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for(var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}    
		}

	</script>
</body>
</html>
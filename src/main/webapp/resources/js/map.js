const dto = document.getElementsByClassName("dto"); //도로명, 시군구, 건물명 

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

//지도생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

 // 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 5 // 클러스터 할 최소 지도 레벨 
});



getCurPosition();

//-----------------------------페이지 처음에 현재 위치로 지도 출력------------------------------
function getCurPosition(){
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            map.setCenter(locPosition);  
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667)
        map.setCenter(locPosition);     
    }
}


//-------------------------------------시,군,구,읍,면,동 커스텀 오버레이-----------------------------

var overlays = [];

//지명 커스텀오버레이 추가
function addCustomOverlay(name,lat,long){
    // 커스텀 오버레이에 표시할 내용입니다     
    // HTML 문자열 또는 Dom Element 입니다
    var content = '<div style="position: absolute; cursor: pointer; white-space: nowrap;">' + 
                    '<div class="sc-jNMcJZ fPDpqH" style="width: 85px; height: 53px; background-image: url(/resources/images/local.png);">' +
                       ' <div class="sc-dOSRxR jbhFAf" style="color: rgb(254, 254, 254);">' + name + '</div>' +
                    '</div>' + 
                '</div>';

    // 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(lat, long);  

     // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content   
    });       
    customOverlay.setMap(map);
    overlays.push(customOverlay);
}

//오버레이 생성, 제거
function setCustomOverlays(map, overlays) {
    for (var i = 0; i < overlays.length; i++) {
        overlays[i].setMap(map);
    }            
}







//지도 확대,축소 이벤트
let result
kakao.maps.event.addListener(map, 'idle', function() {
    setCustomOverlays(null, overlays);
    // 지도의 현재 영역을 얻어옵니다 
    var bounds = map.getBounds();
    // 영역의 남서쪽 좌표를 얻어옵니다 
    var swLatLng = bounds.getSouthWest(); 
    // 영역의 북동쪽 좌표를 얻어옵니다 
    var neLatLng = bounds.getNorthEast();
    
    var swLat = swLatLng.getLat();
    var swLon = swLatLng.getLng();
    var neLat = neLatLng.getLat();
    var neLon = neLatLng.getLng();
    

    //ajax로 지도영역 좌표 보내서 영역안의 시군구동 이름,좌표 얻어오기
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./getRegion");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("swLat="+swLat+"&swLon="+swLon+"&neLat="+neLat+"&neLon="+neLon+"&mapLevel="+map.getLevel());
    xhttp.addEventListener("readystatechange",function(){
        if(xhttp.readyState==4 && xhttp.status==200){
            result = JSON.parse(xhttp.responseText.trim());
           
        }
    })
    // if(map.getLevel()<=4){
    //     setMarker();
    // }

    //시,군,동, 지역 이름 커스텀 오버레이 출력
    for(let i in result){
        setTimeout(function(){
            if(result[i].sido!=null){
                addCustomOverlay(result[i].sido,result[i].lat,result[i].lon);   
            }else if(result[i].sigungu!=null){
                addCustomOverlay(result[i].sigungu,result[i].lat,result[i].lon);   
            }else{
                addCustomOverlay(result[i].emd,result[i].lat,result[i].lon);   
            }
        },20);
    }
    
});



//-------------------------매물 주소를 좌표로 변경해 마커 찍고 클러스터러 처리----------------------------
var imageSrc = '/resources/images/apartment.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(56, 70), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

const markers = []
const marker_overlays = []
function setMarker(address_result){
   
    for(let i=0; i<address_result.length; i++){
        setTimeout(function(){
            console.log(address_result[i].roadName);
            console.log(address_result[i].avg);

            let unit
            console.log(address_result[i].avg.toString().length);
            if(address_result[i].avg.toString().length<5){
                unit = "만원"
            }else{
                address_result[i].avg /= 10000; 
                unit="억"
            }

            
            var content = '<div class="sc-hiSbEG fXZOVD" style="width: 56px; height: 70px;">'+  
                            '<div class="sc-cBNeex ljqnne">' + '평균' + '</div>'+
                            '<div class="sc-gWHigU hrGsUf">'+ address_result[i].avg.toFixed(1) + unit + '</div>' +
                            '<div class="sc-citxvW huWuZn">' + address_result[i].buildingNm + '</div>'+
                        '</div>'
           
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(address_result[i].roadName, function(result, status) {
    
                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
    
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                        image: markerImage
                    });
                    

                    // 아파트명 커스텀 오버레이를 생성합니다
                    var customOverlay = new kakao.maps.CustomOverlay({
                        map: map,
                        position: coords,
                        content: content,
                        yAnchor: 1 
                    });

                    marker_overlays.push(customOverlay);

                    markers.push(marker);
                   
                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    // var infowindow = new kakao.maps.InfoWindow({
                    //     content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                    // });
                    // infowindow.open(map, marker);
                    
                   
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    //map.setCenter(coords);
                    
                    // 클러스터러에 마커들을 추가합니다
                    //clusterer.addMarkers(markers);
                    
    
                } 
            }); 
               
        }, 20);   
    }
}

function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}
function hideMarkers(){
    setMarkers(null);
}


//--------------------------왼쪽 상단 현재 지도영역 중심의 주소이름------------------------

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
BAddrFromCoords(map.getCenter(), displayCenterInfo);
HAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    BAddrFromCoords(mouseEvent.latLng, function(result, status) {
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
    BAddrFromCoords(map.getCenter(), displayCenterInfo);
    HAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function HAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function BAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}



// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
let address_result
function displayCenterInfo(result, status) {
    let xhttp = new XMLHttpRequest();
    xhttp.open("POST","./map");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=euc-kr");

    if (status === kakao.maps.services.Status.OK) {
       
        var B = document.getElementById('B');
        var H = document.getElementById('H');
    
         //행정동
        if (status === kakao.maps.services.Status.OK) {           
            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    H.innerHTML = result[i].address_name;
                    break;
                }
            }
        }    
        hideMarkers(null);              //마커 삭제
        setCustomOverlays(null, marker_overlays);  //건물명오버레이도 삭제
        //법정동
        for(var i = 0; i < result.length; i++) {
            console.log(result[i].address_name)
            xhttp.send("sigungu="+result[i].address_name);
            xhttp.addEventListener("readystatechange", function(){
                if(xhttp.status==200 && xhttp.readyState==4){
                    address_result = JSON.parse(this.responseText.trim());
                    console.log(address_result)
                    if(map.getLevel()<=4){
                        setMarker(address_result);      //지도레벨 4이하 일때 법정동명으로 DB에서 가져와서 마커 찍기
                    }else{
                        hideMarkers(null);              //마커 삭제
                        setCustomOverlays(null, marker_overlays);  //건물명오버레이도 삭제 
                    }
                }
            })

            B.innerHTML = result[i].address.address_name;
            break;
        }
    }    
}
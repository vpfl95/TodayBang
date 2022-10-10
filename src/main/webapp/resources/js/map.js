const more = document.getElementById("more");
const reviewMore = document.getElementById("reviewMore");
const maemulList = document.getElementById("maemulList");
const buildingName = document.getElementById("buildingName")
const buildingWrap = document.getElementById("buildingWrap")
const buildingInfo = document.getElementById("buildingInfo")
const houseReviewList = document.getElementById("houseReviewList")
// const recommend = document.getElementById("recommend")
// const traffic = document.getElementById("traffic")
// const environment = document.getElementById("environment")
// const residential = document.getElementById("residential")
const maemulNum = document.getElementById("maemulNum")
const userId = document.getElementById("userId")
const addReview = document.getElementById("addReview")
const updateReview = document.getElementById("updateReview")
// const grade = document.getElementById("grade")
const trfgrade = document.getElementById("trfgrade")
const envgrade = document.getElementById("envgrade")
const resgrade = document.getElementById("resgrade")
const grade_text = document.getElementById("grade-text")
const trf_text = document.getElementById("trf-text")
const env_text = document.getElementById("env-text")
const res_text = document.getElementById("res-text")
const roadname = document.getElementById("roadname")
const writeReview = document.getElementById("writeReview")
const upReview = document.getElementById("upReview")
const reviewNum = document.getElementById("reviewNum")
let page =1;
let reviewPage = 1;

buildingInfo.style.display="none"
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

//지도생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

let getRegion_result;
var markers = []
var marker_overlays = []


getCurPosition();
// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
BAddrFromCoords(map.getCenter(), displayCenterInfo);
HAddrFromCoords(map.getCenter(), displayCenterInfo);


//------------------------지도 중심좌표 or 확대,축소 이벤트-------------------------------------------
kakao.maps.event.addListener(map, 'idle', function() {
    BAddrFromCoords(map.getCenter(), displayCenterInfo);
    HAddrFromCoords(map.getCenter(), displayCenterInfo);
    setCustomOverlays(null, overlays);
    setCustomOverlays(null, marker_overlays);
    

    page=1  //매물정보창 리스트 페이지1로 리셋
    let reviewPage = 1;
    buildingInfo.style.display="none" //매물정보창 안보이기

    getRegionName();    //지역명 커스텀 오버레이
    closeSuggestList(); //검색어 추천리스트 닫기
    console.log("마커오버레이",marker_overlays)

    //시,군,동, 지역 이름 커스텀 오버레이 출력

    if(map.getLevel()<=4){
        var swCoords = new kakao.maps.LatLng(map.getBounds().qa, map.getBounds().ha);
        var neCoords = new kakao.maps.LatLng(map.getBounds().pa, map.getBounds().oa);
        var nwCoords = new kakao.maps.LatLng(map.getBounds().pa, map.getBounds().ha);
        var seCoords = new kakao.maps.LatLng(map.getBounds().qa, map.getBounds().oa);
        HAddrFromCoords(map.getCenter(), getBuildingInfo);
        HAddrFromCoords(swCoords, getBuildingInfo);
        HAddrFromCoords(neCoords, getBuildingInfo);
        HAddrFromCoords(nwCoords, getBuildingInfo);
        HAddrFromCoords(seCoords, getBuildingInfo);
    }else if(map.getLevel()>=5 && map.getLevel()<7){
        setCustomOverlays(null, marker_overlays);  //건물명오버레이도 삭제
        for(let i in getRegion_result){
            setTimeout(function(){
                if(getRegion_result[i].sido==null && getRegion_result[i].sigungu==null){
                    addCustomOverlay(getRegion_result[i].emd, getRegion_result[i].lat, getRegion_result[i].lon);  
                }
            },10);
        }
    }else if(map.getLevel()>=7 && map.getLevel()<11){
        setCustomOverlays(null, marker_overlays);  //건물명오버레이도 삭제
        for(let i in getRegion_result){
            setTimeout(function(){
    
                if(getRegion_result[i].sigungu!=null){
                    addCustomOverlay(getRegion_result[i].sigungu, getRegion_result[i].lat, getRegion_result[i].lon);
                } 
            },10);
        }
    }else if(map.getLevel()>=11){
        setCustomOverlays(null, marker_overlays);  //건물명오버레이도 삭제
        for(let i in getRegion_result){
            setTimeout(function(){
    
                if(getRegion_result[i].sido!=null){
                    addCustomOverlay(getRegion_result[i].sido, getRegion_result[i].lat, getRegion_result[i].lon);   
                }
            },10);
        }
    }
  
});





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


//-------------------------------------시,군,구,읍,면,동 지명커스텀 오버레이-----------------------------

var overlays = [];

//지명 커스텀오버레이 생성 함수
function addCustomOverlay(name,lat,long){
    // 커스텀 오버레이에 표시할 내용입니다     
    // HTML 문자열 또는 Dom Element 입니다
    var content = '<div style="position: absolute; cursor: pointer; white-space: nowrap;">' + 
                    '<div class="sc-jNMcJZ custom" style="width: 85px; height: 53px; background-image: url(/resources/images/local.png);">' +
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
    overlays.push(customOverlay);
    customOverlay.setMap(map);
}

//오버레이 화면에 표시 or 재거
function setCustomOverlays(map, overlays) {
    for (var i = 0; i < overlays.length; i++) {
        overlays[i].setMap(map);
    }            
}


//현재 지도 영역 지명 얻는 함수(커스텀오버레이)
function getRegionName(){
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
            getRegion_result = JSON.parse(xhttp.responseText.trim());
        }
        
    })
    
}



//-------------------------매물 주소를 좌표로 변경해 마커 찍고 클러스터러 처리----------------------------

// 마커에 건물명, 시세 정보 가져오기
function getBuildingInfo(result, status){
    let buildingInfoResult;
    let xhttp = new XMLHttpRequest();
    xhttp.open("POST","./getAptRoadName");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=euc-kr");
    // console.log(map.getBounds())
    // console.log(map.getBounds().ha)
    // var coords = new kakao.maps.LatLng(map.getBounds().ha, map.getBounds().qa);
    // console.log(coords)


    //행정동
    if (status === kakao.maps.services.Status.OK) {
        for(var i = 0; i < result.length; i++) {
            console.log(result[i].address_name)

            xhttp.send("sigungu="+result[i].address_name);
            xhttp.addEventListener("readystatechange", function(){
                if(xhttp.status==200 && xhttp.readyState==4){
                    buildingInfoResult = JSON.parse(this.responseText.trim());
                    console.log(buildingInfoResult)
                    addMarker(buildingInfoResult);
                }
            })
        }
    }
}


//매물 마커 생성 함수
function addMarker(address_result){
    
    for(let i=0; i<address_result.length; i++){
        setTimeout(function(){
            let unit
            var content
            var building_top
            var building_bot
            var building_name

            content = document.createElement("div")
            content.className = "building"
            content.style = "position: relative;z-index:0;width: 56px; height: 70px;"
            content.setAttribute("data-roadName",address_result[i].roadName);
            
            
            building_top = document.createElement("div")
            building_top.setAttribute("data-roadName",address_result[i].roadName);
            building_top.className = "sc-cBNeex building-top"
            building_top.innerText = "매매"
            content.appendChild(building_top)

            building_bot = document.createElement("div")
            building_bot.setAttribute("data-roadName",address_result[i].roadName);
            building_bot.className = "sc-gWHigU building-bot"
            building_bot.innerText = address_result[i].avg + unit
            content.appendChild(building_bot)

            building_name = document.createElement("div")
            building_name.className = "sc-citxvW building-name"
            building_name.innerText = address_result[i].buildingNm
            content.appendChild(building_name)

            if(address_result[i].avg!=null){
                if(address_result[i].avg.toString().length<5){
                    unit = "만"
                }else{
                    address_result[i].avg = address_result[i].avg /10000; 
                    address_result[i].avg = address_result[i].avg.toFixed(1)
                    unit="억"
                }
        
                building_top.innerText = "매매"
                building_bot.innerText = address_result[i].avg + unit
                // content = '<div class="sc-hiSbEG building" style="width: 56px; height: 70px;">'+  
                //                 '<div class="sc-cBNeex building-top">' + '매매' + '</div>'+
                //                 '<div class="sc-gWHigU building-bot">'+ address_result[i].avg + unit + '</div>' +
                //                 '<div class="sc-citxvW building-name">' + address_result[i].buildingNm + '</div>'+
                //             '</div>'
            }else if(address_result[i].monthly!=null && address_result[i].deposit==null){
                if(address_result[i].wdeposit.toString().length<5){
                    unit = "만"
                }else{
                    address_result[i].wdeposit = address_result[i].wdeposit /10000; 
                    address_result[i].wdeposit = address_result[i].wdeposit.toFixed(1)
                    unit="억"
                }
                building_top.innerText = "월세"
                building_bot.innerText = address_result[i].wdeposit + unit + '/' + address_result[i].monthly
            }else if(address_result[i].monthly==null && address_result[i].deposit!=null){
                if(address_result[i].deposit.toString().length<5){
                    unit = "만"
                }else{
                    address_result[i].deposit = address_result[i].deposit /10000; 
                    address_result[i].deposit = address_result[i].deposit.toFixed(1)
                    unit="억"
                }

                building_top.innerText = "전세"
                building_bot.innerText = address_result[i].deposit + unit
            }else{
                if(address_result[i].wdeposit.toString().length<5){
                    unit = "만"
                    var wunit = "만"
                }else{
                    address_result[i].wdeposit = address_result[i].wdeposit /10000; 
                    address_result[i].wdeposit = address_result[i].wdeposit.toFixed(1)
                    unit="억"
                    var wunit = "억"
                }
                if(address_result[i].deposit.toString().length<5){
                    unit = "만"
                }else{
                    address_result[i].deposit = address_result[i].deposit /10000; 
                    address_result[i].deposit = address_result[i].deposit.toFixed(1)
                    unit="억"
                }

                building_top.innerText = '월세' + address_result[i].wdeposit + wunit
                building_bot.innerText = '전세' + address_result[i].deposit + unit
            }

           
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(address_result[i].roadName, function(result, status) {
                // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 아파트명 커스텀 오버레이를 생성합니다
                    var customOverlay = new kakao.maps.CustomOverlay({
                        //map: map,
                        position: coords,
                        content: content,
                        clickable: true,
                        yAnchor: 1
                    });
                    
                    //console.log(customOverlay.getContent())
                    customOverlay.setMap(map);

                    if(marker_overlays.includes(customOverlay)){ //***************************커스텀오버레이가 배열에 이미 들어있는지 확인이 안됨**********************
                        return
                    }else{
                        marker_overlays.push(customOverlay);
                    }

                    addEventHandle(content,coords,'click')
                } 
            });     
        }, 20);   
    }
}

var selectedMarker = "";


const realEstateList = document.getElementById("realEstateList")
//마커 클릭 이벤트 리스트 얻어오기
function addEventHandle(target,coords, type) {

    if (target.addEventListener) {
        target.addEventListener(type, function(e){

            //map.setCenter(coords)
            
            // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 클릭 이미지로 변경합니다
            if (!selectedMarker || selectedMarker !== target) {

                // 클릭된 마커 객체가 null이 아니면
                // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                
                selectedMarker.className="building";
                if(selectedMarker){
                    selectedMarker.parentNode.style.zIndex=0
                }
               
                //
                // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                target.className="building-select"
                target.firstChild.className="building-top-select"
                target.firstChild.nextSibling.className="building-bot-select"
                target.parentNode.style.zIndex=10
                
            }

            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
            selectedMarker = target;

            var roadName = e.target.getAttribute("data-roadName");
            console.log(roadName);

            realEstateList.innerHTML='' //매물리스트 초기화
            houseReviewList.innerHTML=''
            //매물리스트 테이블헤더
            let tr = document.createElement("tr")
            let th = document.createElement("th")
            let thText = document.createTextNode("계약일")
            th.appendChild(thText)
            tr.appendChild(th)
            th = document.createElement("th")
            thText = document.createTextNode("거래가격")
            th.appendChild(thText)
            tr.appendChild(th)
            th = document.createElement("th")
            thText = document.createTextNode("면적")
            th.appendChild(thText)
            tr.appendChild(th)
            th = document.createElement("th")
            thText = document.createTextNode("층수")
            th.appendChild(thText)
            tr.appendChild(th)
            realEstateList.append(tr)

            page=1;
            reviewPage=1;
            getMaemulList(roadName,page) //매물리스트 호출
            getReviewList(roadName,reviewPage)

        });
    } else {
        target.attachEvent('on' + type, callback);
    }
}

//매물리스트
function getMaemulList(roadName,p){
    buildingInfo.style.display="block"
    
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET","./getList?roadName="+roadName+"&page="+p);
    xhttp.send();
    xhttp.addEventListener("readystatechange", function(){
        if(xhttp.status==200 && xhttp.readyState==4){
            
            var result = JSON.parse(xhttp.responseText.trim());
            console.log(result);
            let list= result.list
            let pager=result.maemulPager

            for(let i=0; i<list.length; i++){
                let tr = document.createElement("tr")
                tr.className = "tr"
                let td = document.createElement("td")
                let tdText = document.createTextNode(list[i].dealDay)
                td.appendChild(tdText)
                tr.appendChild(td)

                td = document.createElement("td")
                if(list[i].dealType=="매매"){
                    if(list[i].deal.toString().length>=5){
                        let million = parseInt(list[i].deal /10000); 
                        let remain = list[i].deal %10000 ==0 ? '': list[i].deal %10000
                        tdText = document.createTextNode(list[i].dealType + million + "억" + remain)
                    }else{
                        tdText = document.createTextNode(list[i].dealType + list[i].deal)
                    }
                }else if(list[i].dealType=="전세"){
                    if(list[i].deposit.toString().length>=5){
                        let million = parseInt(list[i].deposit /10000); 
                        let remain = list[i].deposit %10000 ==0 ? '': list[i].deposit %10000 
                        tdText = document.createTextNode(list[i].dealType + million + "억" + remain)
                    }else{
                        tdText = document.createTextNode(list[i].dealType + list[i].deposit)
                    }
                }else{
                    if(list[i].wdeposit.toString().length>=5){
                        let million = parseInt(list[i].wdeposit /10000); 
                        let remain = list[i].wdeposit %10000 ==0 ? '': list[i].wdeposit %10000 
                        tdText = document.createTextNode(list[i].dealType + million + "억" + remain + '/' + list[i].monthly)
                    }else{
                        tdText = document.createTextNode(list[i].dealType + list[i].wdeposit + '/'+ list[i].monthly )
                    }
                } 
                
                td.appendChild(tdText)
                tr.appendChild(td)

                td = document.createElement("td")
                tdText = document.createTextNode(list[i].area)
                td.appendChild(tdText)
                tr.appendChild(td)

                td = document.createElement("td")
                tdText = document.createTextNode(list[i].floor)
                td.appendChild(tdText)
                tr.appendChild(td)
                
                td=document.createElement("td")
                tdText = document.createTextNode("🤍")
                td.appendChild(tdText)
                tr.appendChild(td)

                
                realEstateList.append(tr)

                //페이지 없으면 버튼 비활성화
                if(page >= pager.totalPage){
                    more.disabled= true;
                }else{
                    more.disabled= false;
                }
               
                more.setAttribute("data-name",list[i].roadName)
                buildingName.innerText=list[i].buildingNm
                maemulNum.value = list[0].num
                roadname.value = list[0].roadName
            }
        }
    })
}

//매물리스트 더보기 클릭 이벤트
more.addEventListener("click", function(){
    page++
    let roadName = more.getAttribute("data-name");
    getMaemulList(roadName,page)
});


//-----------------------------리뷰---------------------------------

//리뷰리스트
function getReviewList(roadName,p){
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET","./getHouseReview?roadName="+roadName+"&page="+p);
    xhttp.send();
    xhttp.addEventListener("readystatechange",function(){
        if(xhttp.status==200 && xhttp.readyState==4){
            var result = JSON.parse(xhttp.responseText.trim());
            console.log(result)
            let list= result.list
            let pager=result.maemulPager
            for(let i=0; i<list.length; i++){
                let revDiv = document.createElement("div")
                revDiv.className="revDiv"
                revDiv.setAttribute("data-rvNum",list[i].reviewNum)

                let recommend = document.createElement("div")
                recommend.className="recommend"
                let gradeDivWrap = document.createElement("div")
                let gradeDiv = document.createElement("div")
                let gradeNum = document.createElement("div")
                let gradeCircle = document.createElement("div")
                gradeDivWrap.className="gradeDivWrap"
                gradeCircle.className="circle"
                gradeDiv.className="gradeDiv"

                gradeDiv.innerText = "추천점수"
                gradeNum.innerText=list[i].grade
                gradeDivWrap.appendChild(gradeDiv)
                recommend.appendChild(gradeDivWrap)
                recommend.appendChild(gradeNum)

                for(let j=0; j<5;j++){
                    if(j<list[i].grade){
                        let grade_full = document.createElement("div")
                        grade_full.className="grade_full"
                        gradeCircle.appendChild(grade_full)
                    }else{
                        let grade_empty = document.createElement("div")
                        grade_empty.className="grade_empty"
                        gradeCircle.appendChild(grade_empty)
                    }
                }
                recommend.appendChild(gradeCircle)

                
                let contents = document.createElement("div")
                contents.innerText = list[i].contents
                revDiv.appendChild(recommend)
                revDiv.appendChild(contents)

                let trfDiv = document.createElement("span")
                let trfgrade = document.createElement("span")
                trfDiv.innerText="교통여건"
                trfgrade.innerText=list[i].trfGrade
                let trfContents = document.createElement("div")
                trfContents.innerText = list[i].trfContents
                revDiv.appendChild(trfDiv)
                revDiv.appendChild(trfgrade)
                revDiv.appendChild(trfContents)

                let envDiv = document.createElement("span")
                let envgrade = document.createElement("span")
                envDiv.innerText="주변환경"
                envgrade.innerText=list[i].envGrade
                let envContents = document.createElement("div")
                envContents.innerText = list[i].envContents
                revDiv.appendChild(envDiv)
                revDiv.appendChild(envgrade)
                revDiv.appendChild(envContents)

                let resDiv = document.createElement("span")
                let resgrade = document.createElement("span")
                resDiv.innerText="거주환경"
                resgrade.innerText=list[i].resGrade
                let resContents = document.createElement("div")
                resContents.innerText = list[i].resContents
                revDiv.appendChild(resDiv)
                revDiv.appendChild(resgrade)
                revDiv.appendChild(resContents)

                let update = document.createElement("span")
                update.innerText="수정"
                update.className="update"
                update.setAttribute("value",list[i].userId)
                revDiv.appendChild(update)

                let del = document.createElement("span")
                del.setAttribute("data-rvNum",list[i].reviewNum)
                del.setAttribute("data-road",roadName)
                del.setAttribute("value",list[i].userId)
                del.innerText="삭제"
                del.className="delete"
                revDiv.appendChild(del)   


                houseReviewList.appendChild(revDiv)

                //페이지 없으면 버튼 비활성화
                if(reviewPage >= pager.totalPage){
                    reviewMore.disabled= true;
                }else{
                    reviewMore.disabled= false;
                }
                reviewMore.setAttribute("data-name",roadName)
            
            }
        }
    });
}
//리뷰 더보기
reviewMore.addEventListener("click", function(){
    reviewPage++
    let roadName = reviewMore.getAttribute("data-name");
    getReviewList(roadName,reviewPage)
});


// 리뷰 작성
addReview.addEventListener("click",function(){
    let gv
    let tgv
    let egv
    let rgv
    let recommend = document.getElementsByName("recommend")
    for(let i=0; i<recommend.length;i++){
        if(recommend[i].checked){
            gv=recommend[i].value
        }
    }
    let trf = document.getElementsByName("trf")
    for(let i=0; i<trf.length;i++){
        if(trf[i].checked){
            tgv=trf[i].value
        }
    }
    let env = document.getElementsByName("env")
    for(let i=0; i<env.length;i++){
        if(env[i].checked){
            egv=env[i].value
        }
    }
    let res = document.getElementsByName("res")
    for(let i=0; i<res.length;i++){
        if(res[i].checked){
            rgv=res[i].value
        }
    }

    let num = maemulNum.value
    let id = userId.value
    let gtv = grade_text.value
    let ttv = trf_text.value
    let etv = env_text.value
    let rtv = res_text.value
    let road = roadname.value

    if(id==""){
        alert("로그인이 필요합니다.")
    }

    let xhttp= new XMLHttpRequest();
    xhttp.open("POST","./addReview");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("num="+num+"&userId="+id+"&grade="+gv+"&contents="+gtv+"&trfGrade="+tgv+"&trfContents="+ttv+"&envGrade="+egv+"&envContents="+etv+"&resGrade="+rgv+"&resContents="+rtv);
    xhttp.addEventListener("readystatechange",function(){
        if(xhttp.status==200 && xhttp.readyState==4){
            let result = xhttp.responseText;
            if(result==1){
                for(let i=0; i<houseReviewList.children.length;){
                    houseReviewList.children[0].remove();
                }
                reviewPage=1;
                getReviewList(road,reviewPage)

            }
        }
    });

});


//작성자확인 인터셉터
function writerCheck(userId){
    let result
    if(writeReview.value==""){
        alert("로그인이 필요합니다.")
        window.location.href='/member/login'
    }

    $.ajax({
        type: "post",
        url: "./writerCheck",
        async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
        data: { userId: userId },
        success: function (data) {
            result = data;
        }
    });
    return result
}



//리뷰 수정
houseReviewList.addEventListener("click",function(event){   
    if(event.target.className=="update"){
     
        console.log(event.target.getAttribute("value"))
        let result = writerCheck(event.target.getAttribute("value"));
        console.log(result)
        if(result==0){
            alert("작성자만 수정이 가능합니다.")
            return false
        }
        
        grade_text.value=event.target.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        trf_text.value=event.target.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        env_text.value=event.target.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        res_text.value=event.target.previousSibling.innerHTML
        reviewNum.value=event.target.parentNode.getAttribute("data-rvnum")
        let grade=event.target.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        let tg = event.target.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        let eg = event.target.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerHTML
        let rg = event.target.previousSibling.previousSibling.innerHTML
        document.getElementsByName("recommend")[Math.abs(grade-5)].checked=true
        document.getElementsByName("trf")[Math.abs(tg-5)].checked=true
        document.getElementsByName("env")[Math.abs(eg-5)].checked=true
        document.getElementsByName("res")[Math.abs(rg-5)].checked=true
        upReview.click()
    }
})
//리뷰리스트에서 수정
upReview.addEventListener("click",function(){
    addReview.style.display="none"
    updateReview.style.display="block"
})
writeReview.addEventListener("click",function(){
    
    console.log(writeReview.value)
    if(writeReview.value==""){
        alert("로그인이 필요합니다.")
        window.location.href='/member/login'
    }

    addReview.style.display="block"
    updateReview.style.display="none"
    grade_text.value=""
    trf_text.value=""
    env_text.value=""
    res_text.value=""
    reviewNum.value=""
    $("input:radio[name='recommend']").prop('checked',false);
    $("input:radio[name='trf']").prop('checked',false);
    $("input:radio[name='env']").prop('checked',false);
    $("input:radio[name='res']").prop('checked',false);
})

//모달에서 수정 클릭
updateReview.addEventListener("click",function(){
    let gv
    let tgv
    let egv
    let rgv
    let recommend = document.getElementsByName("recommend")
    for(let i=0; i<recommend.length;i++){
        if(recommend[i].checked){
            gv=recommend[i].value
        }
    }
    let trf = document.getElementsByName("trf")
    for(let i=0; i<trf.length;i++){
        if(trf[i].checked){
            tgv=trf[i].value
        }
    }
    let env = document.getElementsByName("env")
    for(let i=0; i<env.length;i++){
        if(env[i].checked){
            egv=env[i].value
        }
    }
    let res = document.getElementsByName("res")
    for(let i=0; i<res.length;i++){
        if(res[i].checked){
            rgv=res[i].value
        }
    }

    let rvnum = reviewNum.value
    let gtv = grade_text.value
    let ttv = trf_text.value
    let etv = env_text.value
    let rtv = res_text.value
    let road = roadname.value
    console.log(road)

    let xhttp = new XMLHttpRequest();
    xhttp.open("POST","./updateReview")
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("reviewNum="+rvnum+"&grade="+gv+"&contents="+gtv+"&trfGrade="+tgv+"&trfContents="+ttv+"&envGrade="+egv+"&envContents="+etv+"&resGrade="+rgv+"&resContents="+rtv)
    xhttp.addEventListener("readystatechange",function(){
        if(xhttp.status==200 && xhttp.readyState==4){
            let result = xhttp.responseText
            console.log(result)
            if(result==1){
                //alert("리뷰 수정완료")
                for(let i=0; i<houseReviewList.children.length;){
                    houseReviewList.children[0].remove();
                }
                reviewPage=1;
                getReviewList(road,reviewPage)

            }else{
                alert("리뷰 수정실패")
            }
        }
    })
})

//리뷰 삭제
houseReviewList.addEventListener("click",function(event){
    if(event.target.className=="delete"){

        let result = writerCheck(event.target.getAttribute("value"));
        console.log(result)
        if(result==0){
            alert("작성자만 삭제 가능합니다.")
            return false
        }
        if(result==1){
            if(confirm("리뷰를 삭제 하시겠습니까?")==false){
                return false
            }else{
                console.log(event.target.getAttribute("data-rvNum"))
                let rvNum = event.target.getAttribute("data-rvNum");
                let road = event.target.getAttribute("data-road");
        
                let xhttp= new XMLHttpRequest();
                xhttp.open("POST","./deleteReview")
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("reviewNum="+rvNum)
                xhttp.addEventListener("readystatechange",function(){
                    if(xhttp.readyState==4 && xhttp.status==200){
        
                        let result = xhttp.responseText
            
                        if(result==1){
                            //alert("리뷰 수정완료")
                            for(let i=0; i<houseReviewList.children.length;){
                                houseReviewList.children[0].remove();
                            }
                            reviewPage=1;
                            getReviewList(road,reviewPage)
            
                        }else{
                            alert("리뷰 삭제실패")
                        }
                    }
                })



            }
        }

    }

})






//--------------------------왼쪽 상단 현재 지도영역 중심의 주소이름------------------------
function HAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);      
}

function BAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}


// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
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

        //법정동
        for(var i = 0; i < result.length; i++) {
            B.innerHTML = result[i].address.address_name;
            break;
        }
    }    
}

//---------------------------------------Search--------------------------------------------

var ps= new kakao.maps.services.Places();


// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
 
    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

    
        var bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';

        console.log(data)
        for ( var i=0; i<2; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(data[0].y, data[0].x)

    
        }
         

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        getRegionName();
       
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}




//연관검색어
function delay(fn, ms) {
    let timer = 0
    return function(...args) {
      clearTimeout(timer)
      timer = setTimeout(fn.bind(this, ...args), ms || 0)
    }
}

const sugguestList = document.getElementById("sugguestList")
searchSuggest();

function searchSuggest(){
    const keyword = document.getElementById("keyword")
        

    $('#keyword').keyup(delay(function (e) {
        console.log('Time elapsed!', this.value);

        const items = document.querySelectorAll(".selectItem")

        if(keyword.value==''){
            sugguestList.style.display="none"
        }else{
            sugguestList.style.display="block"
        }

  
        
        let xhttp = new XMLHttpRequest();
        xhttp.open("POST","getSearchList");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        if(keyword.value!='' && e.key!=="ArrowUp" && e.key!=="ArrowDown"){
            
            xhttp.send("search="+keyword.value);
        }
        xhttp.addEventListener("readystatechange",function(){
            if(xhttp.readyState==4 && xhttp.status==200){
                //연관검색어 초기화
                items.forEach(function(data){
                //console.log("삭제",data)
                data.remove()
                })
                
                    
                var result = JSON.parse(xhttp.responseText.trim());
                console.log(result)
                let apt = result.apt;
                let address = result.address;

                if(keyword.value==''){
                    sugguestList.style.display="none"
                }else if(result.length>0){
                    sugguestList.style.display="block"
                }

                if(result.apt.length==0 && result.address.length==0){
                    let selectItem = document.createElement("div")
                    // selectItem.innerText="검색결과가 없습니다."
                    // selectItem.className="selectItem"
                    // sugguestList.appendChild(selectItem)
                }else{
                    for(let i=0; i<address.length; i++){
                        let selectItem = document.createElement("div")
                        let selectItemWrap = document.createElement("div")
                        let aptDiv = document.createElement("div")
                        let addressDiv = document.createElement("div")
                        
                        aptDiv.innerText=address[i].sigungu
                        addressDiv.innerText = address[i].sigungu
                        selectItem.className="selectItem"
                        addressDiv.className="addressDIV"
                        selectItem.setAttribute("data-address",address[i].sigungu)
                        selectItemWrap.appendChild(aptDiv)
                        selectItemWrap.appendChild(addressDiv)
                        selectItem.appendChild(selectItemWrap)
                        sugguestList.appendChild(selectItem)
                        
                        selectItem.addEventListener("click",function(){
                            console.log(selectItem.getAttribute("data-address"))
                            keyword.value=selectItem.firstChild.firstChild.innerText
                            searchPlaces(selectItem.getAttribute("data-address"));
                        })
                    }
    
                    for(let i=0; i<apt.length; i++){
                        let selectItem = document.createElement("div")
                        let selectItemWrap = document.createElement("div")
                        let aptDiv = document.createElement("div")
                        let addressDiv = document.createElement("div")
                        
                        aptDiv.innerText=apt[i].buildingNm
                        addressDiv.innerText = apt[i].sigungu
                        selectItem.className="selectItem"
                        addressDiv.className="addressDIV"
                        selectItem.setAttribute("data-address",apt[i].roadName)
                        selectItemWrap.appendChild(aptDiv)
                        selectItemWrap.appendChild(addressDiv)
                        selectItem.appendChild(selectItemWrap)
                        sugguestList.appendChild(selectItem)
    
                        selectItem.addEventListener("click",function(){
                            console.log(selectItem.getAttribute("data-address"))
                            keyword.value=selectItem.firstChild.firstChild.innerText
                            searchPlaces(selectItem.getAttribute("data-address"));
                        })
                    }
                }

            }
        });
   
         
        if((e.key==="ArrowUp" || e.key==="ArrowDown") && sugguestList.style.display==="block"){
            const selectedItem = sugguestList.querySelector("div.selectItem.selected")
            
            let target

            const initIndex = e.key==="ArrowUp" ? items.length-1 : 0;
            const adjacentSibling = selectedItem && (e.key === "ArrowUp" ? selectedItem.previousElementSibling : selectedItem.nextElementSibling)

            if(adjacentSibling){
                target = adjacentSibling
            }else{
                target = items.item(initIndex)
            } 
  
            selectedItem && selectedItem.classList.remove("selected")
            target.classList.add("selected")
           
            keyword.value = target.firstChild.firstChild.textContent
        }

        if(e.key==="Escape"){
            closeSuggestList();
        }
        if(e.key==="Enter"){
            closeSuggestList();
        }
    }, 200));
}

function closeSuggestList(){
    sugguestList.style.display="none"
}



var addressmarker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
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
            addressmarker.setPosition(mouseEvent.latLng);
            addressmarker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, addressmarker);
        }   
    });
});







// addReal.addEventListener("click", function(){
//     let buildType = document.getElementsByName("buildType")
//     let buildValue
//     for(let i=0; i<buildType.length;i++){
//         if(buildType[i].checked){
//             buildValue=buildType[i].value
//         }
//     }

//     let sigungu = document.getElementById("sigungu").value
//     let roadName = document.getElementById("roadName").value
//     let buildingNm = document.getElementById("buildingNm").value
//     let dealType = document.getElementsByName("dealType")
//     let dealValue
//     for(let i=0; i<dealType.length;i++){
//         if(dealType[i].checked){
//             dealValue=dealType[i].value
//         }
//     }
//     let deal = document.getElementById("deal").value
//     let deposit = document.getElementById("deposit").value
//     let wdeposit = document.getElementById("wdeposit").value
//     let monthly = document.getElementById("monthly").value
//     let area = document.getElementById("area").value
//     let floor = document.getElementById("floor").value

//     let xhttp = new XMLHttpRequest()
//     xhttp.open("POST","setAddReal")
//     xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     xhttp.send("buildType="+buildValue+"&sigungu="+sigungu+"&roadName="+roadName+"&buildingNm="+buildingNm+"&dealType="+dealValue+"&deal="+deal+"&deposit="+deposit+"&wdeposit="+wdeposit+"&monthly="+monthly+"&area="+area+"&floor="+floor)
//     xhttp.addEventListener("readystatechange",function(){
//         if(xhttp.status==200 && xhttp.readyState==4){
//             let result = xhttp.responseText

//             if(result==1){
//                 alert("등록되었습니다.")
//             }
//         }
//     })
// })

//연관검색어
function delay(fn, ms) {
    let timer = 0
    return function(...args) {
      clearTimeout(timer)
      timer = setTimeout(fn.bind(this, ...args), ms || 0)
    }
}


const sigunguList = document.getElementById("sigunguList")

getHaddress()

function getHaddress(){
    const sigungu = document.getElementById("sigungu")
        

    $('#sigungu').keyup(delay(function (e) {
        console.log('Time elapsed!', this.value);
        const items = document.querySelectorAll(".selectItem")

        if(sigungu.value==''){
            sigunguList.style.display="none"
        }else{
            sigunguList.style.display="block"
        }

        let xhttp = new XMLHttpRequest();
        xhttp.open("POST","./getHaddress");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        
        if(sigungu.value!=''){
            xhttp.send("search="+sigungu.value);
        }
        
        xhttp.addEventListener("readystatechange",function(){
            if(xhttp.readyState==4 && xhttp.status==200){
                //연관검색어 초기화
                items.forEach(function(data){
                //console.log("삭제",data)
                data.remove()
                })
                
                var result = JSON.parse(this.responseText.trim());

                if(sigungu.value==''){
                    sigunguList.style.display="none"
                }else if(result.length>0){
                    sigunguList.style.display="block"
                }

                if(result.length==0){
                    let selectItem = document.createElement("div")
                    // selectItem.innerText="검색결과가 없습니다."
                    // selectItem.className="selectItem"
                    // sugguestList.appendChild(selectItem)
                }else{
                    for(let i=0; i<result.length; i++){
                        console.log(result[i].sigungu)
                        let selectItem = document.createElement("div")
                        let selectItemWrap = document.createElement("div")
                        let aptDiv = document.createElement("div")
                       
                        
                        aptDiv.innerText=result[i].sigungu
                      
                        selectItem.className="selectItem"
                     
                        selectItemWrap.appendChild(aptDiv)
                        selectItem.appendChild(selectItemWrap)
                        sigunguList.appendChild(selectItem)
                        
                        selectItem.addEventListener("click",function(){
                            sigungu.value=selectItem.firstChild.firstChild.innerText
                            closeSigunguList()
                        })
                    }
                }

            }
        });


        if(e.key==="Escape"){
            closeSuggestList();
        }
        if(e.key==="Enter"){
            closeSuggestList();
        }
    }, 200));
}

function closeSigunguList(){
    sigunguList.style.display="none"
}


function getLatLon(){
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(address_result[i].roadName, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
        


        } 
    }); 

}
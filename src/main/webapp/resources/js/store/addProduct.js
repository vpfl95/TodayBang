const category = document.querySelector("#category");
const cate1 = document.querySelector("#cate1");
const cate2 = document.querySelector("#cate2");
const cate3 = document.querySelector("#cate3");
const exhibition = document.querySelector("#exhibition");
let jsonCategory; 
let jsonExhibition;

function getCategory1() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./category");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonCategory = JSON.parse(this.responseText.trim());
            for(let i=0; jsonCategory.length; i++) {
                if(jsonCategory[i].tier == 1) {
                    let option = document.createElement("option");
                    let option_value = document.createAttribute("value");
                    let option_contents = document.createTextNode(jsonCategory[i].categoryName);
                    option_value.value=jsonCategory[i].categoryNum;
                    option.setAttributeNode(option_value);
                    option.appendChild(option_contents);
                    cate1.append(option);
                }
            }
            console.log('cate1 : '+cate1.value);
            
        }
    }
}

function getCategory2() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./category");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonCategory = JSON.parse(this.responseText.trim());
            for(let i=0; i<jsonCategory.length; i++) {
                if(jsonCategory[i].categoryRef == cate1.value) {
                    let option = document.createElement("option");
                    let option_value = document.createAttribute("value");
                    let option_class = document.createAttribute("class");
                    option_class.value = 'child';
                    let option_contents = document.createTextNode(jsonCategory[i].categoryName);
                    option_value.value = jsonCategory[i].categoryNum;
                    option.setAttributeNode(option_value);
                    option.setAttributeNode(option_class);
                    option.appendChild(option_contents);
                    cate2.append(option);
                }
            }
        }
    }
}

function getCategory3() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./category");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonCategory = JSON.parse(this.responseText.trim());
            for(let i=0; i<jsonCategory.length; i++) {
                if(jsonCategory[i].categoryRef == cate2.value) {
                    let option = document.createElement("option");
                    let option_value = document.createAttribute("value");
                    let option_class = document.createAttribute("class");
                    option_class.value = 'child2';
                    let option_contents = document.createTextNode(jsonCategory[i].categoryName);
                    option_value.value = jsonCategory[i].categoryNum;
                    option.setAttributeNode(option_value);
                    option.setAttributeNode(option_class);
                    option.appendChild(option_contents);
                    cate3.append(option);
                }
            }
        }
    }
}

cate1.onchange=function() {
    let child = document.getElementsByClassName("child");
    for(let i=0; child.length;) {
        cate2.removeChild(child[0]);
    } 
    let child2 = document.getElementsByClassName("child2");
    for(let i=0; child2.length;) {
        cate3.removeChild(child2[0]);
    }
    for(let i=0; i<jsonCategory.length; i++) {
        if(jsonCategory[i].categoryRef == cate1.value) {
            let option = document.createElement("option");
            let option_value = document.createAttribute("value");
            let option_class = document.createAttribute("class");
            option_class.value = 'child';
            let option_contents = document.createTextNode(jsonCategory[i].categoryName);
            option_value.value = jsonCategory[i].categoryNum;
            option.setAttributeNode(option_value);
            option.setAttributeNode(option_class);
            option.appendChild(option_contents);
            cate2.append(option);
        }
    }

    for(let i=0; i<jsonCategory.length; i++) {
        if(jsonCategory[i].categoryRef == cate2.value) {
            let option = document.createElement("option");
            let option_value = document.createAttribute("value");
            let option_class = document.createAttribute("class");
            option_class.value = 'child2';
            let option_contents = document.createTextNode(jsonCategory[i].categoryName);
            option_value.value = jsonCategory[i].categoryNum;
            option.setAttributeNode(option_value);
            option.setAttributeNode(option_class);
            option.appendChild(option_contents);
            cate3.append(option);
        }
    }
}

cate2.onchange=function(){
    let child2 = document.getElementsByClassName("child2");
    for(let i=0; child2.length;) {
        cate3.removeChild(child2[0]);
    }
    for(let i=0; i<jsonCategory.length; i++) {
        if(jsonCategory[i].categoryRef == cate2.value) {
            let option = document.createElement("option");
            let option_value = document.createAttribute("value");
            let option_class = document.createAttribute("class");
            option_class.value = 'child2';
            let option_contents = document.createTextNode(jsonCategory[i].categoryName);
            option_value.value = jsonCategory[i].categoryNum;
            option.setAttributeNode(option_value);
            option.setAttributeNode(option_class);
            option.appendChild(option_contents);
            cate3.append(option);
        }
    }
}

function getExhibition() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../exhibitions/exhibition");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonExhibition = JSON.parse(this.responseText.trim());
            for(let i=0; jsonExhibition.length; i++) {
                let option = document.createElement("option");
                let option_value = document.createAttribute("value");
                let option_contents = document.createTextNode(jsonExhibition[i].exName);
                option_value.value=jsonExhibition[i].exhibitionCode;
                option.setAttributeNode(option_value);
                option.appendChild(option_contents);
                exhibition.append(option);
            }
            
        }
    }
}
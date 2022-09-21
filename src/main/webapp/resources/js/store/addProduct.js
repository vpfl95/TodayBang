const category = document.querySelector("#category");
const cate1 = document.querySelector("#cate1");
const cate2 = document.querySelector("#cate2");
const cate3 = document.querySelector("#cate3");
const premium = document.querySelector("#premium");
const cbxPremium = document.querySelector("#cbxPremium");
const exhibition = document.querySelector("#exhibition");
const btnAddProduct = document.querySelector("#btnAddProduct");
let jsonCategory; 
let jsonExhibition;

function getCategory() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "./category");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonCategory = JSON.parse(this.responseText.trim());
            for(c of jsonCategory) {
                if(c.tier == 1) {
                    let option = document.createElement("option");
                    let option_value = document.createAttribute("value");
                    let option_contents = document.createTextNode(c.categoryName);
                    option_value.value=c.categoryNum;
                    option.setAttributeNode(option_value);
                    option.appendChild(option_contents);
                    cate1.append(option);
                }
            }

            getMiddle();
            getSub();
        }
    }
}

function getMiddle() {
    for(c of jsonCategory) {
        if(c.categoryRef == cate1.value) {
            let option = document.createElement("option");
            let option_value = document.createAttribute("value");
            let option_class = document.createAttribute("class");
            option_class.value = 'child';
            let option_contents = document.createTextNode(c.categoryName);
            option_value.value = c.categoryNum;
            option.setAttributeNode(option_value);
            option.setAttributeNode(option_class);
            option.appendChild(option_contents);
            cate2.append(option);
        }
    }
}

function getSub() {
    for(c of jsonCategory) {
        if(c.categoryRef == cate2.value) {
            let option = document.createElement("option");
            let option_value = document.createAttribute("value");
            let option_class = document.createAttribute("class");
            option_class.value = 'child2';
            let option_contents = document.createTextNode(c.categoryName);
            option_value.value = c.categoryNum;
            option.setAttributeNode(option_value);
            option.setAttributeNode(option_class);
            option.appendChild(option_contents);
            cate3.append(option);
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
    getMiddle();
    getSub();
}

cate2.onchange=function(){
    let child2 = document.getElementsByClassName("child2");
    for(let i=0; child2.length;) {
        cate3.removeChild(child2[0]);
    }
    getSub();
}

function getExhibition() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../exhibitions/exhibition");
    xhttp.send();
    xhttp.onreadystatechange=function() {
        if(this.readyState==4 && this.status==200) {
            jsonExhibition = JSON.parse(this.responseText.trim());
            for(e of jsonExhibition) {
                let option = document.createElement("option");
                let option_value = document.createAttribute("value");
                let option_contents = document.createTextNode(e.exName);
                option_value.value=e.exhibitionCode;
                option.setAttributeNode(option_value);
                option.appendChild(option_contents);
                exhibition.append(option);
            }
        }
    }
}

cbxPremium.onchange=function(){
    if(cbxPremium.checked) {
        premium.value=1;
    } else {
        premium.value=0;
    }
}
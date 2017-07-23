function showUsername(username){
	var username1 = document.getElementById("username");
	username1.value = username;
}
function showSex(sex1){
	sex1+="";
//	alert(sex1);
	var man = document.getElementById("man");
	var women = document.getElementById("women");
	var secret = document.getElementById("secret");
	if(sex1=="男"){
//		alert("131");
		man.checked = true;
		
	}
	if(sex1=="女"){
//		alert("222");
		women.checked = true;
	}
	if(sex1==null){
//		alert("333");
		secret.checked = true;
	}
}

function showTelephone(telephone){
	var tel = document.getElementById("telphone");
	tel.value = telephone;
}

function showEmail(email){
	var email1= document.getElementById("email");
	email1.value = email;
}

function showPostcode(postcode){
	var postc = document.getElementById("postcode");
	postc.value = postcode;
}

function showAddress(address){
	var addr = document.getElementById("address");
	addr.value = address;
}
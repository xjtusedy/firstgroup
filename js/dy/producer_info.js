function judgeTelephone() {
	var t = document.getElementById("telephone");
	var r = /^[0-9]*[1-9][0-9]*$/ ;  
	if(!r.test(t.value)) {
		document.getElementById("telephoneTip").innerHTML='电话号码必须为数字！';
		return;
	}
	if(t.value.length!=11) {
		document.getElementById("telephoneTip").innerHTML='电话号码必须为十一位！';
		return;
	}
	document.getElementById("telephoneTip").innerHTML='';
}

//function showProducername(username){
//	var username1 = document.getElementById("username");
//	username1.value = username;
//}
function showClassify(classify){
	var clfy = document.getElementById("classify");
	clfy.value = classify;
}

function showTelephone(telephone){
	var tel = document.getElementById("telephone");
	tel.value = telephone;
}

function showEmail(email){
	var email1= document.getElementById("email");
	email1.value = email;
}

function showProdec(prodec){
	var prod = document.getElementById("prodec");
	prod.value = prodec;
}

function showAddress(address){
	var addr = document.getElementById("address");
	addr.value = address;
}
function showConn(conn){
	var connection = document.getElementById("connectionperson");
	connection.value = conn;
}


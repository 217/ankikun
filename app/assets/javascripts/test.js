function changeSelect(){
	var select = document.getElementById("test_testquestions_kind").value;
}

function getXHR(){
	var req;
	try{
		req = new XMLHttpReqest();			// Internet Exlorer 7.0以降／それ以外のブラウザ
	}catch(e){
		try{
			req = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return req;
}

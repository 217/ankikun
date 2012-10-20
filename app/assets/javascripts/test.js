/*
function changeForm(){
	var select = document.getElementById("test_questions_kind").value;

	if(select === "N択問題"){
		// document.write("N : ");
		/*
		var element = document.createElement("input");
		element.setAtrribute("type","text");
		element.setAttribute("size","10");
		element.setAttribute("name","URL");

		document.getElementById("test_questions_kind").appendChild(element);
		*
		var element = document.createElement("option");
		document.getElementById("test_questions_kind").appendChild(element);
	
	}else if(select === "○×問題"){

	}else if(select === "一問一答"){
	
	}else if(select === "穴埋め"){
	
	}
}
*/

$(function(){
	/*ここにjQueryを記述*/
	$("#test_questions_kind").bind("change",function(){
		alert("hogehoge");
	});
});

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
		$("#test_questions_kind option:selected").each(function(){
			var selectText = $("#test_questions_kind option:selected").text();
			// ここは、textではなく、val
			if(selectText === "N択問題"){
				alert("1");
			}else if(selectText === "○×問題"){
				alert("2");
			}else if(selectText === "一問一答"){
				alert("3");
			}else if(selectText === "穴埋め"){
				alert("4");
			}
		});
	});
});

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
			if(selectText === "N択問題"){
				$("#test_questions_kind").after("<br>何択か : <input type = \"text\", id = \"test_questions_sub_kind\", size = \"2\", maxlinght = \"2\", name = \"test[questions][sub_kind]\"></input><br>問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br>選択肢 : ");
			}else if(selectText === "○×問題"){
				alert("2");
			}else if(selectText === "一問一答"){
				alert("3");
			}else if(selectText === "穴埋め"){
				alert("4");
			}
		});
	});

	$("#test_questions_sub_kind").bind("change",function(){
		var choice_num = $("#test_questions_sub_kind option:selected").text();
	});
});

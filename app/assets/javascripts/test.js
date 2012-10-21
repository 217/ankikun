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
	function init(){
		$("*[name = \"test[questions][choices][choice]\"]").remove();
		$("*[name = \"test[questions][choices][right]\"]").remove();
	}

	/*ここにjQueryを記述*/
	// 動的なフォームの処理
	$("#test_questions_kind").bind("change",function(){
		$("#test_questions_kind option:selected").each(function(){
			var selectText = $("#test_questions_kind option:selected").text();
			if(selectText === "N択問題"){
				$("#test_questions_kind").after("<br>何択か : <input type = \"text\", id = \"test_questions_sub_kind\", size = \"2\", maxlinght = \"2\", name = \"test[questions][sub_kind]\"></input><br>問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br>");
			}else if(selectText === "○×問題"){
				init();
			}else if(selectText === "一問一答"){
				alert("3");
			}else if(selectText === "穴埋め"){
				alert("4");
			}
		});
	});

	// 選択肢の処理
	$("#test_questions_sub_kind").live("change",function(){
		// 選択肢数
		var choice_num = $("#test_questions_sub_kind").val();
		for(var i = 1;i <= choice_num;i++){
			if(i === 1){
				$("#test_body").after("<br>1つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice1\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right1\", name=\"test[questions][choices][right]\"></input>");
			}else{
				$("#test_questions_choices_right" + (i - 1)).after("<br>" + i + "つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + i + "\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right" + i + "\", name=\"test[questions][choices][right]\"></input>");
			}
		}
	});
});

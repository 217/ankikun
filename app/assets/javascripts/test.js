// jQuery
//
$(function(){
	// 違う選択肢が選ばれた際の初期化処理
	function init(){
		$("#sub_kind").remove();
		$("#choice").remove();
	}

	// テキストエリアを作る処理
	function createTextArea(str){
		var selectText = new String(str);
		// 問題文フォームが生成されていない場合生成
		// 要素 == null では機能しなかった
		if($("#body").size() == 0){
			// ===ではなく、==でないと通らない
			if(selectText == "N択問題"){
				// alert(selectText);
				$("#sub_kind").after("<br><div id = \"body\">問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			}else{
				$("#kind").after("<br><div id = \"body\">問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea></div>");
			}
		}
	}

	/*ここにjQueryを記述*/
	// 動的なフォームの処理
	$("#test_questions_kind").bind("change",function(){
		$("#test_questions_kind option:selected").each(function(){
			// 選択された選択肢
			var selectText = $("#test_questions_kind option:selected").text();

			if(selectText === "N択問題"){
				// タグ生成
				$("#test_questions_kind").after("<div id = \"sub_kind\"><br>何択か : <input type = \"text\", id = \"test_questions_sub_kind\", size = \"2\", maxlinght = \"2\", name = \"test[questions][sub_kind]\"></input><br></div>");
				createTextArea(selectText);
			}else if(selectText === "○×問題"){
				init();
				createTextArea(selectText);
				$("#body").after("<div id = \"TrueOrFalse\">○か×か。<input type = \"text\", id = \"test_questions_choices_right\", size = \"2\", maxlinght = \"2\", name = \"test[questions][choices][right]\"></input></div>");
			}else if(selectText === "一問一答"){
				init();
			}else if(selectText === "穴埋め"){
				init();
			}

		});
	});

	// 選択肢の処理
	$("#test_questions_sub_kind").live("change",function(){
		// 選択肢数
		var choice_num = $("#test_questions_sub_kind").val();
		for(var i = 1;i <= choice_num;i++){
			if(i === 1){
				$("#test_body").after("<br><div id = \"choice\">1つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice1\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right1\", name=\"test[questions][choices][right]\"></input>");
			}else{
				$("#test_questions_choices_right" + (i - 1)).after("<br>" + i + "つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + i + "\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right" + i + "\", name=\"test[questions][choices][right]\"></input>");
			}
			// divの終了タグ
			if(i === choice_num){
				$("#test_questions_choices_right" + choice_num).after("</div>");
			}
		}
	});
});

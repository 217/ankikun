// jQueryのソース
//
$(function(){
	// テキストエリアを生成
	function createTextArea(selectText, questionNum){
		// JavaScriptのおまじないらしい。
		// 仕様を知らない
		var selectText = new String(selectText);
		var questionNum = new Number(questionNum);

		if($("#body" + questionNum) != 0){
			if(selectText == "N択問題"){
				$("#sub_kind" + questionNum).after("<div id = \"body" + questionNum + "\">問題文<br><textarea cols=\"40\" id=\"test_body" + questionNum + "\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			}
		}
	}

	// N択問題の選択肢の生成
	function createChoices(choiceNum,questionNum){
		var choiceNum = new Number(choiceNum);
		var questionNum = new Number(questionNum);
		// 選択肢数
		var choice_num = $("#test_questions_sub_kind").val();

		/*
		// 選択肢の数だけフォームを生成
		for(var i = 1;i <= choice_num;i++){
			if(i === 1){
				$("#test_body").after("<br><div id = \"choice\">1つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice1\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right1\", name=\"test[questions][choices][right]\"></input>");
			}else{
				$("#test_questions_choices_right" + (i - 1)).after("<br>" + i + "つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + i + "\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\" /> <input type = \"checkbox\" id = \"test_questions_choices_right" + i + "\", name=\"test[questions][choices][right]\" />");
			}

			// divの終了タグと送信ボタン
			// ここも、===ではなく、==。(文字と数値の為)
			if(i == choice_num){
				$("#test_questions_choices_right" + choice_num).after("</div><br><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}
			*/
		}
	}

	// 最初からあるフォームに対する処理
	// すべての要素の末尾に1を付加
	$("#test_questions_kind1").bind("change",function(){
		var selectText = $(this).val();

		if(selectText === "N択問題"){
			$(this).after("<div id = \"sub_kind1\">何択か : <input type = \"text\" id = \"test_questions_sub_kind1\" size = \"2\", maxlinght = \"2\" name = \"test[questions][sub_kind]\" /></div>");	
			createTextArea(selectText,1);
		}else if(selectText === "○×問題"){

		}else if(selectText === "一問一答"){
		
		}else if(selectText === "穴埋め"){
		
		}
	});


});

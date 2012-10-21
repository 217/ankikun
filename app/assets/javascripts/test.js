// jQueryのソース
//
$(function(){
	var question_num = 1;

	// 違う選択肢が選ばれた際の初期化処理
	function init(){
		// N択問題で出来た選択肢の削除
		$("#sub_kind").remove();
		$("#choice").remove();

		// ○×問題で出来たのを削除
		$("#TrueOrFalse").remove();

		// 一問一答で出来たのを削除
		$("#right").remove();

		// 送信ボタンを削除
		$("input[name = \"commit\"]").remove();
		// 問題追加ボタンを削除
		$("#add").remove();
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
				$("#sub_kind").after("<div id = \"body\">問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			}else{
				$("#test_questions_kind").after("<br><div id = \"body\">問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			}
		}
	}

	// 動的なフォームの処理
	$("#test_questions_kind").bind("change",function(){
		$("#test_questions_kind option:selected").each(function(){
			// 選択された選択肢
			var selectText = $("#test_questions_kind option:selected").text();

			if(selectText === "N択問題"){
				init();
				// タグ生成
				$("#test_questions_kind").after("<div id = \"sub_kind\">何択か : <input type = \"text\" id = \"test_questions_sub_kind\" size = \"2\", maxlinght = \"2\" name = \"test[questions][sub_kind]\" /></div>");
				createTextArea(selectText);
			}else if(selectText === "○×問題"){
				init();
				createTextArea(selectText);
				$("#body").after("<div id = \"TrueOrFalse\">○か×か。<input type = \"text\" id = \"test_questions_choices_right\" size = \"2\" maxlinght = \"2\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}else if(selectText === "一問一答"){
				init();
				createTextArea(selectText);
				$("#body").after("<div id = \"right\">正解は、<input type = \"text\" id = \"test_questions_choices_right\" size = \"16\" maxlinght = \"16\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}else if(selectText === "穴埋め"){
				init();
				createTextArea(selectText);
				$("#body").after("<input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}
		});
	});

	// N択の選択肢の処理
	$("#test_questions_sub_kind").live("change",function(){
		// 選択肢数
		var choice_num = $("#test_questions_sub_kind").val();
		
		// 選択肢の数だけフォームを生成
		for(var i = 1;i <= choice_num;i++){
			if(i === 1){
				$("#test_body").after("<br><div id = \"choice" + question_num + "\">1つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice1\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right1\", name=\"test[questions][choices][right]\"></input>");
			}else{
				$("#test_questions_choices_right" + (i - 1)).after("<br>" + i + "つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + i + "\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\" /> <input type = \"checkbox\" id = \"test_questions_choices_right" + i + "\", name=\"test[questions][choices][right]\" />");
			}

			// divの終了タグと送信ボタン
			// ここも、===ではなく、==。(文字と数値の為)
			if(i == choice_num){
				$("#test_questions_choices_right" + choice_num).after("</div><br><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}
		}
	});

	// 問題追加ボタンが押された場合の処理
	$("#add").live("click",function(){
		// 不要なボタンの削除
		$("#add").remove();
		$("input[name = \"commit\"]").remove();

		// N択の場合
		if($("#choice") != 0){
			$("#choice" + question_num).after("<option id = test_questions_kind1")
		}else{
			$("#")("<select id = \"test_questions_kind" + question_num + "\"><option value="">選択してください</option><option value=\"N択問題\">N択問題</option><option value=\"○×問題\">○×問題</option><option value=\"一問一答\">一問一答</option><option value=\"穴埋め\">穴埋め</option>");
		}
	});
});

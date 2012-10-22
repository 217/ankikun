// jQueryのソース
// 変数の付け方がごちゃごちゃになっているのであとでcamelCaseに統一。
$(function(){
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
	function createTextArea(questionNum,selectText){
		var questionNum = new Number(questionNum);
		var selectText = new String(selectText);
		// 問題文フォームが生成されていない場合生成
		// 要素 == null では機能しなかった
		if($("#body" + questionNum).size() == 0){
			// ===ではなく、==でないと通らない
			if(selectText == "N択問題"){
				// alert(selectText);
				$("#sub_kind" + questionNum).after("<div id = \"body"+ questionNum +"\">問題文<br><textarea cols=\"40\" id=\"test_body" + questionNum + "\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			/*
			}else{
				$("#test_questions_kind" ).after("<br><div id = \"body\">問題文<br><textarea cols=\"40\" id=\"test_body\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			*/
			}
		}
	}

	// セレクトを一括取得
	$("select").each(function(){
		// /^test_questions_kind[0-9]*$/ にヒットするものを実行
		$("#" + $(this).attr("id").match(/^test_questions_kind[0-9]*$/)).live("change",function(){
			// 選んだ文字列
			var selectText = $(this).val();
			// 問題番号
			var question_num = $(this).attr("id").split(/^test_questions_kind/);
			
			if(selectText === "N択問題"){
				init();
				// タグ生成
				$(this).after("<div id = \"sub_kind" + question_num + "\">何択か : <input type = \"text\" id = \"test_questions_sub_kind" + question_num + "\" size = \"2\", maxlinght = \"2\" name = \"test[questions][sub_kind]\" /></div>");
				createTextArea(question_num,selectText);
				/*
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
				*/
			}
			// alert(typeof($this));
		});
	});
});

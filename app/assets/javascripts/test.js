// jQueryのソース
// 変数の付け方がごちゃごちゃになっているのであとでcamelCaseに統一。
$(function(){
	// 違う選択肢が選ばれた際の初期化処理
	function init(questionNum){
		var questionNum = new Number(questionNum);

		// N択問題で出来た選択肢の削除
		$("#sub_kind" + questionNum).remove();
		$("#choice" + questionNum).remove();

		// ○×問題で出来たのを削除
		$("#TrueOrFalse" + questionNum).remove();

		// 一問一答で出来たのを削除
		$("#right" + questionNum).remove();

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
			}else{
				$("#test_questions_kind" + questionNum).after("<br><div id = \"body" + questionNum + "\">問題文<br><textarea cols=\"40\" id=\"" + test_body + "\" name=\"test[body]\" rows=\"20\"></textarea><br></div>");
			}
		}
	}

	// セレクトを一括取得
	$("select").each(function(){
		// /^test_questions_kind[0-9]*$/ にヒットするものを実行
		$("#" + $(this).attr("id").match(/^test_questions_kind[0-9]+$/)).live("change",function(){
			// 選んだ文字列
			var selectText = $(this).val();	
			// 問題番号
			var questionNum = $(this).attr("id").replace(/^test_questions_kind/,"");
			
			if(selectText === "N択問題"){
				init();
				// タグ生成
				$(this).after("<div id = \"sub_kind" + questionNum + "\">何択か : <input type = \"text\" id = \"test_questions_sub_kind" + questionNum + "\" size = \"2\", maxlinght = \"2\" name = \"test[questions][sub_kind]\" /></div>");
				createTextArea(questionNum,selectText);
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

	$("input").each(function(){
		// 選択肢の処理
		if(!($(this).attr("id") === undefined)){
			alert("hoge");
			$("#" + $(this).attr("id").match(/^test_questions_sub_kind[0-9]+$/)).live("change",function(){
				// 選択肢数
				var choiceNum = $(this).val();
				// 問題番号
				var questionNum = $(this).attr("id").replace(/^test_questions_sub_kind/,"");

				// 選択肢の数だけフォームを生成
				for(var i = 1;i <= choiceNum;i++){
					if(i === 1){
						$("#test_body" + questionNum).after("<br><div id = \"choice" + questionNum + "_1\">1つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + questionNum + "_1\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\"></input> <input type = \"checkbox\" id = \"test_questions_choices_right" + questionNum +"_1\", name=\"test[questions][choices][right]\"></input>");
					}else{
						$("#test_questions_choices_right" + questionNum + "_" + (i - 1)).after("<br>" + i + "つ目の選択肢 : <input type = \"text\", id = \"test_questions_choices_choice" + questionNum + "_" + i + "\", size = \"128\", maxlinght = \"256\", name = \"test[questions][choices][choice]\" /> <input type = \"checkbox\" id = \"test_questions_choices_right" + questionNum + "_" + i + "\", name=\"test[questions][choices][right]\" />");
					}	

					// divの終了タグと送信ボタン
					// ここも、===ではなく、==。(文字と数値の為)
					if(i == choice_num){
						$("#test_questions_choices_right" + choice_num).after("</div><br><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
					}
				}
			});
		}
	});
});

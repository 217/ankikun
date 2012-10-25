// jQueryのソース
//
// HTMLの書き方が混ざっているのは仕様です
// 
$(function(){
	// 違う選択肢が選ばれた際の初期化処理
	function init(questionId){
		// N択問題で出来た選択肢の削除
		$("#sub_kind" + questionId).remove();
		$("#choice" + questionId).remove();

		// ○×問題で出来たのを削除
		$("#TrueOrFalse" + questionId).remove();

		// 一問一答で出来たのを削除
		$("#right" + questionId).remove();

		// 問題文を削除
		$("#body" + questionId).remove();

		// 送信ボタンを削除
		$("input[name = \"commit\"]").remove();
		// 問題追加ボタンを削除
		$("#add").remove();
	}

	// テキストエリアを生成
	function createTextArea(selectId, questionId){
		// JavaScriptのおまじないらしい。
		// 仕様を知らない
		var selectId = new Number(selectId);
		var questionId = new Number(questionId);

		if($("#body" + questionId) != null){
			// === ではなく、== 。
			if(selectId == 1){
				$("#sub_kind" + questionId).after("<div id = \"body" + questionId + "\">問題文<br><textarea cols=\"40\" name=\"question[" + questionId + "][body]\" rows=\"20\"></textarea><br></div>");
			}else{
				$("#test_questions_kind" + questionId).after("<br><div id = \"body"+ questionId + "\">問題文<br><textarea cols=\"40\" name=\"question[" + questionId + "][body]\" rows=\"20\"></textarea><br></div>");
			}
		}
	}

	// N択問題の選択肢の生成
	function createChoices(questionId){
		var questionId = new Number(questionId);
		var choiceNum = $("input[name = \"question[" + questionId + "][sub_kind]\"]").val();
				
		// 選択肢の数だけフォームを生成
		for(var i = 1;i <= choiceNum;i++){
			if(i === 1){
				$("#body" + questionId).after("<div id = \"choice" + questionId + "\">1つ目の選択肢 : <input type = \"text\" size = \"128\", maxlinght = \"256\", name = \"question[" + questionId + "][choices][" + i + "][choice]\" /> <input type = \"checkbox\" name=\"question[" + questionId + "][choices][" + i + "][right]\" />");
			}else{
				$("input[name = \"question[" + questionId + "][choices][" + (i - 1) + "][right]\"]").after("<br>" + i + "つ目の選択肢 : <input type = \"text\" size = \"128\", maxlinght = \"256\", name = \"question[" + questionId + "][choices][choice" + i + "]\" /> <input type = \"checkbox\" name=\"question[" + questionId +"][choices][" + i + "][right]\" />");
			}

			// divの終了タグと送信ボタン
			// ここも、===ではなく、==。(文字と数値の為)
			if(i == choiceNum){
				$("input[name = \"question[" + questionId + "][choices][" + i + "][right]\"]").after("</div><br><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}
		}
		addEvent(questionId);
	}

	// add(追加ボタン)にイベントを追加
	function addEvent(questionId){
		// addの前の問題番号
		var questionId = new Number(questionId);

		var tag = "<div id = \"form" + (questionId + 1) + "\">" + (questionId + 1) + "問目<br />問題形式 : <select name = \"test[questions][kind" + questionId + "]\"><option value=\"\">選択してください</option><option value=\"N択問題\">N択問題</option><option value=\"○×問題\">○×問題</option><option value=\"一問一答\">一問一答</option><option value=\"穴埋め\">穴埋め</option></select><br /></div>";
		
		$("#add").bind("click",function(){
			// 送信ボタンを削除
			$("input[name = \"commit\"]").remove();
			// 問題追加ボタンを削除
			$("#add").remove();
			$("#form" + questionId).after(tag);
			createForm(questionId + 1);
		});
	}
	
	function createForm(questionId){
		var questionId = new Number(questionId);
	
		$("select[name = \"question["+ questionId + "][kind]\"]").bind("change",function(){
			var selectId = $(this).val();

			// N択問題を表す1
			if(selectId == 1){
				init(questionId);
				$(this).after("<div id = \"sub_kind" + questionId  + "\">何択か : <input type = \"text\" name = \"question[" + questionId + "][sub_kind]\" size = \"2\", maxlinght = \"2\" /></div>");
				createTextArea(selectId,questionId);
				$("input[name = \"question[" + questionId + "][sub_kind]\"]").bind("change",function(){
					createChoices(questionId);
				});

			}else if(selectId === "○×問題"){
				init(questionId);
				createTextArea(selectId,questionId);
				$("#body" + questionId).after("<div id = \"TrueOrFalse" + questionId + "\">○か×か。<input type = \"text\" id = \"test_questions_choices_right" + questionId + "\" size = \"2\" maxlinght = \"2\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
				addEvent(questionId);
			}else if(selectId === "一問一答"){
				init(questionId);
				createTextArea(selectId,questionId);
				$("#body" + questionId).after("<div id = \"right" + questionId + "\">正解は、<input type = \"text\" id = \"test_questions_choices_right" + questionId + "\" size = \"16\" maxlinght = \"16\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");

				addEvent(questionId);
			}else if(selectId === "穴埋め"){
				init(questionId);
				createTextArea(selectId,questionId);
				$("#body" + questionId).after("<input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");

				addEvent(questionId);
			}
		});
	}

	// 最初からあるフォームに対する処理
	createForm(0);
});


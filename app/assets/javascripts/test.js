// jQueryのソース
//
// HTMLの書き方が混ざっているのは仕様です。
$(function(){
	// 違う選択肢が選ばれた際の初期化処理
	function init(questionNum){
		// N択問題で出来た選択肢の削除
		$("#sub_kind" + questionNum).remove();
		$("#choice" + questionNum).remove();

		// ○×問題で出来たのを削除
		$("#TrueOrFalse" + questionNum).remove();

		// 一問一答で出来たのを削除
		$("#right" + questionNum).remove();

		// 問題文を削除
		$("#body" + questionNum).remove();

		// 送信ボタンを削除
		$("input[name = \"commit\"]").remove();
		// 問題追加ボタンを削除
		$("#add").remove();
	}

	// テキストエリアを生成
	function createTextArea(selectText, questionNum){
		// JavaScriptのおまじないらしい。
		// 仕様を知らない
		var selectText = new String(selectText);
		var questionNum = new Number(questionNum);

		if($("#body" + questionNum) != null){
			if(selectText == "N択問題"){
				$("#sub_kind" + questionNum).after("<div id = \"body" + questionNum + "\">問題文<br><textarea cols=\"40\" name=\"test[questions][body" + questionNum +"]\" rows=\"20\"></textarea><br></div>");
			}else{
				$("#test_questions_kind" + questionNum).after("<br><div id = \"body"+ questionNum + "\">問題文<br><textarea cols=\"40\" name=\"test[questions][body" + questionNum + "]\" rows=\"20\"></textarea><br></div>");
			}
		}
	}

	// N択問題の選択肢の生成
	function createChoices(questionNum){
		var questionNum = new Number(questionNum);
		var choiceNum = $("input[name = \"test[questions" + questionNum + "][sub_kind]\"]").val();
				
		// 選択肢の数だけフォームを生成
		for(var i = 1;i <= choiceNum;i++){
			if(i === 1){
				$("#body" + questionNum).after("<div id = \"choice" + questionNum + "\">1つ目の選択肢 : <input type = \"text\" size = \"128\", maxlinght = \"256\", name = \"test[questions" + questionNum + "][choices" + i + "][choice]\" /> <input type = \"checkbox\" name=\"test[questions" + questionNum + "][choices" + i + "][right]\" />");
			}else{
				alert("a");
				$("input[name = \"test[questions" + questionNum + "][choices" + (i - 1) + "][right]\"]").after("<br>" + i + "つ目の選択肢 : <input type = \"text\" size = \"128\", maxlinght = \"256\", name = \"test[questions" + questionNum + "][choices][choice" + i + "]\" /> <input type = \"checkbox\" name=\"test[questions" + questionNum +"][choices" + i + "][right]\" />");
			}

			// divの終了タグと送信ボタン
			// ここも、===ではなく、==。(文字と数値の為)
			if(i == choiceNum){
				$("input[name = \"test[questions" + questionNum + "][choices" + choiceNum + "][right]\"]").after("</div><br><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
			}
		}
		addEvent(questionNum);
	}

	// add(追加ボタン)にイベントを追加
	function addEvent(questionNum){
		// addの前の問題番号
		var questionNum = new Number(questionNum);

		var tag = "<div id = \"form" + (questionNum + 1) + "\">" + (questionNum + 1) + "問目<br />問題形式 : <select name = \"test[questions][kind" + questionNum + "]\"><option value=\"\">選択してください</option><option value=\"N択問題\">N択問題</option><option value=\"○×問題\">○×問題</option><option value=\"一問一答\">一問一答</option><option value=\"穴埋め\">穴埋め</option></select><br /></div>";
		
		$("#add").bind("click",function(){
			// 送信ボタンを削除
			$("input[name = \"commit\"]").remove();
			// 問題追加ボタンを削除
			$("#add").remove();
			$("#form" + questionNum).after(tag);
			createForm(questionNum + 1);
		});
	}
	
	function createForm(questionNum){
		var questionNum = new Number(questionNum);

		$("select[name = \"test[questions"+ questionNum + "][kind]\"]").bind("change",function(){
			var selectText = $(this).val();
			
			if(selectText === "N択問題"){
				init(questionNum);
				$(this).after("<div id = \"sub_kind" + questionNum  + "\">何択か : <input type = \"text\" name = \"test[questions" + questionNum + "][sub_kind]\" size = \"2\", maxlinght = \"2\" /></div>");
				createTextArea(selectText,questionNum);
				$("input[name = \"test[questions" + questionNum + "][sub_kind]\"]").bind("change",function(){
					createChoices(questionNum);
				});

			}else if(selectText === "○×問題"){
				init(questionNum);
				createTextArea(selectText,questionNum);
				$("#body" + questionNum).after("<div id = \"TrueOrFalse" + questionNum + "\">○か×か。<input type = \"text\" id = \"test_questions_choices_right" + questionNum + "\" size = \"2\" maxlinght = \"2\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\" /><input type = \"button\" value = \"問題を追加\" id = \"add\" />");
				addEvent(questionNum);
			}else if(selectText === "一問一答"){
				init(questionNum);
				createTextArea(selectText,questionNum);
				$("#body" + questionNum).after("<div id = \"right" + questionNum + "\">正解は、<input type = \"text\" id = \"test_questions_choices_right" + questionNum + "\" size = \"16\" maxlinght = \"16\" name = \"test[questions][choices][right]\" /></div><input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");

				addEvent(questionNum);
			}else if(selectText === "穴埋め"){
				init(questionNum);
				createTextArea(selectText,questionNum);
				$("#body" + questionNum).after("<input name=\"commit\" type=\"submit\" value=\"送信\"/><input type = \"button\" value = \"問題を追加\" id = \"add\" />");

				addEvent(questionNum);
			}
		});
	}

	// 最初からあるフォームに対する処理
	createForm(1);
});

